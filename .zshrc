fpath+=${ZDOTDIR:-~}/.zsh_functions
eval "$(starship init zsh)"


alias release='~/Documents/dotfiles/release.sh'
alias vim='nvim'
alias notes='cd ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Notes'

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
