#------------------------------------------------------------------------
# Bash Aliases
# Sources from .bashrc
#------------------------------------------------------------------------
# GENERAL ALIASES
alias ls='ls --color=auto'
alias ll='ls -la'
alias lsd='ls -la | grep ^d'
alias la='ls -lA'                                       # show hidden files
alias l='ls'                                            # basic list
alias lx='ls -lXB'                                      # sort by extension
alias lk='ls -lSr'                                      # sort by size, biggest last
alias lc='ls -ltcr'                                     # sort by and show change time, most recent last
alias lu='ls -ltur'                                     # sort by and show access time, most recent last
alias lt='ls -lrta'                                     # sort by creation date, most recent first
alias vim='/usr/bin/nvim'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias bc='bc -l'                                        # Starts cmd-line  calculator
alias md5='openssl md5'                                 # Create MD5 hash
alias sha1='openssl sha1'                               # Create SHA1 hash
alias mkdir='mkdir -pv'
alias diff='colordiff'  # Install colordiff
alias df='pydf'
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias ipt='sudo /sbin/iptables'
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
alias firewall=iptlist
alias psmem='ps auxf | sort -nr -k 4 | head -10'
alias pscpu='ps auzf | sort -nr -k 3 | head -10'
alias wget='wget -c'
alias iftop='sudo iftop'
alias cp='rsync --progress -ravz'
alias nocomment='grep -Ev '\''^(#|$)'\'''
alias cmount='mount | column -t'
alias psg='ps -Helf | greo -v $$ | grep -i -e WCHAN -e'
alias tf="find . -print | sed -e 's;[^/]*/;|_____;g;s;_____|; |;g'"
alias connections='sudo lsof -n -P -i +c 15'
alias src='. ~/.bashrc'

alias which='type -a'
alias h='history'
alias ..='cd ..'
alias npath='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias du='du -kh'

#------------------------------------------------------------------------
# GIT ALIASES
alias g='git'
alias gr='git rm -rf'
alias gs='git status'
alias ga='g add'
alias gc='git commit -m'
alias gp='git push origin master'
alias gl='git pull origin master'

# For each dir listed on the left of :, create an alias you see on the 
# right of :
for DIR in "Music":mus "Pictures":pics "Documents":docs "dotfiles":dots;
{
	[ -d "$HOME/${DIR%:*}" ] && alias ${DIR/*:}="cd $HOME/${DIR%:*}"
}

# A cleaner lsblk
if type -fP lsblk > /dev/null 2>&1; then
	alias lsblkid='lsblk -o name,label,fstype,size,uuid,mountpoint --noheadings'
fi

