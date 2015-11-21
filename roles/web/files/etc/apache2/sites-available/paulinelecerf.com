<VirtualHost *>

  ServerAdmin sysops@nonutc.fr
  AccessFileName .htaccess
  ServerName paulinelecerf.com
  DocumentRoot /home/pauline/www

  <Directory />
    Options FollowSymLinks
    AllowOverride All
  </Directory>

  <Directory /home/pauline/www >
    Options Indexes FollowSymLinks MultiViews
    AllowOverride All
    Order allow,deny
    allow from all
  </Directory>
  # Rewwrite rule needed by wordpress


  ErrorLog /var/log/apache2/error.log
  LogLevel warn
  CustomLog /var/log/apache2/access.log combined
  ServerSignature Off

</VirtualHost>

<VirtualHost *>
   ServerName paulinelecerf.fr
   RedirectMatch ^/$ http://paulinelecerf.com/
</VirtualHost>

<VirtualHost *>
   ServerName pauline-lecerf.com
   RedirectMatch ^/$ http://paulinelecerf.com/
</VirtualHost>

<VirtualHost *>
   ServerName pauline-lecerf.fr
   RedirectMatch ^/$ http://paulinelecerf.com/
</VirtualHost>

<VirtualHost *>
   ServerName www.paulinelecerf.fr
   RedirectMatch ^/$ http://paulinelecerf.com/
</VirtualHost>

<VirtualHost *>
   ServerName www.pauline-lecerf.com
   RedirectMatch ^/$ http://paulinelecerf.com/
</VirtualHost>

<VirtualHost *>
   ServerName www.pauline-lecerf.fr
   RedirectMatch ^/$ http://paulinelecerf.com/
</VirtualHost>

<VirtualHost *>
   ServerName www.paulinelecerf.com
   RedirectMatch ^/$ http://paulinelecerf.com/
</VirtualHost>
