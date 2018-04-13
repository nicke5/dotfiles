# .bashrc
#==============================================================================
# GLOBAL DEFINITIONS
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
            . /etc/bash_completion
fi

#==============================================================================
# LOCAL BIN PATH
export PATH=~/bin:$PATH

#==============================================================================
# HISTORY OPTIONS
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+.}ignoredups
export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT="%D-%H:%M> "
shopt -s histappend histreedit histverify


#==============================================================================
# ENABLE OPTIONS
shopt -s cdspell
shopt -s cdable_vars
shopt -s checkhash
shopt -s checkwinsize
shopt -s sourcepath
shopt -s no_empty_cmd_completion
shopt -s cmdhist
shopt -s extglob

#==============================================================================
# ALIASES
# Reference seperate bash aliases file

if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
fi

#==============================================================================
# PROMPTS
# If not running interactively, don't do anything
[ -z "$PS1" ] && return
# Colored prompt in a more useful format
force_color_prompt=yes
red='\e[0;31m'
RED='\e[1;31m'
blue='\e[0;34m'
BLUE='\e[1;34m'
cyan='\e[0;36m'
CYAN='\e[1;36m'
YELLOW='\e[33;33m'
NC='\e[0m'

export PS1="$BLUE[$RED\u$BLUE@\h]: \w\n[\t]\n==>  \[$NC\]"
export PS4='$LINENO+ '

#==============================================================================

