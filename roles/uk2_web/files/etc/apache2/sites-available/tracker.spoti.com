<VirtualHost *>
	
  ServerAdmin sysops@nonutc.fr 
  AccessFileName .htaccess
  ServerName tracker.spoti.com
  DocumentRoot /home/www/piwik
  
  <Directory />
    Options FollowSymLinks
    AllowOverride None
  </Directory>

  <Directory /home/www/piwik >
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
