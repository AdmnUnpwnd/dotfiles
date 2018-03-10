#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

# PSP Development
export PSPDEV=/usr/local/pspdev
export PATH=$PATH:$PSPDEV/bin

# For building AOSP
export USE_CCACHE=1
export AOSP=~/AOSP
export PATH=$PATH:$AOSP/bin
export PATH=~/AOSP/bin:$PATH	# This appends to the front

PATH="~/.conscript/bin:$PATH"
