# $Id: jlequeux 5 2008-03-15 15:59:00Z johmathe $
<VirtualHost *>
	ServerAdmin jlequeux@gmail.com
  AccessFileName .htaccess
  ServerName bubbleen.com
  DocumentRoot /home/jlequeux/bubbleen/
    <Directory />
                Options FollowSymLinks
                AllowOverride None
    </Directory>

        <Directory /home/jlequeux/bubbleen/ >
              Options Indexes FollowSymLinks MultiViews
              AllowOverride All
              Order allow,deny
              allow from all
        RewriteEngine On
        RewriteBase /wordpress/
        RewriteCond %{REQUEST_FILENAME} !-f
        RewriteCond %{REQUEST_FILENAME} !-d
        RewriteRule . /wordpress/index.php [L]
	</Directory>
	ErrorLog /var/log/apache2/error.log
	LogLevel warn

	CustomLog /var/log/apache2/access.log combined
	ServerSignature Off
</VirtualHost>
