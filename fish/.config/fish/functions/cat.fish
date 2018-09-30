# Defined in - @ line 0
function cat --description 'alias cat=bat'
    if status --is-interactive
        bat  $argv;
    else
        command cat $argv;
    end
end
