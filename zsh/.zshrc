[ -f ~/.oh-my-zsh.zsh ] && source ~/.oh-my-zsh.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fpath+=~/.zfunc

# syntax highlighting
source ~/.themes/dracula/zsh-syntax-highlighting/zsh-syntax-highlighting.sh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh_history size
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE
setopt inc_append_history share_history

setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_DUPS

# alias
alias ll="ls -lah"
alias vim="nvim"

# kubectl
source <(kubectl completion zsh)

# zoxide
eval "$(zoxide init zsh --cmd cd)"

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
