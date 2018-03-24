#
# /etc/bash.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\[\e[00;32m\]\u@\h\[\e[0m\]\[\e[00;37m\] \w \[\e[0m\]\[\e[00;36m\]\\$\[\e[0m\]\[\e[00;37m\] \[\e[0m\]'
PS2='> '
PS3='> '
PS4='+ '

# LS Colors
export LS_COLORS='no=00:fi=00:di=00;35:ln=00;36:pi=40;33:so=00;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;32:*.cmd=00;32:*.exe=00;32:*.com=00;32:*.btm=00;32:*.bat=00;32:*.sh=00;32:*.csh=00;32:*.tar=00;31:*.tgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.bz=00;31:*.tz=00;31:*.rpm=00;31:*.cpio=00;31:*.jpg=00;35:*.gif=00;35:*.bmp=00;35:*.xbm=00;35:*.xpm=00;35:*.png=00;35:*.tif=00;35:'

case ${TERM} in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'

    ;;
  screen)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
    ;;
esac

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

# Editor
export VISUAL=vim
export EDITOR="$VISUAL"

# Notifications
[ -r ~/.bash_notifications ] && . ~/.bash_notifications

# Aliases
[ -r ~/.bash_aliases ] && . ~/.bash_aliases

# Machine Specific bashrc
[ -r ~/.bashrc_local ] && . ~/.bashrc_local

# Disable flow control keys
stty ixany
stty ixoff -ixon

export LANG=C.UTF-8

export SVN_EDITOR=vim

export PATH=~/.bin/:$PATH
