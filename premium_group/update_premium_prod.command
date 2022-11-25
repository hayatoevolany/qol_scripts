# dev_hosts=(
#     "ssh -t -t bot_jump sudo ssh premiumdev1 bash /root/update.sh"
# )
# stg_hosts=(
#     "ssh -t -t bot_jump sudo ssh premiumstg3 bash /root/update.sh"
# )
# prod_hosts=(
#     "ssh -t -t bot_jump sudo ssh premiumprod1 bash /root/update.sh"
#     "ssh -t -t bot_jump sudo ssh premiumprod2 bash /root/update.sh"
#     "ssh -t -t bot_jump sudo ssh premiumprod3 bash /root/update.sh"
#     "ssh -t -t bot_jump sudo ssh premiumprod4 bash /root/update.sh"
# )

# echo '*** This is a script for updating Premium Group servers. ***'
# read -p "Which environment would you like to update? [dev stg prod] " -r
# echo
# echo You selected "$REPLY" 
# if [[ $REPLY == 'dev' ]]; then
#     hosts=$dev_hosts
# elif [[ $REPLY == 'stg' ]]; then
#     hosts=$stg_hosts
# elif [[ $REPLY == 'prod' ]]; then
#     hosts=$prod_hosts
# else 
#     exit;
# fi

# for c in "${hosts[@]}"
# do
#     [[ $c =~ sudo[[:space:]]ssh[[:space:]](.*)[[:space:]]bash ]] # Regex to get the name of the server
#     read -p "Type 'Y' to update [${BASH_REMATCH[1]}], or any other key to cancel: " -n 1 -r
#     echo    # (optional) move to a new line
#     if [[ ! $REPLY =~ ^[Yy]$ ]]
#     then
#         continue
#     else 
#         $c
#     fi
# done
