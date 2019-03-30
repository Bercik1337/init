# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then

case $HOSTNAME in
    (hubble)  PS1='\t ${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ ';;
    (pollux)  PS1="\[\033[35m\]\t\[\033[m\]-\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ ";;
    (thunix)  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;36m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ ';;
	# bonus colors
	# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;35m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
	# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    (*) PS1='${debian_chroot:+($debian_chroot)}\[\033[01;33m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ ';;
	# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
	# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
	# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;30m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
esac

if [ "$USER" = root ]; then
PS1="[\[\033[32m\]\w]\[\033[0m\]\n\[\033[1;36m\]\u\[\033[1;33m\]-> \[\033[0m\]"
fi


else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more aliases
alias cal='cal -m'
alias a='last -10'
alias grep='grep --color=auto'
alias htop='htop -u $USER'
alias rsync='rsync --progress'
alias sP='sudo systemctl stop'
alias sR='sudo systemctl restart'
alias sS='sudo systemctl status'
alias sT='sudo systemctl start'
alias xz='xz -T 0'
alias fup='sudo apt-get update;sudo apt-get upgrade -y;sudo apt-get autoclean;sudo apt-get autoremove;sudo apt-get clean'
alias rtorrent2='rtorrent -n -o import=~/.rtorrent-stare.rc'
alias rhash='rhash --percents --speed'

alias ll='ls -lh --color=auto'
alias la='ls -Ah'
alias lla='ls -lah'
alias l='ls -CFh'
alias lx='ls -lhX'			# by ext alphabetically
alias lt='ls -lht'			# newest to oldest
alias lk='ls -lrth'			# oldest to newest
alias lS='ls -lSrh'			# smallest to biggest
alias lg='ls -lh | grep'		# ls with grep
alias findold='find . -atime'
#serwery
alias platinum='ssh -i ~/.ssh/platinum platinum.edu.pl'
alias sshfsexidia='sshfs -o follow_symlinks exidia:/home/bercik /mnt/exidia/'
alias sshfsleotia='sshfs -o follow_symlinks leotia:/home/bercik/ /mnt/leotia'
alias sshfsplatinum='sshfs -o follow_symlinks platinum:/home/bercik /mnt/platinum'
alias sshfsthunix='sshfs -o follow_symlinks thunix:/home/b/bercik/ /mnt/thunix'


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
# ---- language-env DON'T MODIFY THIS LINE!

# Do not attempt to set the locale for an UXTerm session.
# UXTerm sets it locale environment automagically.
if [ -z "\$UXTERM" ]; then
    export LANG="pl_PL"
fi
# Signal the existence of UXTerm.
alias uxterm='UXTERM=yes uxterm'


#export MM_CHARSET="iso-8859-2"
#export SP_CHARSET="iso-8859-2"
#Timezone for Warsaw
export TZ='/usr/share/zoneinfo/Europe/Warsaw'
# ---- language-env end DON'T MODIFY THIS LINE!
#### GIT bash
GIT_PROMPT_ONLY_IN_REPO=1
source ~/.bash-git-prompt/gitprompt.sh
export PATH=$PATH:~/.bin/

