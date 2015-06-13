#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
files="bashrc bash_aliases bash_completion.d profile inputrc gitconfig gvimrc vimrc vim"    # list of files/folders to symlink in homedir

##########

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir

# get the latest submodules
git submodule init
git submodule update

# create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Creating symlink to $file in home directory."
    rm -f ~/.$file
    ln -s $dir/$file ~/.$file
done

echo "Creating symlink to .gitignore in home directory."
ln -fs $dir/.gitignore ~/.gitignore
echo "Creating symlink to .gitmodules in home directory."
ln -fs $dir/.gitmodules ~/.gitmodules

echo "Creating symlink to meldGit in ~/bin"
mkdir -p ~/bin
ln -fs $dir/meldGit ~/bin/meldGit
ln -fs $dir/pretty ~/bin/pretty

if [ ! -d ~/.bash_aliases.d ]; then
    mkdir ~/.bash_aliases.d
    touch ~/.bash_aliases.d/noop
fi

if [ ! -d ~/.bash_aliases.d_custom ]; then
    mkdir ~/.bash_aliases.d_custom
    touch ~/.bash_aliases.d_custom/noop
fi

if [ ! -d ~/.bashrc.d ]; then
    mkdir ~/.bashrc.d
    touch ~/.bashrc.d/noop
fi

if [ ! -d ~/.profile.d ]; then
    mkdir ~/.profile.d
    touch ~/.profile.d/noop
fi

echo "Done!"
