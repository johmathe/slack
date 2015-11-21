# $Id: jlequeux 5 2008-03-15 15:59:00Z johmathe $
<VirtualHost *>
	ServerAdmin jlequeux@gmail.com
  AccessFileName .htaccess
  ServerName flo-et-nico.com
  DocumentRoot /home/jlequeux/public_html/mariage_nico_flo
    <Directory />
                Options FollowSymLinks
                AllowOverride None
    </Directory>

        <Directory /home/jlequeux/public_html/mariage_nico_flo >
              Options Indexes FollowSymLinks MultiViews
              AllowOverride All
              Order allow,deny
              allow from all
	</Directory>
	ErrorLog /var/log/apache2/error.log
	LogLevel warn

	CustomLog /var/log/apache2/access.log combined
	ServerSignature Off
</VirtualHost>
