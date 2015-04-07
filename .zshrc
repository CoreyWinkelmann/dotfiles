# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="cagenix"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew github history-substring-search zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# export PATH=/usr/local/Cellar/php53/5.3.29/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:${PATH}
# export GEM_HOME=$HOME/.gem
# export PATH=$GEM_HOME/bin:$PATH
# export PATH=~/.cabal/bin:$PATH

alias getmyip='dig +short myip.opendns.com @resolver1.opendns.com'
