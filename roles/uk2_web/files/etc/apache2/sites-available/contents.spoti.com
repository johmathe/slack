<VirtualHost *>
	
  ServerAdmin sysops@nonutc.fr 
  AccessFileName .htaccess
  ServerName contents.spoti.com
  DocumentRoot /home/www/contents
  
  <Directory />
    Options FollowSymLinks
    AllowOverride None
  </Directory>

  <Directory /home/www/contents >
    Options Indexes FollowSymLinks MultiViews
    AllowOverride None
    Order allow,deny
    allow from all
  </Directory>

  ErrorLog /var/log/apache2/error.log
  LogLevel warn
  CustomLog /var/log/apache2/access.log combined
  ServerSignature Off

</VirtualHost>
