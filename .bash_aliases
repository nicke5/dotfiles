#------------------------------------------------------------------------------
# Bash Aliases
# Sources from .bashrc
#------------------------------------------------------------------------------
# GENERAL ALIASES
alias sd='~/solarized/gnome-terminal-colors-solarized/set_dark.sh'
alias sl='~/solarized/gnome-terminal-colors-solarized/set_light.sh'
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
alias myp='cd /home/nsouthor/Dropbox/code/python'

alias which='type -a'
alias h='history'
alias ..='cd ..'
alias npath='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias du='du -kh'

alias proxyon='export HTTP_PROXY=http://nsouthor@10AveryDrive@proxy.mbhpe.net:8080;HTTPS_PROXY=https://nsouthor@10AveryDrive@proxy.mbhpe.net:8080'
alias proxyoff='export HTTP_PROXY="";export HTTPS_PROXY=""'

alias bmd='cd ~/Documents/HPC2015/Benchmarks/Distribution'


#------------------------------------------------------------------------------
# GIT ALIASES
alias g='git'
alias gr='git rm -rf'
alias gs='git status'
alias ga='g add'
alias gc='git commit -m'
alias gp='git push origin master'
alias gl='git pull origin master'

#------------------------------------------------------------------------------
# PBS ALIASES
alias showNodes="pbsnodes -a  | grep vnode | awk '{print \$3}'"
