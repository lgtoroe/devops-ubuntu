#!/bin/bash
# Script for Install Addons SSL for Apache 2.
sudo apt update
#sudo apt install apache2 # En caso que no haya sido instalado previamente.
sudo a2enmod ssl
echo "Favor verificar certificados .... estos se copiaran a /etc/apache2/ssl/"
pause
cp *.crt /etc/apache2/ssl/
cp *.key /etc/apache2/ssl/
echo "archivos copiados .........................."
echo "Edit /etc/apache2/sites-available/*-ssl.conf"

# Example for default-ssl.conf

#<IfModule mod_ssl.c>
#    <VirtualHost _default_:443>
#        ServerAdmin admin@example.com
#        ServerName your_domain.com
#        ServerAlias www.your_domain.com
#        DocumentRoot /var/www/html
#        ErrorLog ${APACHE_LOG_DIR}/error.log
#        CustomLog ${APACHE_LOG_DIR}/access.log combined
#        SSLEngine on
#        SSLCertificateFile /etc/apache2/ssl/apache.crt
#        SSLCertificateKeyFile /etc/apache2/ssl/apache.key
#        <FilesMatch "\.(cgi|shtml|phtml|php)$">
#                        SSLOptions +StdEnvVars
#        </FilesMatch>
#        <Directory /usr/lib/cgi-bin>
#                        SSLOptions +StdEnvVars
#        </Directory>
#        BrowserMatch "MSIE [2-6]" \
#                        nokeepalive ssl-unclean-shutdown \
#                        downgrade-1.0 force-response-1.0
#        BrowserMatch "MSIE [17-9]" ssl-unclean-shutdown
#    </VirtualHost>
#</IfModule>

pause
sudo a2ensite *-ssl.conf
echo "Reiniciando servicios apache2 ....."
sudo service apache2 restart
echo "Proceso finalizado, chequeando site ............"
curl -I sites-available
echo "**************************************************"
echo "Listo!."
