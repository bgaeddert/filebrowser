#!/usr/bin/env bash

# pretty colors
BOLD_RED=$'\e[1;31m'
RESET=$'\e[0m'

log_error() {
    printf "\n${BOLD_RED}%b${RESET}\n" "$@" >&2
}

msg=$1
if [ -z "$msg" ]; then
    log_error "You must include a message to send. Blank messages are not allowed."
    exit 42
fi

slackId=$(curl -s -X GET -H "Authorization: Bearer ${SLACKAUTH}" https://slack.com/api/users.list | jq -r ".members[] | select ( .profile.email == \"${SLACKEMAIL}\" ) | .id")
slackReceiver=$(curl -s -X POST -H "Authorization: Bearer ${SLACKAUTH}" https://slack.com/api/conversations.open?users=$slackId | jq -r '.channel.id')

curl -s \
    --data-urlencode "token=${SLACKAUTH}" \
    --data-urlencode "channel=${slackReceiver}" \
    --data-urlencode "text=\`$(hostname) - ${SERVER_NAME}\` ${msg}" \
    --data-urlencode "username=${SLACKAPIUSER}" \
    "https://slack.com/api/chat.postMessage"