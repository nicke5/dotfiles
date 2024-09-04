#!/bin/bash
#set -x
#=============================================================================#
#  _   _ _____ ____                                                           #
# | \ | | ____/ ___|    Nick Southorn                                         #
# |  \| |  _| \___ \    https://github.com/nicksouthorn                       #
# | |\  | |___ ___) |   n.southorn@gmail.com                                  # 
# |_| \_|_____|____/                                                          #
#                                                                             #
#=============================================================================#
# Description     :This script creates symlinks from the home directory to any
#                  desired dotfile
# Author	  :Nick Southorn
# Date            :30/07/19
# Version         :1.2    
# Usage		  :install.sh <home_directory>
# Notes           :                                         
# bash_version    :                      
#=============================================================================#
# TODO            :COMPLETE - Update with .config files
#                 :COMPLETE - Prevent someone running as root
#                 :Add a log file
#                 :Add a dry-run option
#=============================================================================#
export VERSION=1.2
HOMEDIR=${HOME}
export LOGFILE=~/logs/dotfiles.log
BASH_FUNCS=${HOMEDIR}/bin/bash_functions
#=============================================================================#
if [[ -f ${BASH_FUNCS} ]]; then
# shellcheck source=/dev/null
	. "${BASH_FUNCS}" 
else
	echo "==> Functions module missing, continuing with reduced functionality"
fi
#========================================================================
# This script creates symlinks from the home directory to any desired dotfiles in ${homedir}/dotfiles
#========================================================================

if [ "$#" -ne 1 ]; then
    echo "Usage: install.sh <home_directory>"
    echo "Example: install.sh " "${HOME}"
    exit 1
fi

# Quick check to stop this script being run as root
if [ "$(whoami)" = root ]; then
	printHr 2>&1 
	echo "Please don't run this as root"
	printHr 2>&1
	exit
fi

printHr 2>&1
echo "Home dir is " "$HOMEDIR"
printHr 2>&1
# dotfiles directory
dotfiledir="${HOMEDIR}"/dotfiles

# list of files/folders to symlink in ${homedir}
files="bash_profile bashrc bash_aliases vimrc"
binfiles="bash_functions"
configfiles="compton/compton.conf \
	termite/config \
	htop/htoprc \
	openbox/lxde-rc.xml \
	neofetch/config.conf"
 

# change to the dotfiles directory
printHr 2>&1 
echo "Changing to the ${dotfiledir} directory"
cd "${dotfiledir}" || exit
echo "...done"
printHr 2>&1

#=============================================================================#
# create symlinks (will overwrite old dotfiles)
#=============================================================================#
for file in ${files}; do
	echo "Creating symlink to ${file} in home directory."
	ln -sf "${dotfiledir}"/."${file}" "${HOMEDIR}"/."${file}"
done

for file in ${binfiles}; do
	echo "Creating symlink to ${file} in ~/bin directory."
	ln -sf "${dotfiledir}"/bin/"${file}" "${HOMEDIR}"/bin/"${file}"
done

for file in ${configfiles}; do
	echo "Creating symlink to ${file} in ~/.config directory."
	ln -sf "${dotfiledir}"/.config/"${file}" "${HOMEDIR}"/.config/"${file}"
done

echo "Dotfiles updated"
#=============================================================================#
# Download Git Auto-Completion
#=============================================================================#
printHr 2>&1 
echo "Updating git auto-completion."
curl "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash" > "${HOMEDIR}"/.git-completion.bash
echo "Update complete"
printHr 2>&1
