function cleanup_history --on-event fish_postexec
    echo all | history delete --prefix "ls" --prefix "ll" --prefix "la" --prefix "rm " > /dev/null
end
