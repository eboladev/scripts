#
# Shell initializations
#

# set -x

getComputerName() {
  if [ `uname` = "Darwin" ]; then
    /usr/sbin/scutil --get ComputerName
  else
    hostname
  fi
}

trap "" 1 2 3				# Ignore HUP, INT, QUIT now
set +u					# Enable unset variables
PATH=/bin:/usr/bin                      # Initial PATH

# Set up login name
export LOGNAME USER
[ -z "$LOGNAME" ] && LOGNAME=`id -un` 
[ -z "$USER" ] && USER="$LOGNAME"

# Set up OS and OS release
OS_NAME=`uname -s` export OS_NAME
OS_REL=`uname -r` export OS_REL
OS_NAMEREL="$OS_NAME $OS_REL"

# Set up default PATH
export PATH
case "$OS_NAMEREL" in
  HP-UX*B.10.*|HP-UX*B.11.*) PATH=/sbin:/usr/bin:/usr/sbin;;
  HP-UX*)                    PATH=/bin:/usr/bin:/etc:/usr/lib;;
  Cygwin*|CYGWIN*)           PATH=/usr/bin;;
  *)                         PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin;;
esac
[ ! -z "$HOME" -a -f "$HOME"/bin ] && PATH="$PATH":"$HOME/bin"

# Set up the manual search path
MANPATH="/usr/share/man:/usr/man:/usr/local/man" export MANPATH

# Set time zone
export TZ
if [ -r /etc/src.sh ]; then
  . /etc/src.sh
  unset SYSTEM_NAME
elif [ -r /etc/TIMEZONE ]; then
  . /etc/TIMEZONE
fi

# Set up the terminal (set NOTTY to 1 in your .xsession to skip these settings)

if [ -z "$NOTTY" ]; then
  [ ! -t 0 -o ! -t 1 -o ! -n "$PS1" ] && NOTTY=1
fi
if [ -z "$NOTTY" ]; then
  stty cs8 -istrip -parenb 2>/dev/null || NOTTY=1
fi

if [ -z "$NOTTY" ]; then

  # Settings for interactive shells

  export TERM
  export ERASE

  case "$OS_NAME" in

    HP-UX)

      if [ -z "$TERM" -o "$TERM" = "dumb" -o "$TERM" = unknown ]; then
	eval `ttytype -s`
	if [ -z "$TERM" -o "$TERM" = "dumb" -o "$TERM" = unknown ]; then
	  eval `tset -s -Q -m ':?vt220'`
	fi
      fi

      case "$TERM" in
	700*|X-hpterm|x-hpterm|2392*|hpterm|A1991*|ITE*)	TERM=hp;;
	vt200)							TERM=vt220;;
	linux)							TERM=ansi;;
	xterm-color|kvt-color)					TERM=xterm;;
      esac

      [ -x /usr/bin/tabs ] && /usr/bin/tabs
  
      [ -z "$ERASE" ] && ERASE="^H"
      stty hupcl ixon ixoff -parity -istrip cs8 \
       erase $ERASE kill "^U" intr "^C" eof "^D" susp "^Z"
      ;;

    Linux)

      [ -z "$TERM" ] && TERM=console
      case "$TERM" in
	unknown|con*)					TERM=console;;
	kvt-color)					TERM=xterm-color;;
	700*|X-hpterm|x-hpterm|2392A|hpterm|A1991*)	TERM=hp;;
      esac
      ;;

  esac

  # Emacs mode doesn't work on HP terminals
  [ "$TERM" = "hp" ] && set -o vi

  # Set terminal size
  if [ -z "$LINES" -a -x /usr/X11/bin/resize ]; then
    eval `/usr/X11/bin/resize`
  fi

  # Print message of the day; notify if new news
  # [ -r /etc/motd ] && cat /etc/motd
  [ -x /usr/bin/news ] && /usr/bin/news -n
fi

# List directories only
lsd() {
  ls -F $* | grep '/$'
}

# Find processes by name
export psHead
case "$OS_NAME" in
  HP-UX)                        psHead=`ps -aefl|head -1|tr " " "_"`;;
  Linux|Darwin|Cygwin*|CYGWIN*) psHead=`ps awxl|head -1|tr " " "_"`;;
  *)                            psHead=""
esac
psg() {
  echo $psHead | tr '_' ' '
  (
  case "$OS_NAME" in
    HP-UX)                        ps -aefl;;
    Linux|Darwin|Cygwin*|CYGWIN*) ps awxl;;
  esac
  ) | grep $* | grep -v grep
}

# Aliases
alias e=xemacs
alias l='ls -al'
alias ll='ls -al'
alias ls='ls -a'
alias mk=make
alias mkae=make
alias r='fc -e -'
alias res='eval `resize`'
alias sys=sudo
alias x=xemacs

# Web proxies
if [ -r /etc/HTTP_PROXY ]; then
  HTTP_PROXY=`cat /etc/HTTP_PROXY`
  http_proxy=$HTTP_PROXY
  export HTTP_PROXY http_proxy
fi
if [ -r /etc/FTP_PROXY ]; then
  FTP_PROXY=`cat /etc/FTP_PROXY`
  ftp_proxy=$FTP_PROXY
  export FTP_PROXY ftp_proxy
fi

# Colour ls
if [ -x /usr/bin/dircolors ]; then
  if [ -r ~/.dir_colors ]; then
    eval `dircolors -b ~/.dir_colors`
  elif [ -r /etc/DIR_COLORS ]; then
    eval `dircolors -b /etc/DIR_COLORS`
  fi
fi

# Command history
HISTSIZE=1000 export HISTSIZE				# Command history
HISTFILESIZE=$HISTSIZE export HISTFILESIZE
HISTFILE=$HOME/.history export HISTFILE
HISTCONTROL=ignoredups export HISTCONTROL
case "$SHELL" in
  */bash)
    shopt -s histappend >/dev/null 2>&1
    shopt -s cmdhist >/dev/null 2>&1
    ;;
esac

# Everything else

EDITOR=vi export EDITOR					# Default editor
INFODIR=/usr/local/info:/usr/info:/usr/share/info export INFODIR
INFOPATH=$INFODIR export INFOPATH			# Location of info files
LESS=-MM export LESS					# less
# LESSCHARSET=latin1 export LESSCHARSET
MINICOM="-c on" export MINICOM				# minicom
PG='-c' export PG					# pg to clear screen
XFORCE_INTERNET=1 export XFORCE_INTERNET		# HPterm workaround
VISUAL=vi export VISUAL					# Command line editor

# OS specific settings
case "$OS_NAME" in
  HP-UX)
    if [ "$NOTTY" = "1" ]; then
      PAGER="more -s"
    else
      PAGER=more
    fi
    export PAGER
    SPEAKER=external export SPEAKER
    ;;
  *)
    PAGER=less export PAGER
    ;;
esac

# Shell type specific settings
case "$SHELL" in
  */ksh|/bin/posix/sh|*/zsh|/sbin/sh|/bin/sh|/usr/bin/sh)
    case "$LOGNAME" in
      root)	delim="#";;
      *)	delim="\$";;
    esac
    export PS1="`getComputerName`:\$PWD $delim "
    ;;

  */bash)
    export PS1="`getComputerName`"':\w \$ '
    shopt checkwinsize >/dev/null 2>&1
    ;;
esac

# Set file creation mask
# This breaks too many installers
# umask 026 

# Source profile generated by SuSEconfig
test -r /etc/SuSEconfig/profile && . /etc/SuSEconfig/profile

# Source bash configuration files
if [ "${BASH-no}" != "no" ]; then
  test -r /etc/bashrc && . /etc/bashrc
  test -r /etc/bash.bashrc && . /etc/bash.bashrc
  if [ -z "$haveCompletions" ]; then
    haveCompletions=1 export haveCompletions
    test -r /etc/bash_completion && . /etc/bash_completion
  fi
fi

# Source other customizations from /etc/profile.d
if [ -d /etc/profile.d ]; then
  for i in /etc/profile.d/*.sh; do
    test -r $i && . $i
  done
fi

# Source in the local profile, too
[ -r /etc/profile.local ] && . /etc/profile.local

# Clean up
trap 1 2 3
