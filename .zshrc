# Add Homebrew's Python 3.12 to the front of the PATH
export PATH="/opt/homebrew/opt/python@3.12/bin:$PATH"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
# Existing PATH settings
export PATH="/usr/local/bin:$PATH"
export PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin:$PATH"
export PATH="/usr/bin:$PATH"
export PATH="/bin:$PATH"
export PATH="/usr/sbin:$PATH"
export PATH="/sbin:$PATH"
export PATH="/Users/arturshevtsov/Library/TinyTeX/bin/x86_64-darwin:$PATH"

# Pyenv settings
export PATH="/Users/arturshevtsov/.pyenv/plugins/pyenv-virtualenv/shims:$PATH"
export PATH="/Users/arturshevtsov/.pyenv/shims:$PATH"
export PATH="/Users/arturshevtsov/.pyenv/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/arturshevtsov/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/arturshevtsov/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/arturshevtsov/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/arturshevtsov/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/Users/arturshevtsov/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/Users/arturshevtsov/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init --path)"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
export PATH=$PATH:$(pwd)/bin

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/arturshevtsov/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/arturshevtsov/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/arturshevtsov/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/arturshevtsov/google-cloud-sdk/completion.zsh.inc'; fi
export PATH=$PATH:$HOME/google-cloud-sdk/bin

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
eval "$(starship init zsh)"
source <(fzf --zsh)
