#!/usr/bin/env bash
# zipper.yazi — interactive "zip this directory's contents" flow.
#
#   zipper.sh <src-dir> <default-out-dir>          interactive front-end
#   zipper.sh --worker <src> <target> <level> …    detached zip job
#
# The front-end only asks questions; the actual zipping is handed to a detached
# worker so yazi comes back immediately and reports via a notification.

set -uo pipefail

# Talk back to the yazi instance that spawned us (no-op outside yazi).
# `plugin` takes its arguments as one shell-like string, so the message is
# quoted into it; quotes/backslashes in filenames get flattened to keep it sane.
notify() { # <level> <content>
	[[ -n ${YAZI_ID:-} ]] || return 0
	local msg=${2//[\\\"]/\'}
	ya emit plugin zipper "notify $1 \"$msg\"" >/dev/null 2>&1 || true
}

# ── worker: zip, then report ─────────────────────────────────────────────────
if [[ ${1:-} == --worker ]]; then
	shift
	src=$1 target=$2 level=$3
	shift 3
	if (cd -- "$src" && zip -r -q "$level" "$target" -- "$@"); then
		notify info "Created ${target##*/} ($(du -h -- "$target" | cut -f1))"
	else
		notify error "Failed to create ${target##*/}"
	fi
	exit 0
fi

SELF=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)/$(basename -- "${BASH_SOURCE[0]}")
SRC=${1:?source dir required}
OUT_DIR=${2:-$SRC}

C_DIM=$'\033[2m'
C_RED=$'\033[31m'
C_RST=$'\033[0m'

die() {
	if [[ -n ${YAZI_ID:-} ]]; then
		notify error "$*"
	else
		printf '%s%s%s\n' "$C_RED" "$*" "$C_RST" >&2
	fi
	exit 1
}

bail() {
	[[ -n ${YAZI_ID:-} ]] || printf '%s%s%s\n' "$C_DIM" "${1:-cancelled}" "$C_RST"
	exit 0
}

command -v fzf >/dev/null || die "fzf not found"
command -v zip >/dev/null || die "zip not found"

# NUL-separated data can't live in a shell variable, so it goes through files.
TMP=$(mktemp -d) || die "cannot create temp dir"
trap 'rm -rf -- "$TMP"' EXIT

# ── 1. pick entries ──────────────────────────────────────────────────────────
# Records are NUL-separated: "<type> <size>\t<name>". Name is everything after
# the second tab, so tabs/newlines in filenames survive intact.
find "$SRC" -mindepth 1 -maxdepth 1 -printf '%y\t%s\t%f\0' 2>/dev/null |
	sort -z -t$'\t' -k1,1 -k3,3f |
	awk -v RS='\0' -F'\t' '
			{
				rest = substr($0, index($0, "\t") + 1)
				name = substr(rest, index(rest, "\t") + 1)
				type = ($1 == "d") ? "dir" : ($1 == "l") ? "link" : "file"
				if ($1 == "d") { size = "-" }
				else {
					split("B K M G T P", unit, " "); s = $2 + 0; i = 1
					while (s >= 1024 && i < 6) { s /= 1024; i++ }
					size = (i == 1) ? sprintf("%d%s", s, unit[i]) : sprintf("%.1f%s", s, unit[i])
				}
				printf "%-4s %8s\t%s%c", type, size, name, 0
			}' >"$TMP/entries"
[[ -s $TMP/entries ]] || die "nothing to zip in $SRC"

hdr="↑/↓ move · space toggle · ctrl-a all · ctrl-d none · enter confirm · esc cancel"
fzf --read0 --print0 --multi --no-sort --ansi --layout=reverse \
	--delimiter=$'\t' --with-nth=1.. \
	--bind 'load:select-all' \
	--bind 'space:toggle' \
	--bind 'ctrl-a:select-all' \
	--bind 'ctrl-d:deselect-all' \
	--marker='✓ ' --pointer='▶' \
	--height='100%' --border=rounded --border-label=" zip contents of ${SRC##*/} " \
	--prompt='include> ' --header="$hdr" \
	<"$TMP/entries" >"$TMP/picked" || bail

names=()
while IFS= read -r -d '' rec; do
	names+=("${rec#*$'\t'}")
done <"$TMP/picked"
((${#names[@]})) || bail "nothing selected"

# ── 2. compression level ─────────────────────────────────────────────────────
mode=$(
	printf '%s\n' \
		"deflate   normal compression (default)" \
		"maximum   slowest, smallest  (-9)" \
		"store     no compression, fastest (-0)" |
		fzf --no-sort --layout=reverse --height='30%' --border=rounded --border-label=' compression ' \
			--prompt='level> ' --header='↑/↓ move · enter confirm · esc cancel'
) || bail

case ${mode%% *} in
maximum) zlevel=-9 ;;
store) zlevel=-0 ;;
*) zlevel=-6 ;;
esac

# ── 3. archive name + output dir ─────────────────────────────────────────────
base=${SRC##*/}
[[ -n $base ]] || base=archive
if ((${#names[@]} == 1)); then
	base=${names[0]%.*}
	[[ -n $base ]] || base=${names[0]}
fi

printf '\n%s%d item(s) · %s%s\n' "$C_DIM" "${#names[@]}" "${mode%% *}" "$C_RST"
read -e -r -i "${base}.zip" -p "archive name : " archive || bail
[[ -n ${archive// /} ]] || bail "empty name"
[[ $archive == *.zip ]] || archive="${archive}.zip"
archive=${archive##*/} # keep it a bare filename; dir comes from the next prompt

read -e -r -i "$OUT_DIR" -p "output dir   : " dest || bail
dest=${dest/#\~/$HOME}
[[ -n ${dest// /} ]] || bail "empty output dir"
mkdir -p -- "$dest" || die "cannot create $dest"
dest=$(cd -- "$dest" && pwd) || die "cannot enter $dest"

target="$dest/$archive"

# ── 4. collision ─────────────────────────────────────────────────────────────
if [[ -e $target ]]; then
	choice=$(
		printf '%s\n' "overwrite" "rename (auto-suffix)" "cancel" |
			fzf --no-sort --layout=reverse --height='25%' --border=rounded \
				--border-label=" $archive already exists " --prompt='action> '
	) || bail
	case ${choice%% *} in
	overwrite) rm -f -- "$target" || die "cannot remove $target" ;;
	rename)
		n=1
		while [[ -e ${target%.zip}-$n.zip ]]; do ((n++)); done
		target="${target%.zip}-$n.zip"
		;;
	*) bail ;;
	esac
fi

# ── 5. hand off to a detached worker and get out of the way ──────────────────
notify info "Zipping ${#names[@]} item(s) → ${target##*/}"
setsid --fork "$SELF" --worker "$SRC" "$target" "$zlevel" "${names[@]}" \
	</dev/null >/dev/null 2>&1

# Nothing left to show — yazi redraws as soon as we exit.
if [[ -z ${YAZI_ID:-} ]]; then
	printf '%szipping in background → %s%s\n' "$C_DIM" "$target" "$C_RST"
fi
