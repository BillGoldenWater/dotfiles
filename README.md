# Usage
1. clone to ~/dotfiles
2. cd ~/dotfiles
3. use stow to link:
  - zsh: `stow general zsh`
  - bash: `stow general bash`

# Tools

- alacritty
  - dracula
    - `git clone https://github.com/dracula/alacritty ~/.themes/dracula/alacritty`
- tmux
  - tmux plugin manager 
    - `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
- zsh
- zsh-syntax-highlighting
  - dracula
    - `git clone https://github.com/dracula/zsh-syntax-highlighting ~/.themes/dracula/zsh-syntax-highlighting`
- oh-my-zsh
  - dracula
    - `git clone https://github.com/dracula/zsh ~/.themes/dracula/zsh`
    - `ln -s ~/.themes/dracula/zsh/dracula.zsh-theme ~/.oh-my-zsh/themes/dracula.zsh-theme`
- fzf
- zoxide
- nvim

# Stow Installation
macOS: `brew install stow`

Ubuntu: `sudo apt install stow`