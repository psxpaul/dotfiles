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

# setup bash-completion for docker for mac
if [[ -d "/Applications/Docker.app/Contents/Resources/etc" ]]; then
  for file in /Applications/Docker.app/Contents/Resources/etc/*.bash-completion; do
      base=`basename $file`
      echo "Creating symlink from $file to $HOME/.bash_completion.d/$base"
      ln -fs $file $HOME/.bash_completion.d/$base
  done
fi

# setup home/end keys for mac
if [[ -d "$HOME/Library" ]]; then
    echo "Creating OSX keybindings file"
    mkdir -p $HOME/Library/KeyBindings
    ln -fs $dir/DefaultKeyBinding.dict $HOME/Library/KeyBindings/DefaultKeyBinding.dict

    echo "Setting up terminal Ctrl+PgUp and Ctrl+PgDown key bindings"
    defaults write -g NSUserKeyEquivalents -dict-add "Show Previous Tab" "^\UF72C" "Previous Tab" "^\UF72C" "Previous Workspace" "^\UF72C" "Show Next Tab" "^\UF72D" "Next Tab" "^\UF72D" "Next Workspace" "^\UF72D"
fi

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

echo "Setting up neovim/oni config"
mkdir -p $HOME/.config

if [[ ! -e $HOME/.config/nvim ]]; then
    ln -fs $dir/nvim $HOME/.config/nvim
fi

if [[ ! -e $HOME/.config/oni ]]; then
    ln -fs $dir/oni $HOME/.config/oni
fi

pushd $PWD > /dev/null
for pluginDir in $dir/oni/plugins/*; do
    cd $pluginDir
    echo "Runing 'npm install' from $pluginDir"
    npm install
done
popd > /dev/null

echo "Done!"
