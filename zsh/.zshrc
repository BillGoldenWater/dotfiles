fpath+=~/.zfunc


# region zsh things
if [[ ($TERM_PROGRAM != "Apple_Terminal") && (! -v NVIM) ]]
then
  eval "$(oh-my-posh init zsh --config ~/.oh-my-posh/custom.omp.json)"
fi

source /opt/homebrew/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
#source /opt/homebrew/opt/zsh-autosuggestions/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#bindkey '^I' autosuggest-accept
#bindkey '^ ' menu-expand-or-complete

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#zle_highlight=(default:fg=blue,bold)
# endregion

# zsh_history size
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE

# endregion

setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_DUPS

# region alias
alias zrc="nvim ~/.zshrc"
alias zenv="nvim ~/.zshenv"
alias ncfg="nvim ~/.config/nvim/init.lua"
alias down="cd ~/Downloads/"
alias ll="ls -lah"
# endregion

# >>> conda initialize >>>
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

# region kubectl
source <(kubectl completion zsh)
# endregion

eval "$(zoxide init zsh --cmd cd)"

autoload -U compinit
