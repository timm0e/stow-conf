function lcc --description 'Compile C89 code with default arguments'
    if [ (count $argv) -gt  0 ]
        set sourcefile $argv[1]
        set argv[1] (string replace .c .elf $argv[1])
        gcc $sourcefile -Wall -Wextra -Wmain -pedantic -ansi -o $argv
    else
        echo "Too few arguments"
    end
end
