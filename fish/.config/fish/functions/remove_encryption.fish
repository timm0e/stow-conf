function remove_encryption --description 'Remove pdf encryption with ghostscript'
    if [ (count $argv) -eq  2 ]
        set input $argv[1]
        set output $argv[2]
        gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=$output -c .setpdfwrite -f $input
    else
        echo "Too few arguments"
    end
end
