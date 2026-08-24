#!/bin/sh

MISU_BIN=${HOME}/code/node/misu/app.js
statusOut=$(node $MISU_BIN --status)

# {
#   "isRunning": true,
#   "projectSID": "ossu",
#   "taskName": "cpd",
#   "timer": "00:00:18"
# }

# Getting all the keys 
for key in $(echo "$statusOut" | jq -r 'keys[]'); do
  value=$(echo "$statusOut" | jq -r ".${key}")
  export "$key"="$value"
done

if [[ "$isRunning" == true ]]; then
  jq -nc \
      --arg project_sid "$projectSID" \
      --arg task_sid "$taskName" \
      --arg timer "$timer" \
  '{ text:"Working on: " + $project_sid + "/" + $task_sid + " " + $timer, class:"active" }'

fi
