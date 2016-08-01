#!/bin/bash
# This script will install alexa rank record program on your system.

echo "Type the domain address you want to record (eg. example.com), followed by [ENTER]:"
read domain
echo "Type the virtualhost path you want to see records in it (eg. /var/www/alexa.example.com/), followed by [ENTER]:"
read virtualhost_dir

# Copy and install the script in the right place.
cp src/script.php /opt
cp src/domain.php $virtualhost_dir.$domain

sed -i -e 's/DOMAIN/' . $domain . '/g' /tmp/domain.php
sed -i -e 's/DIR/' . $domain . '/g' /tmp/script.php
