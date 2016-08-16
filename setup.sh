#!/bin/bash
# This script will install alexa rank record program on your system.

# Read required information from user
echo "Type the domain address you want to record (eg. example.com), followed by [ENTER]:"
read domain
echo "Type the virtualhost path you want to see records in it (eg. /var/www/alexa.example.com/), followed by [ENTER]:"
read virtualhost_dir

# Add slash to end of path if not written
if [[ "$virtualhost_dir" != *\/ ]]; then
virtualhost_dir="$virtualhost_dir/" ; fi

# Replace domain and dir in source code
sed -i -- "s/DOMAIN/$domain/g" src/script.php
sed -i -- "s/DOMAIN/$domain/g" src/domain.php
sed -i -- "s/DIR/$virtualhost_dir/g" src/domain.php

# Copy and install the script in the right place.
cp src/script.php /opt/alexa-script.php
cp src/domain.php $virtualhost_dir$domain.php
cp src/alexa /usr/local/bin/
chmod +x /usr/local/bin/alexa
