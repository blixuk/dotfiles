# START
# Splash Screen
sh ~/.scripts/wolf.sh

# If not running interactively, don't do anything
case $- in
	*i*) ;;
	  *) return;;
esac

HISTCONTROL=ignoreboth # don't put duplicate lines or lines starting with space in the history
shopt -s histappend # append to the history file, don't overwrite it
HISTSIZE=1000 # setting history length
HISTFILESIZE=2000
shopt -s checkwinsize # check the window size after each command and update the LINES and COLUMNS.

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
	xterm-color|*-256color) color_prompt=yes;;
esac

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
	else
	color_prompt=
	fi
fi

if [ "$color_prompt" = yes ]; then
	#										Username         @ Host			:               Path          $ 
	#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
	
	# 			   Username: 				CWD		 	      $
	#PS1='\[\033[01;32m\]\u:\[\033[01;34m\]\W\[\033[00m\]\$ '
	#Username: \u
	#Host: \h
	#Working Directory: \w | Clean: \W
	# \$
	#Shell: \s
	#Version \v
	#Align Rigt: $(printf "%$(($(tput cols)+${COLUMNS}-25))s")
	#Align Right Based on Directory lenth and date and time: 
	# $(printf "%$(($(tput cols)-$(echo -n "$(echo "\w \d \t [  ]")" | wc -c ) ))s")

	PS1='\n\[\033[01;32m\]\w $(printf "%$(($(tput cols)-$(echo -n "$(echo "\w \d \t [  ]")" | wc -c ) ))s") \[\033[00;02m\][\d \t] \n\[\033[00m\]> '
else
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	#alias dir='dir --color=auto'
	#alias vdir='vdir --color=auto'
	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
# sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# EXPORT
VISUAL=micro;
export VISUAL
EDITOR=micro;
export EDITOR

# ALIAS

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

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

# If this is an xterm set more declarative titles
# "dir: last_cmd" and "actual_cmd" during execution
# If you want to exclude a cmd from being printed see line 156
case "$TERM" in
xterm*|rxvt*)
	PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\$(print_title)\a\]$PS1"
	__el_LAST_EXECUTED_COMMAND=""
	print_title ()
	{
		__el_FIRSTPART=""
		__el_SECONDPART=""
		if [ "$PWD" == "$HOME" ]; then
			__el_FIRSTPART=$(gettext --domain="pantheon-files" "Home")
		else
			if [ "$PWD" == "/" ]; then
				__el_FIRSTPART="/"
			else
				__el_FIRSTPART="${PWD##*/}"
			fi
		fi
		if [[ "$__el_LAST_EXECUTED_COMMAND" == "" ]]; then
			echo "$__el_FIRSTPART"
			return
		fi
		#trim the command to the first segment and strip sudo
		if [[ "$__el_LAST_EXECUTED_COMMAND" == sudo* ]]; then
			__el_SECONDPART="${__el_LAST_EXECUTED_COMMAND:5}"
			__el_SECONDPART="${__el_SECONDPART%% *}"
		else
			__el_SECONDPART="${__el_LAST_EXECUTED_COMMAND%% *}"
		fi
		printf "%s: %s" "$__el_FIRSTPART" "$__el_SECONDPART"
	}
	put_title()
	{
		__el_LAST_EXECUTED_COMMAND="${BASH_COMMAND}"
		printf "\033]0;%s\007" "$1"
	}

	# Show the currently running command in the terminal title:
	update_tab_command()
	{
		# catch blacklisted commands and nested escapes
		case "$BASH_COMMAND" in
			*\033]0*|update_*|echo*|printf*|clear*|cd*)
			__el_LAST_EXECUTED_COMMAND=""
				;;
			*)
			put_title "${BASH_COMMAND}"
			;;
		esac
	}
	preexec_functions+=(update_tab_command)
	;;
*)
	;;
esac

#include_bash_aliases
if [ -f ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi;

test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)
