#!/usr/bin/fish

echo "Refreshing submodules"
git submodule init
git submodule update --init --recursive --remote


which pacman > /dev/null
if test $status -eq 0
    echo "Arch Linux detected, installing packages if required.."
    sudo pacman -S --needed fish gnu-netcat thefuck
end

echo "Checking for Vundle"
if not test -d ~/.vim/bundle/Vundle.vim
    echo "Installing.."
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
end

if count $argv > /dev/null
   and [ $argv[1] = "teardown" ]
    for pkg in *
        echo "CURRENTLY UNLINKING $pkg"
        stow -D "$pkg"
    end
else
    for pkg in *
        echo "CURRENTLY LINKING $pkg"
        stow "$pkg"
    end
end

