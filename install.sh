#!/usr/bin/bash
#========================================================================
# This script creates symlinks from the home directory to any desired dotfiles in ${homedir}/dotfiles
#========================================================================

if [ "$#" -ne 1 ]; then
    echo "Usage: install.sh <home_directory>"
    echo "Example: install.sh $(echo $HOME)"
    exit 1
fi

homedir=$1

# dotfiles directory
dotfiledir=${homedir}/dotfiles

# list of files/folders to symlink in ${homedir}
files="bash_profile bashrc bash_aliases"
binfiles="bash_functions"

# change to the dotfiles directory
echo "Changing to the ${dotfiledir} directory"
cd ${dotfiledir}
echo "...done"

# create symlinks (will overwrite old dotfiles)
for file in ${files}; do
	echo "Creating symlink to $file in home directory."
	ln -sf ${dotfiledir}/.${file} ${homedir}/.${file}
done

for file in ${binfiles}; do
	echo "Creating symlink to $file in ~/bin directory."
	ln -sf ${dotfiledir}/.${file} ${homedir}/bin/.${file}
done

# Download Git Auto-Completion
echo "Updating git auto-completion."
curl "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash" > ${homedir}/.git-completion.bash

