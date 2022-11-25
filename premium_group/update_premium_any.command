# dev_hosts=(
#     "ssh -t -t bot_jump sudo ssh premiumdev1 bash /root/update.sh"
# )
# stg_hosts=(
#     "ssh -t -t bot_jump sudo ssh premiumstg3 bash /root/update.sh"
# )
# declare -a prod_hosts=(
#     "ssh -t -t bot_jump sudo ssh premiumprod1 bash /root/update.sh"
#     "ssh -t -t bot_jump sudo ssh premiumprod2 bash /root/update.sh"
#     "ssh -t -t bot_jump sudo ssh premiumprod3 bash /root/update.sh"
#     "ssh -t -t bot_jump sudo ssh premiumprod4 bash /root/update.sh"
# )
# 
# echo '*** This is a script for updating Premium Group servers. ***'
# read -p "Which environment would you like to update? [dev stg prod] " -r
# echo "${arrayLength}"
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
# 
# arr_length=${#hosts[@]}
# host_name=$REPLY
# finished=false
# server_name=''
# command=''
# # Get server name: 
# while [ "$finished" != "true" ]; do
#     echo "[premium-${host_name}] Enter the number of the server you want to update: "
#     # for i in "${!hosts[@]}"
#     for (( i=0; i<${arr_length}; i++ ));
#     do
#           echo "index: $i, value: ${hosts[$i]}"
#         [[ "${hosts[@]}" =~ sudo[[:space:]]ssh[[:space:]](.*)[[:space:]]bash ]] && echo "${!hosts[@]} - ${BASH_REMATCH[1]}"
#     done
#     echo
# 
#     # Get user input of server user wants to update:
#     read -p "Enter the number for the server you want to update: " -n 1 -r
#     if [ "${hosts[$REPLY]}" ]
#     then
#         echo
#         echo "${hosts[$REPLY]}" 
#         [[ "${hosts[$REPLY]}" =~ sudo[[:space:]]ssh[[:space:]](.*)[[:space:]]bash ]] && server_name="${BASH_REMATCH[1]}"
#         command=${hosts[$REPLY]}
#         finished=true
#     fi
#     echo
# done
# 
# echo 
# read -p "Type 'Y' to confirm update of ${server_name}: " -n 1 -r
# echo 
# 
# if [[ $REPLY =~ ^[Yy]$ ]]
# then
#     $command
# fi

# for c in "${hosts[@]}"
# do
#     if [[ ! $REPLY =~ ^[Yy]$ ]]
#     then
#         continue
#     else 
#         $c
#     fi
# done
