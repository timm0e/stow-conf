#!/usr/bin/fish
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

