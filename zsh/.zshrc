source ~/.zshenv
source ~/.zshsetup

# opam configuration
[[ ! -r ~/.opam/opam-init/init.zsh ]] || source ~/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# alias
alias ll="ls -lah"
alias vim="nvim"
alias n="nvim ."
alias clear_scroll="clear && printf '\e[3J'"

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

# alacritty
if [[ -v commands[alacritty] ]] then
    alacritty_big_font () {
        alacritty msg config "font.size=25.5"
    }
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

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba shell init' !!
export MAMBA_EXE='/opt/homebrew/bin/mamba';
export MAMBA_ROOT_PREFIX='/Users/golden_water/.mamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias mamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
