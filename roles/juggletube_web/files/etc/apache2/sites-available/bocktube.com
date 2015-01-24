<VirtualHost *>
	ServerAdmin sysops@nonutc.fr 
	ServerName bocktube.com	
	DocumentRoot /home/www/bocktube.com/
	ScriptAlias /cgi-bin/ "/home/www/bocktube.com/cgi-bin/"

  <Directory /home/www/unictube.com/ >
    Options +FollowSymLinks
    RewriteEngine On
    Order allow,deny 
    Allow from all 
  </Directory>

  <Directory "/home/www/bocktube.com/cgi-bin/"> 
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
