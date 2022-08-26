#!/bin/bash

# --------------- README -----------------------

# Hayato, 30th March 2022
# Update script for updating prerelease environment. Can be used in different environments, too; just change the update scripts.

# 1. Have the anybot pemfile
# 2. Give this file execute permissions:

# chmod +x PATH/TO/FILE/update_staging.command

# --------------- README -----------------------







# Uncomment the update scripts that you want to use.
hosts=(
    # # ---- Update these frequently ----

    "ssh -t -t centos@52.194.115.183 -p32000 -i~/.ssh/anybot.pem sudo ssh mststg1 sh /root/update.sh"
    "ssh -t -t centos@52.194.115.183 -p32000 -i~/.ssh/anybot.pem sudo ssh mststg2 sh /root/update.sh"
    "ssh -t -t centos@52.194.115.183 -p32000 -i~/.ssh/anybot.pem sudo ssh mststglua1 sh /root/update_lua_noerror.sh"
    "ssh -t -t centos@52.194.115.183 -p32000 -i~/.ssh/anybot.pem sudo ssh mststglua2 sh /root/update_lua_noerror.sh"



    # # ---- These don't need to be updated that often ----

    "ssh -t -t centos@52.194.115.183 -p32000 -i~/.ssh/anybot.pem sudo ssh mststgsns1 sh /root/update_sns.sh"
    "ssh -t -t centos@52.194.115.183 -p32000 -i~/.ssh/anybot.pem sudo ssh mststgsocket1 sh /root/update_socket.sh"
    "ssh -t -t centos@52.194.115.183 -p32000 -i~/.ssh/anybot.pem sudo ssh mststgbatch1 sh /root/update.sh"
)

# Check if we have any hosts to update.
if [[ "${#hosts[@]}" == 0 ]]; then
    echo 'No hosts set. Exiting.'
    exit;
fi

# Declare empty array
hostNames=()

# Iterate the loop to read and print each array element
for value in "${hosts[@]}"
do
    [[ $value =~ sudo[[:space:]]ssh[[:space:]](.*)[[:space:]]sh ]] # Regex to get the name of the server
    hostNames+=(${BASH_REMATCH[1]})
done

# Join array with commas to get string
hostNames=$(printf ", %s" "${hostNames[@]}")
hostNames=${hostNames:1}

# Print text to screen
echo '*** This is a script for updating PRERELEASE servers. ***'
echo
echo "These servers will be updated: [${hostNames} ]"
echo 

# Ask for user input approval (y/n)
read -p "OK? y/n: " -n 1 -r
echo

if [[ $REPLY == 'y' ]]; then
    echo "Starting update... This may take a while"
    for c in "${hosts[@]}"
    do
        $c # Run the update script
    done
else
    echo Exiting
    exit;
fi
