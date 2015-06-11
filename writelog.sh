#!/bin/bash

LOG=~/.mylog.txt

rnd=$RANDOM
tlog=/tmp/log-`whoami`-$rnd.txt
while true; do
        read input

        if [[ -z "$input" ]]; then
		if [[ -s "$tlog" ]]; then
			test `wc -m <<<"$@"` -gt 1 && echo $@ >> $tlog
		        date >> $tlog
		        echo '--------------------' >> $tlog
		        cat $tlog
		        cat $tlog >> $LOG
		        rm $tlog
		        exit
		fi
		exit
        fi

        echo "$input" >> $tlog
done
