#!/bin/bash


cp -R /etc/skel /home/$1
mkdir -p /home/$1/public_html
mkdir -p /home/$1/secure
chmod 700 /home/$1/secure
chown -R $1:nonutc /home/$1
chgrp -R www-data /home/$1/public_html
chmod g+s /home/$1/public_html
