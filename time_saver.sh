#!/bin/bash
# Dependencies: ponysay, fortune, slock

LOG=writelog.sh

function speak {
        xterm -e "ponysay -b linux-vt -- \"$MESSAGE\"; $DO; $LOG $TAG"
}

message[0]="Перерыв, иди попей чаю."
message[1]="Может пойдёшь спать уже?"
message[2]="А зарядку ты сегодня сделал?"
message[3]="Уже `date +%I:%M`, пора сделать перерыв."
message[4]="Перерыв, иди гулять."
message[5]="Ты когда последний раз на улице был?"
message[6]="Ты уже обедал?"
message[7]="Ты уже позавтракал?"
message[8]="Ты уже поужинал? Иди спать"
num_messages=${#message[*]}

period=$((40 * 60))
while true; do
	sleep $(($period + ($RANDOM/4000)))
	TAG="break"
	MESSAGE=${message[$((RANDOM%num_messages))]}
	speak
	slock
done &

message[0]="Дорогой `whoami`, чем полезным ты занят в данную минуту?"
message[1]="Уроки сделал?"
message[2]="Что делаешь?"
message[3]="А чем это ты таким занимаешься? Иди таскать мешки с сахаром!"
num_messages=${#message[*]}

message="Дорогой `whoami`, чем полезным ты занят в данную минуту?"
while true; do
	sleep $(($RANDOM/6))
	TAG="do"
	MESSAGE=${message[$((RANDOM%num_messages))]}
	speak
done &

message[0]="`whoami`, как тебе эта цитата?"
message[1]="`whoami`, как тебе данная цитата?"
message[2]="Лол"
message[3]="Ох лол!"
message[4]="Эта цитата заставляет задуматься."
num_messages=${#message[*]}

while true; do
	sleep $(($RANDOM/4))
	TAG="quote"
	MESSAGE=${message[$((RANDOM%num_messages))]}
	DO="fortune"
	speak
done &

message[0]="Do you feel normal?"
message[1]="Do you feel sane?"
message[2]="Does reality appear correct?"
num_messages=${#message[*]}

while true; do
        sleep $(($RANDOM/5))
        TAG="sense"
        MESSAGE=${message[$((RANDOM%num_messages))]}
        speak
done &
