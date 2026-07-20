#!/bin/sh

ZEIT_BIN=zeit
statusOut=$($ZEIT_BIN --format json)


# {
#   "status": "tracking",
#   "is_running": true,
#   "project_sid": "test",
#   "task_sid": "dev",
#   "timer": 302
# }

# Getting all the keys 
#		if is running     (is_running, status, project_sid, task_sid, timer)
#		Otherwise         (is_running, status)
for key in $(echo "$statusOut" | jq -r 'keys[]'); do
  value=$(echo "$statusOut" | jq -r ".${key}")
  export "$key"="$value"
done

if [[ "$is_running" == true ]]; then
	# tooltip="Working on:$project_sid on task:$task_sid Timer:$timer"
	# jq -nc \
	# 		--arg tooltip "$tooltip" \
	# 	'{class:"active", tooltip:$tooltip}'
	

	# --[c]ompact-output  format the output on one line.
	# --[n]ull-input since we have no input, but we are creating the json object from scratch
	# jq -nc \
	# 	'{class:"active"}'
  #

  hours=$((timer / 3600))
  minutes=$(((timer % 3600) / 60))
  seconds=$((timer % 60))
  timer_fmt=$(printf "%02d:%02d:%02d" "$hours" "$minutes" "$seconds")
# complete e.g with all the args
  jq -nc \
      --arg project_sid "$project_sid" \
      --arg task_sid "$task_sid" \
      --arg timer_fmt "$timer_fmt" \
  '{ text:"Working on: " + $project_sid + "/" + $task_sid + " " + $timer_fmt, class:"active" }'

fi

# complete e.g with all the args
# jq -nc \
# 	--arg text "$text" \
# 	--arg alt "$alt" \
# 	--arg tooltip "$tooltip" \
# 	--arg class "$class" \
# 	'{text:$text, alt:$alt, tooltip: $tooltip, class:$class}'
