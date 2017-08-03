#!/bin/sh
#####################################################################
# @(#) rootkit checking with cron
#
# Author: Tats Shibata
# License: http://rewse.jp/license/2011.01.txt
#
# Copyright (c) 2011, Rewse Lab. All rights reserved.
#####################################################################

# {{{ Constants needed to change

# Mail to
MAIL_TO=facu@localhost.localdomain

# }}}
#####################################################################
# {{{ Constants

# Alert mail title
MAIL_TITLE="[`hostname -s`] CRITICAL: Found out rootkits"

# Temporary file for mail message
MSGFILE='/tmp/chkrootkit.msg'

# }}}
#####################################################################
# {{{ remove_message()

remove_message() {
  rm -f $MSGFILE
}

# }}}
# {{{ Trap

trap 'remove_message; exit 1' 1 2 3 15

# }}}
# {{{ Run chkrootkit

# Remove the alert message for initialize
remove_message

/usr/bin/logger "chkrootkit: start..."
# Run chkrootkit and send an alert mail if rootkits were found out
/usr/sbin/chkrootkit 2>&1 | grep INFECTED > $MSGFILE
/usr/bin/logger "chkrootkit: stop"

# Send an alert mail if there is a mail message
if [ -s $MSGFILE ]; then
    cat <<! | mail -s "$MAIL_TITLE" $MAIL_TO
###### CRITICAL ######

Rootkits were found out.

`cat $MSGFILE`
!
fi

# Remove the alert message for finish
remove_message

# }}}



