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
    (hubble)   PS1='\t ${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ ';;
    (pollux)   PS1='\[\033[35m\]\t\[\033[m\]-\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ ';;
    (ny1)      PS1='\t ${debian_chroot:+($debian_chroot)}\[\033[01;36m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ ';;
    (dev-rhel-00)PS1='\[\e[00;35m\] \t ${debian_chroot:+($debian_chroot)}[\[\e[0;32m\]\u@\h\[\e[00;35m\]](\w)\n\$ \[\e[0m\]';;
    (gitlab*) PS1='\t ${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ ' ;;
    (ubu*)       PS1='\t ${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ ';;
    (mint*)     PS1='\[\033[m\]|\[\033[1;35m\]\t\[\033[m\]|\[\e[1;31m\]\u\[\e[1;36m\]\[\033[m\]@\[\e[1;36m\]\h\[\033[m\]:\[\e[0m\]\[\e[1;32m\][\w]> \[\e[0m\]';;	
    (r*)	    PS1="\[\033[m\]|\[\033[1;35m\]\t\[\033[m\]|\[\e[1;31m\]\u\[\e[1;36m\]\[\033[m\]@\[\e[1;36m\]\h\[\033[m\]:\[\e[0m\]\[\e[1;32m\][\W]> \[\e[0m\]";;
	(thunix)   PS1='\t \[$(tput bold)\]\[\033[38;5;1m\]\u\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;11m\]@\h:\[$(tput sgr0)\]\[\033[38;5;33m\][\[$(tput sgr0)\]\[\033[38;5;39m\]\w\[$(tput sgr0)\]\[\033[38;5;33m\]]\[$(tput sgr0)\]\[\033[38;5;15m\]$ \[$(tput sgr0)';;
	(pve)      PS1='\[\033[0m\]\[\033[0;31m\].:\[\033[0m\]\[\033[1;30m\][\[\033[0m\]\[\033[0;28m\]Managing \033[1;31m\]\j\[\033[0m\]\[\033[1;30m\]/\[\033[0m\]\[\033[1;31m\]$(ps ax | wc -l | tr -d '\'' '\'')\[\033[0m\]\[\033[1;30m\] \[\033[0m\]\[\033[0;28m\]jobs.\[\033[0m\]\[\033[1;30m\]] [\[\033[0m\]\[\033[0;28m\]CPU Load: \[\033[0m\]\[\033[1;31m\]$(temp=$(cat /proc/loadavg) && echo ${temp%% *}) \[\033[0m\]\[\033[0;28m\]Uptime: \[\033[0m\]\[\033[1;31m\]$(temp=$(cat /proc/uptime) && upSec=${temp%%.*} ; let secs=$((${upSec}%60)) ; let mins=$((${upSec}/60%60)) ; let hours=$((${upSec}/3600%24)) ; let days=$((${upSec}/86400)) ; if [ ${days} -ne 0 ]; then echo -n ${days}d; fi ; echo -n ${hours}h${mins}m)\[\033[0m\]\[\033[1;30m\]]\[\033[0m\]\[\033[0;31m\]:.\n\[\033[0m\]\[\033[0;31m\].:\[\033[0m\]\[\033[1;30m\][\[\033[0m\]\[\033[1;31m\]$(ls -l | grep "^-" | wc -l | tr -d " ") \[\033[0m\]\[\033[0;28m\]files using \[\033[0m\]\[\033[1;31m\]$(ls --si -s | head -1 | awk '\''{print $2}'\'')\[\033[0m\]\[\033[1;30m\]] [\[\033[0m\]\[\033[1;31m\]\u\[\033[0m\]\[\033[0;31m\]@\[\033[0m\]\[\033[1;31m\]\h \[\033[0m\]\[\033[1;34m\]\w\[\033[0m\]\[\033[1;30m\]]\[\033[0m\]\[\033[0;31m\]:.\n\[\033[0m\]\[\033[0;31m\].:\[\033[0m\]\[\033[1;30m\][\[\033[0m\]\[\033[1;31m\]\t\[\033[0m\]\[\033[1;30m\]]\[\033[0m\]\[\033[0;31m\]:. \[\033[0m\]\[\033[1;37m\]$ \[\033[0m\]';;
	(ah*)      PS1='${debian_chroot:+($debian_chroot)}\[\033[01;35m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ ';;
	# bonus colors
	# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
	# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;30m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
	# PS1='\t ${debian_chroot:+($debian_chroot)}\[\033[01;33m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ ';;
    # every other host
    (*) PS1='\t \[\e[32m\][\[\e[m\]\[\e[31m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]:\[\e[36m\]\w\[\e[m\]\[\e[32m\]]\[\e[m\]\[\e[32;90m\]\\$\[\e[m\] ';;
    #
esac

if [ `whoami` = root ]; then
 case $HOSTNAME in
   (pollux) 	PS1="\t [\[\033[32m\]\w]\[\033[0m\]\n\[\033[1;36m\]\u\[\033[1;33m\]-> \[\033[0m\]";;
   (hubble) 	PS1="\t \[\e]0;\u@\h: \w\a\]\[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]# \[\e[m\]\[\e[0;32m\]";;
   (hercules*)	PS1='\t \[$(tput bold)\]\u\[$(tput sgr0)\]@\h:\[$(tput sgr0)\]\[\033[38;5;33m\][\[$(tput sgr0)\]\[\033[38;5;39m\]\w\[$(tput sgr0)\]\[\033[38;5;33m\]]\[$(tput sgr0)\]\[\033[38;5;15m\]# \[$(tput sgr0)\]';;
   (*)		    PS1='\[\033[38;5;38m\]\u\[\]\[\033[38;5;15m\]@\[\]\[\033[38;5;172m\]\h\[\]\[\033[38;5;15m\] \[\]\w\[\]\n\[\]\[\033[38;5;41m\]#\[\]\[\033[38;5;15m\] \[\]';;
 esac
fi


#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
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

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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
if [ "`id -u`" -ne 0 ]; then
GIT_PROMPT_ONLY_IN_REPO=1
fi

# set regular path plus personal bins
export PATH=$PATH:~/.bin/

# set proper PATH  for root
if [ "`id -u`" -eq 0 ]; then
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
fi
export zmienna2=dwa
