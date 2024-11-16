source ~/.zshenv
source ~/.zshsetup

# opam configuration
[[ ! -r ~/.opam/opam-init/init.zsh ]] || source ~/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# alias
alias ll="ls -lah"
alias vim="nvim"
alias n="nvim ."

# vi keybinding
bindkey -v

# kubectl
# source <(kubectl completion zsh)

# zoxide
if [[ -v commands[zoxide] ]] then
    eval "$(zoxide init zsh --cmd cd)"
fi

# fnm
if [[ -v commands[fnm] ]] then
    eval "`fnm env`"
fi

# zen browser, open file in cli
__ZEN_EXECUTABLE_PATH="/Applications/Zen Browser.app/Contents/MacOS/zen"
if [[ -e $__ZEN_EXECUTABLE_PATH ]] then
    function zen_file () {
        if [[ ! -z $1 ]] then
            $__ZEN_EXECUTABLE_PATH file://$(realpath $1)
        else
            echo Empty file path to open
        fi
    }
fi

# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/mambaforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/mambaforge/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/mambaforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/mambaforge/base/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/opt/homebrew/Caskroom/mambaforge/base/etc/profile.d/mamba.sh" ]; then
    . "/opt/homebrew/Caskroom/mambaforge/base/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<
