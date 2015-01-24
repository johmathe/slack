<VirtualHost *>
	   ServerAdmin johan.mathe@nonutc.fr 
	   AccessFileName .htaccess
       ServerName www.coloursofimagination.com
       ServerName coloursofimagination.com
       DocumentRoot /home/albert/public_html/
        <Directory />
                Options FollowSymLinks
                AllowOverride None
        </Directory>

        <Directory /home/albert/public_html/ >
                Options Indexes FollowSymLinks MultiViews
                AllowOverride None
                Order allow,deny
                allow from all
                # This directive allows us to have apache2's default start page
                # in /apache2-default/, but still have / go to the right place
        </Directory>

	ErrorLog /var/log/apache2/error.log

	# Possible values include: debug, info, notice, warn, error, crit,
	# alert, emerg.
	LogLevel warn

	CustomLog /var/log/apache2/access.log combined
	ServerSignature Off

</VirtualHost>
