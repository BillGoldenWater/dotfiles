source ~/.zshenv
source ~/.zshsetup
# source system specific things
[ -f ~/.zshrcsys ] && source ~/.zshrcsys

# opam configuration
[[ ! -r ~/.opam/opam-init/init.zsh ]] || source ~/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# alias
alias ll="ls -lah"
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

if [[ -e ~/.motd ]] then
    typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
    cat ~/.motd
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
