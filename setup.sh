#!/usr/bin/fish

function colorecho 
	# Set color to cyan
	tput setaf 4
	# Make text bold
	tput bold
	echo $argv
	# Reset everything
	tput sgr0
end

colorecho "Refreshing submodules"
git submodule init
git submodule update --init --recursive --remote

if count $argv > /dev/null
    and [ $argv[1] = "pkg" ]
    which pacman > /dev/null
    if test $status -eq 0
        colorecho "Arch Linux detected, installing packages if required.."
        sudo sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
        sudo pacman -Syu
        sudo pacman -S --needed \
            fish jq openbsd-netcat reflector rsync \
            i3-wm \
            gnome-control-center gnome-terminal gnome-tweaks \
            fontconfig cantarell-fonts gsfonts pango terminus-font ttf-dejavu ttf-fira-code ttf-roboto \
            xorg-xinput xorg-font-util xorg-font-utils \
            feh mpv steam steam-native-runtime thefuck
    end
    colorecho "Installing custom config package"
    set stow_root "$PWD"
    cd i3/.config/i3/arch_pkg/
    makepkg -fci
    cd $stow_root
    colorecho
    colorecho "Install manually afterwards:"
    colorecho "- https://aur.archlinux.org/package-query.git"
    colorecho "- https://aur.archlinux.org/yay.git"
    colorecho "yay -S --needed --noconfirm discord google-chrome i3blocks-git i3lock-color-git j4-dmenu-desktop luckybackup \\"
    colorecho "materia-gtk-theme numix-circle-icon-theme-git numix-icon-theme-git ttf-font-icons"
    colorecho
    sleep 3
end

colorecho "Setting up directories"
mkdir -p ~/.vim/ftdetect/
mkdir -p ~/.config/fish/

colorecho "Checking for Vundle"
if not test -d ~/.vim/bundle/Vundle.vim
    colorecho "Installing.."
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
end

if count $argv > /dev/null
   and [ $argv[1] = "teardown" ]
    for pkg in *
        colorecho "CURRENTLY UNLINKING $pkg"
        stow -D -t ~ "$pkg"
    end
else
    for dir in */
        set pkg (echo $dir | sed 's|/$||')
        colorecho "CURRENTLY LINKING $pkg"
        stow -t ~ "$pkg"
    end
end

