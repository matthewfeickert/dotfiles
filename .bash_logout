# ~/.bash_logout: executed by bash(1) when login shell exits.

# when leaving the console clear the screen to increase privacy

if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi

# Check how many ssh-agent sessions are still logged in
if [[ "$(who | grep -c "${USER}")" -le "1" ]]; then
    echo "$(date +%F@%T) - SSH-AGENT: Agent will be stopped"
    # Remove all keys from the ssh-agent
    ssh-add -D >/dev/null
    # Kill the ssh-agent
    eval "$(ssh-agent -k)"
    # remove the file with the ssh-agent environment variables
    rm -f ~/.ssh/ssh-agent
else
    echo "$(date +%F@%T) - SSH-AGENT: Still sessions logged in"
fi
