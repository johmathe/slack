<VirtualHost *>
	ServerAdmin sysops@nonutc.fr 
	ServerName www.juggletube.com
	DocumentRoot /home/www/beta/
	ScriptAlias /cgi-bin/ "/home/www/beta/cgi-bin/"

	<Directory />
		Options FollowSymLinks
		AllowOverride All
	</Directory>
	<Directory /home/www/beta>
		Options Indexes FollowSymLinks MultiViews
		AllowOverride All
		Order allow,deny
		allow from all
	</Directory>

  <Directory "/home/www/beta/cgi-bin/"> 
    AllowOverride None 
    Options ExecCGI -MultiViews +SymLinksIfOwnerMatch 
    Order allow,deny 
    Allow from all 
  </Directory>

	ErrorLog /var/log/apache2/error.log

	# Possible values include: debug, info, notice, warn, error, crit,
	# alert, emerg.
	LogLevel warn

	CustomLog /var/log/apache2/access.log combined

</VirtualHost>
