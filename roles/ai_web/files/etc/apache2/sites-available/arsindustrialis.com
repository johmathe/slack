<VirtualHost *>
  ServerAdmin sysops@nonutc.fr  
  DocumentRoot /home/www
  ServerName arsindustrialis.com
  <Directory />
    Options FollowSymLinks
    AllowOverride All
  </Directory>
  RedirectMatch ^/(.*)$ http://arsindustrialis.org/$1
  CustomLog /var/log/apache2/access.log combined
</VirtualHost>

