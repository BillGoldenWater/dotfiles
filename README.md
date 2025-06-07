# Usage
1. clone to ~/dotfiles
2. cd ~/dotfiles
3. use stow to link:
  - NOTE: see tmux section before link if using tmux
  - zsh: `stow general zsh`
  - bash: `stow general bash`

# Tools

- alacritty
- tmux
  - tmux plugin manager 
    - avoid plugins installed into dotfiles
      - `mkdir -p ~/.config/tmux/plugins`
    - `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
- zsh
- eza
- fzf
- zoxide
- nvim
- micromamba

# Stow Installation
macOS: `brew install stow`

Ubuntu: `sudo apt install stow`