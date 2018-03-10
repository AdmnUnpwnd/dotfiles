# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# For Antigen
source ~/.antigen/antigen.zsh

# For  Powerline Fonts
# . /usr/share/zsh/site-contrib/powerline.zsh
# powerline-daemon -q

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="gnzh"
# ZSH_THEME="agnoster"
# ZSH_THEME="bureau"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(archlinux brew cabal dircycle gitfast git-extras git-flow git-hubflow github tmux tmuxinator web-search)
plugins=()

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Antigen Bundles
antigen bundles << EOBUNDLES

	# Guess what to install when running an unknown command.
	command-not-found
	
	# Syntax highlighting bundle.
	zsh-users/zsh-syntax-highlighting
	
	# Arch Linux
	archlinux
	
	# Homebrew & Linuxbrew
	brew
	
	# Emacs Cabal
	cabal
	
	# Dircycle
	dircycle
	
	# Git & GitHub
	gitfast
	git-extras
	git-flow
	git-hubflow
	github
	
	# Tmux
	tmux
	tmuxinator

	# Web Search
	web-search
EOBUNDLES

# Antigen Theme
antigen theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme bullet-train


# Custom Path

# PSP Development
export PSPDEV=/usr/local/pspdev
export PATH=$PATH:$PSPDEV/bin

# For building AOSP
export USE_CCACHE=1
export CCACHE_DIR=~/RAC-ROM/.ccache
export AOSP=~/AOSP
export PATH=$PATH:$AOSP/bin
export PATH=~/AOSP/bin:$PATH	# This appends to the front

# For Mutt
# Sets the Mail Environment Variable
# MAIL=/var/spool/mail/ && export MAIL

# For disabling GREP_OPTIONS warning
unset GREP_OPTIONS

# For aliasing hub as git
eval "$(hub alias -s)"

# For virtualenv
source /usr/bin/virtualenvwrapper.sh
export VIRTUALENVWRAPPER_PYTHON="/usr/bin/python"

# If Skype has distorted audio
# export PULSE_LATENCY_MSEC=60

# Linuxbrew
# export PATH="$HOME/.linuxbrew/bin:$PATH"
# export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
# export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

# Cask (Emacs)
# export PATH="~/.cask/bin:$PATH"

# For Ruby Gem
export PATH=$PATH:~/.gem/ruby/2.2.0/bin

# For Steam
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH-}"

# For Cocos2D-X
export PATH=/opt/cocos2d-x/tools/cocos2d-console/bin:/opt/cocos2d-x/tools/cocos2d-console/plugins/plugin_package:${PATH}

# For Android
# export ANDROID_HOME=~/Android/Sdk
export ANDROID_HOME=/opt/android-sdk

# For NVM
source /usr/share/nvm/init-nvm.sh

# For Conscript
export CONSCRIPT_HOME="$HOME/.conscript"
export CONSCRIPT_OPTS="-Dfile.encoding=UTF-8"
export PATH=$CONSCRIPT_HOME/bin:$PATH

