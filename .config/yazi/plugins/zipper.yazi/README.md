# zipper.yazi

Interactive "zip the contents of this directory" for [yazi](https://yazi-rs.github.io).

Bound to `<A-z>` in `keymap.toml`.

## Flow

1. **Source** — the hovered entry if it's a directory, otherwise the current directory.
2. **Pick entries** — fzf list of that dir's top-level entries (dirs first, with sizes).
   Everything is selected by default.
   `↑/↓` move · `space` toggle · `ctrl-a` all · `ctrl-d` none · `enter` confirm · `esc` cancel
3. **Compression** — `deflate` (normal, `-6`), `maximum` (`-9`) or `store` (`-0`).
4. **Archive name** — defaults to `<dirname>.zip` (or `<filename>.zip` when a single entry
   is picked). Editable with readline; `.zip` is appended if missing.
5. **Output dir** — defaults to yazi's cwd. Editable, `~` expands, created if missing.
6. **Collision** — if the target exists: overwrite / auto-suffix (`name-1.zip`) / cancel.
7. **Back to yazi immediately** — the zip itself runs in a detached worker, so the UI
   returns to where you were. You get a `Zipping N item(s) → x.zip` notification on
   hand-off and a `Created x.zip (size)` (or `Failed to create …`) one when it's done.

Directories are added recursively; entry paths are stored relative to the source dir,
so the archive has no leading `foo/bar/` noise. Symlinks are stored as their target's
content (Info-ZIP default).

## Files

- `main.lua` — picks the source dir and runs `zipper.sh` as a blocking shell; also
  serves as the notification sink (`plugin zipper 'notify <level> "<msg>"'`).
- `zipper.sh` — the interactive front-end, plus a `--worker` mode that does the
  zipping detached and reports back with `ya emit`.

## Requires

`fzf`, `zip`, `find` (GNU `-printf`), `awk`.
