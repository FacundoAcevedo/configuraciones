#! /bin/sh
#
# rkhunter_cron.sh

# --cronjob suppresses colored output and interactive key presses and run check
# --update keeps definitions up to date
# --skip-keypress no human intervention

/usr/bin/logger "rkhunter: start..."
/usr/bin/rkhunter --cronjob --update --report-warnings-only
/usr/bin/logger "rkhunter: stop EXIT_CODE:"$?


