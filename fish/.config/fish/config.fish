set -gx EDITOR vim
set -gx VISUAL vim

set -gx ANDROID_HOME $HOME/Development/sdk/
set -gx ANDROID_HVPROTO ddm

set -gx GOPATH $HOME/Apps/go/

## Added by Master Password
#source bashlib
function mpww
    # Ask for the user's name and password if not yet known.
    #MP_FULLNAME=${MP_FULLNAME:-$(ask 'Your Full Name:')}

    # Start Master Password and copy the output.
    #printf %s "$(MP_FULLNAME=$MP_FULLNAME command mpw "$@")" | _copy
end
export MP_FULLNAME=Maxr1998

set GITHUB_USER Maxr1998
complete -c git -n "string match -r '^git clone.*' (commandline) > /dev/null ; echo $status" -a '(curl -Ls https://api.github.com/users/$GITHUB_USER/repos|jq ".[]|.clone_url" -c|string replace -a "\"" "")'

alias nano=vim
alias svim='sudo -E vim'

