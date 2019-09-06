# APT
alias install='sudo apt install'
alias purge='sudo apt purge'
alias remove='sudo apt remove'
alias clean='sudo apt autoremove'
alias update='sudo apt update'
alias upgrade='sudo apt upgrade'
alias search='apt search'
alias show='apt show'
alias list='apt list'

alias installit='sudo apt install $(history -p \!\!)'		# Install last commands as root
alias snapit='sudo snap install $(history -p \!\!)'			# Snap Install last commands as root
alias manit='man $(history -p \!\!)'						# Man page last command

# CD
alias ..='cd ..'					# Go up one directory
alias ,,='cd -'						# Go to previous directory

cdc() { cd ~ && clear; }
cdl() { cd "$1" && exa; }			# Change directory and List files
cdll() { cd "$1" && exa -lh; }		# Change directory and List files in long format
cdla() { cd "$1" && exa -alh; }		# Change directory and List all files in long format
cdlt() { cd "$1" && tree -L 1; }	# Change directory and List files in  Tree format

cn() {								# Change directory based on number
	if [ $# -eq 2 ]; then
		cd ${1}*/${2}*
	else
		cd ${1}*
	fi
}

mkcd() { mkdir -p "$1"; cd "$1"; }	# Make dir and CD into it

# CAT
alias cat='bat'

# LS
#alias ll='ls -alF'					# List All Detailed
#alias la='ls -A'					# List All
#alias l='ls -CF'					# List Directory
alias lh='ls -d .*'					# List hidden
alias ls='exa'						# List
alias la='exa -alh'					# List All
alias ll='exa -lh'					# List All Detailed
alias l1='exa -1'					# List one entry per line
alias lr='exa -R'					# Recursive into directories

lls() { ll | awk '{if (NR!=1) {print ""$2"\t"$7""}}'; } # List file size
las() { la | awk '{if (NR!=1) {print ""$2"\t"$7""}}'; } # List all file size

lt() {								# List files in Tree format
	if ["$*" == ""]; then
		tree -L 1
	else
		tree -L $1
	fi
}

# MISC
alias c='clear'
alias cls="clear;pwd;ls"
alias fuck='sudo $(history -p \!\!)'									# Run last commands as root
alias die='shutdown -s'													# Shutdown System
alias libgr='libinput-gestures-setup restart' 							# Libinput Gestures
alias alice='cd /home/blix/Alice && ./main.py'							# Alice
alias reicon='cd /usr/share/icons && gtk-update-icon-cache elementary'	# Rebuild Icon Cache
#alias logout='sudo pkill -u $USER'
#alias logout2='sudo service lightdm restart'
alias gtop='gotop-cjbassi'												# Change gotop to gtop
alias clip='xsel --clipboard'											# Send to clipbaord
alias unzip='tar -zxvf '
alias wget='wget -c '													# resume if fails
alias ping='ping -c 5'
alias hs='history | grep'												# History search
alias weatherfull='curl wttr.in/luton'
alias weather='curl -v wttr.in/luton 2>&1 | grep Weather -A 7'
alias cast='scrcpy --max-size 1024'										# Cast android screen

news() { curl getnews.tech/$1; }
tinyurl() { curl -s http://tinyurl.com/api-create.php\?url\=http://$1 && echo; }
cheat() { curl cheat.sh/$1; }
cheatcat() { curl -s cheat.sh/$1 2>&1 | cat; }
bak() { cp $1 $1.bak; }

#repeat [X] [command]
function repeat() {
	local i max
	max=$1; shift;
	for ((i=1; i <= max ; i++)); do
		eval "$@";
	done
}

# SCRIPT
alias dm='~/.scripts/dmenu.sh'
alias dml='~/.scripts/dmenu_list.sh'
alias dmlc='dml | clip'

# SYSTEM
alias user='who'
alias sys='hostnamectl'
alias disk='df -h'
alias mem='free'
alias meminfo='free -m -l -t'
alias cpuinfo='lscpu'
alias gpuinfo='grep -i memory /var/log/Xorg.0.log'
alias tp='ps -eo %mem,%cpu,comm --sort=-%mem | head -n 6'
alias publicip='curl ifconfig.co'

# PROGRAMMING
live() { python -m SimpleHTTPServer $1; }
alias p2='python'
alias p3='python3'

j() { java $1; }
jc() { javac $1; }
