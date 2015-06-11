#!/bin/bash

LOG=writelog.sh

function speak {
	if [[ -z "$do" ]]; then
		do=$LOG $TAG
	fi
        xterm -e "ponysay -b linux-vt -- \"$message\"; $do"
}

period=$((40 * 60))
message="Перерыв, иди гуляй."
while true; do
	sleep $(($period + ($RANDOM/4000)))
	TAG="break"
	speak
	slock
done &

message="Дорогой `whoami`, чем полезным ты занят в данную минуту?"
while true; do
	sleep $(($RANDOM/6))
	TAG="do"
	speak
done &

message="`whoami`, как тебе эта цитата?"
while true; do
	sleep $(($RANDOM/4))
	TAG="quote"
	speak
done &

messages="Do you feel normal?
Do you feel sane?
Does reality appear correct?"

message=($messages)
echo $message
num_messages=${#message[*]}
echo ${message[$((RANDOM%num_messages))]}
