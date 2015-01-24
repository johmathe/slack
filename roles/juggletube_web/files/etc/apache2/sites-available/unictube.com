<VirtualHost *>
	ServerAdmin sysops@nonutc.fr 
	ServerName unictube.com	
	DocumentRoot /home/www/unictube.com/
	ScriptAlias /cgi-bin/ "/home/www/unictube.com/cgi-bin/"

  <Directory /home/www/unictube.com/ >
    Options +FollowSymLinks
    RewriteEngine On
    Order allow,deny 
    Allow from all 
  </Directory>

  <Directory "/home/www/unictube.com/cgi-bin/"> 
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
