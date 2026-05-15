#!/bin/sh

ZEIT_BIN=zeit
DMENU_PROGRAM=fzf

as_hms() {
  local nanoseconds=$1

  seconds=$((nanoseconds / 1000000000))

  hours=$((seconds / 3600))

  minutes=$(((seconds % 3600) / 60))

  seconds_r=$((seconds % 60))

  printf "%02d:%02d:%02d" "$hours" "$minutes" "$seconds_r"
}

statusOut=$($ZEIT_BIN --format json)
for key in $(echo "$statusOut" | jq -r 'keys[]'); do
  value=$(echo "$statusOut" | jq -r ".${key}")
  export "$key"="$value"
done

value=$(echo "$statusOut" | jq -r ".${key}")

if [[ "$is_running" == "true" ]]; then
	tooltip=$project_sid $task_sid $timer
else
	tooltip="No active task"

fi
jq -nc \
  --arg tooltip "$tooltip" \
  '{tooltip:$tooltip}'
