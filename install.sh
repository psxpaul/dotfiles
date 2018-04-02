#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in the project repo
############################

########## Variables

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"                    # dotfiles directory
files="bashrc bash_aliases inputrc gitconfig gvimrc vimrc vim"    # list of files/folders to symlink in homedir
directories=".bash_aliases.d .bash_completion.d .bashrc.d .profile.d bin"

##########

# change to the dotfiles directory
echo "Changing to the $dir directory..."
cd $dir

# get the latest submodules
git submodule init
git submodule update

# create directories as needed
for directory in $directories; do
    echo "Creating $HOME/$directory/noop"
    mkdir -p $HOME/$directory
    touch $HOME/$directory/noop
done

# create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Creating symlink to $file in home directory"
    rm -f $HOME/.$file
    ln -fs $dir/$file $HOME/.$file
done

for file in $dir/bash_completion.d/*; do
    base=`basename $file`
    echo "Creating symlink from $file to $HOME/.bash_completion.d/$base"
    ln -fs $file $HOME/.bash_completion.d/$base
done

for file in $dir/bin/*; do
    base=`basename $file`
    echo "Creating symlink from $file to $HOME/bin/$base"
    ln -fs $file $HOME/bin/$base
done

echo "Creating symlink to .profile in home directory"
if [[ "$OSTYPE" == "darwin"* ]]; then
    ln -fs $dir/profile $HOME/.bash_profile
else
    ln -fs $dir/profile $HOME/.profile
fi

echo "Creating symlink to .gitignore in home directory"
ln -fs $dir/.gitignore $HOME/.gitignore

echo "Setting up neovim config"
cat > $HOME/.config/nvim/init.vim <<- EOM
set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.vimrc
EOM

echo "Done!"
