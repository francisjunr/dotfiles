fpath+=${ZDOTDIR:-~}/.zsh_functions

# Enable starship terminal prompt
eval "$(starship init zsh)"

# change the default vimrc location
export XDG_CONFIG_HOME=~/personal/dotfiles/.config

# change the default kitty config location
export KITTY_CONFIG_DIRECTORY=~/personal/dotfiles/.config/kitty

# Aleases
alias release='~/personal/dotfiles/release.sh'
alias vim='nvim'
alias on='vim ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Notes'
alias note='~/personal/dotfiles/new_note.sh'
alias dn='~/personal/dotfiles/daily_note.sh'

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Auto-completion for zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
