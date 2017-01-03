#!/bin/bash
# This script will install alexa rank record program on your system.

# Read required information from user
echo "Type the domain addresses you want to record (eg. example.com), seperated by [ENTER], followed by [Ctrl^D]:"
domains=$(cat)

while read -r domain; do
	echo "Type the virtualhost path you want to see records for $domain in it (eg. /var/www/alexa.example.com/), followed by [ENTER]:"
	read virtualhost_dir

	# Add slash to end of path if not written
	if [[ "$virtualhost_dir" != *\/ ]]; then
	virtualhost_dir="$virtualhost_dir/" ; fi

	# Replace domain and dir in source code
	sed -i -- "s/DOMAIN/$domain/g" src/script.php
	sed -i -- "s/DOMAIN/$domain/g" src/domain.php
	sed -i -- "s#DIR#$virtualhost_dir#g" src/domain.php
	sed -i -- "s#DIR#$virtualhost_dir#g" src/script.php

	# Copy and install the script in the right place.
	cp src/script.php /opt/alexa-script.php
	cp src/domain.php $virtualhost_dir$domain.php
	cp src/alexa /usr/local/bin/
	chmod +x /usr/local/bin/alexa

done <<< "$domains"

# Schedular running of the script
read cron_do
if ($cron_do) then
    touch /var/log/alexa.log
    chmod +w /var/log/alexa.log
    echo "0 3 15,30 * * alexa >> /var/log/alexa.log" >> /var/spool/cron/crontabs/$USER
fi