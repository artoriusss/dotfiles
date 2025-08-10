# Helper to add paths only if they exist
add_path() { [ -d "$1" ] && PATH="$1:$PATH"; }

# OS-specific config
case "$(uname)" in
  Darwin)
    add_path "/opt/homebrew/opt/python@3.12/bin"
    add_path "/opt/homebrew/bin"
    add_path "/opt/homebrew/sbin"
    ;;
  Linux)
    add_path "/usr/local/bin"
    ;;
esac

# Common paths
add_path "$HOME/.pyenv/bin"
add_path "$HOME/.pyenv/shims"
add_path "$HOME/.pyenv/plugins/pyenv-virtualenv/shims"
add_path "$HOME/google-cloud-sdk/bin"

# Pyenv
if command -v pyenv >/dev/null; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
fi

# Conda
if command -v conda >/dev/null; then
    eval "$(conda shell.zsh hook)"
fi

# Prezto
[ -f "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ] && source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# Prompt
command -v starship >/dev/null && eval "$(starship init zsh)"

# FZF
command -v fzf >/dev/null && source <(fzf --zsh)

# Local overrides
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"


