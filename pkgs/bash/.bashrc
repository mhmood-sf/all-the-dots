# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Colored Prompts
PS1='\[\e[0;1;35;5;177m\]\u\[\e[0m\] @ \[\e[0;1;36;5;177m\]\W\[\e[0;0m\]\n\[\e[0;1;31;5;177m\]Ξ\[\e[0;90m\] \[\e[0m\]'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Needed for gitui to work, for some reason (?)
#eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519 > /dev/null 2>&1

# Aliases
#alias rxfetch="bash ~/Notebook/Wiki/Scripts/rxfetch.sh"
#alias panes="bash ~/Notebook/Wiki/Scripts/panes.sh"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias mv='mv -i'
alias cp='cp -i'

# FoodCLUB Tingz
export FOODCLUB_PACKAGES_TOKEN="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"

export PATH="$HOME/.config/nixos/scripts:$PATH"
