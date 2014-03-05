#!/bin/sh
. $PWD/pogoda.conf

while (true)
do
	#if [ -f $PAGEFILE ]; then rm $PAGEFILE; fi
	wget -t 1 -O $PAGEFILE -o wget.log http://www.meteo.by/minsk
	grep -m 1 "<strong>" $PAGEFILE > temp
	echo "temperature: " $(sed 's/[^\-\+0-9]//g' temp)
	rm temp
	sleep $DELAY
done
