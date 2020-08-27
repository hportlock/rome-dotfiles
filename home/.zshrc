# Load antigen
source $HOME/.antigen/antigen.zsh

# Load oh-my-zsh
antigen use oh-my-zsh

# Bundles from oh-my-zsh
antigen bundle git
antigen bundle osx
antigen bundle vi-mode

# Set zsh theme
antigen theme robbyrussell

# Custom zsh stuff
antigen bundle $HOME/.zsh-custom

antigen apply

# Setup rbenv
eval "$(rbenv init -)"

# Use nvim as the default editor
export EDITOR="nvim"

export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PATH="$PATH:$HOME/.local/bin"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Add Sqllite from homebrew
export PATH="/usr/local/opt/sqlite/bin:$PATH"

export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# Needed to make ctrl-R work with vi-mode enabled
bindkey '^R' history-incremental-search-backward

# Setup nvm
export NVM_DIR="$HOME/.nvm"
# Use homebrew version
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Easily jump to the root of git directories
alias gr='[ ! -z $(git rev-parse --show-toplevel) ] && cd $(git rev-parse --show-toplevel || pwd)'

# Integrate with the iterm2 shell
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Alias neovim to vim
alias vim="nvim"
alias vi="nvim"
alias vimdiff="nvim -d"
export PATH="/usr/local/opt/libpq/bin:$PATH"

# Alias tmuinator
alias mux="tmuxinator"
