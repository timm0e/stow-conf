function pacman-ar --description 'Auto-remove unused packages'
    set removable (pacman -Qdtq)
    if count $removable > /dev/null
        sudo pacman -R $removable
    else
        echo "Nothing to remove"
    end
end
