#!/bin/bash


### Set up Cron task

### Watch out for the missing end of line bug
crontab -l | (cat;echo "*/30 * * * * cd rstuff/ecobici/scripts && ./getData.R") | crontab
