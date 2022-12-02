#!/usr/bin/env bash

YEAR="$(date +%Y)"

MONTH="$(date +%m)"

DAY="$(date +%d)"

HOUR=$(date +%I)

PM_AM_STATUS=$(date +%p)

if [ -d ~/reports ]
then
       echo "reports directory exists"
else

    mkdir ~/reports
fi

 if [ -f ~/reports/report-$YEAR-$MONTH-$DAY.xls ]
    then
        echo "files  exists"     
else

for i in {1..12}
do
    touch ~/reports/report-$YEAR-$i-$DAY.xls
done
fi

if [ $HOUR -it 5 ] || [ $HOUR -eq 12 ] && [ $PM_AM_STATUS =='AM' ]
 then
    tar -cf ~/reports-$YEAR-$MONTH-$DAY.tar ~/reports
else
    echo "no bachup for this time"
fi
