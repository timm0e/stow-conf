#!/usr/bin/fish
echo "Refreshing submodules"
git submodule init
git submodule update --init --recursive --remote

if count $argv > /dev/null
    and [ $argv[1] = "pkg" ]
    which pacman > /dev/null
    if test $status -eq 0
        echo "Arch Linux detected, installing packages if required.."
        sudo sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
        sudo pacman -Syu
        sudo pacman -S --needed \
            fish gnu-netcat jq reflector rsync \
            i3-wm i3blocks \
            gnome-common gnome-control-center gnome-terminal gnome-tweaks \
            fontconfig cantarell-fonts gsfonts pango terminus-font ttf-dejavu ttf-fira-code ttf-roboto \
            xorg-xinput xorg-font-util xorg-font-utils \
            feh mpv steam steam-native-runtime thefuck
    end
    echo

    echo "Install manually afterwards:"
    echo "- https://aur.archlinux.org/package-query.git"
    echo "- https://aur.archlinux.org/yaourt.git"
    echo "yaourt -S --needed --noconfirm discord google-chrome i3lock-color-git j4-dmenu-desktop luckybackup \\"
    echo "materia-gtk-theme numix-circle-icon-theme-git numix-icon-theme-git ttf-font-icons"
    echo
    sleep 3
end

echo "Setting up directories"
mkdir -p ~/.vim/ftdetect/
mkdir -p ~/.config/fish/

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
    echo "Execute: sudo stow -d i3/.config/i3/ -t /etc/systemd/system/ systemd_units"
end

