#!/usr/bin/env bash

if [ -z "$SLACKAUTH" ]; then
    echo "\$SLACKAUTH ENV variable not set. Slack notifications will not be sent."
    exit 255
fi

if [ -z "$SLACKEMAIL" ]; then
    echo "\$SLACKEMAIL ENV variable not set. Slack notifications will not be sent."
    exit 255
fi

if [ -z "$SLACKAPIUSER" ]; then
    echo "\$SLACKAPIUSER ENV variable not set. Slack notifications will not be sent."
    exit 255
fi

while :
do
	public_ip=$(curl -s http://10.20.20.21:4040/api/tunnels | jq -r '.tunnels[0].public_url')
	if [[ $public_ip == *"ngrok"* ]]; then
        echo "Public IP: $public_ip"
        /slack_notify.sh "Public IP: $public_ip - Local IP: http://10.20.20.20 - Ngrok Api: http://10.20.20.21:4040/api/tunnels"
        break
    else
        echo "ngrok not ready yet"
        sleep 5
    fi
done