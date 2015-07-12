#!/bin/bash

LOG=writelog.sh

function speak {
        $LOG "$TAG"; echo "$MESSAGE"
}

message[0]="If you're alive, you can keep moving, dammit!"
message[1]="If you can't do that, no one can."
message[2]="There are only two choices. Either proceed or die."
message[3]="You should do that or the world would end, seriously."
message[4]="Saying 'I can't go on' is silly when you're obviously going on while you're saying it."
message[5]="Get your ass in gear!"
num_messages=${#message[*]}

TAG="bug"
MESSAGE=${message[$((RANDOM%num_messages))]}
speak

