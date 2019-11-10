require 'date'

print "Enter domain name: "
domain = gets.chomp
year = DateTime.now.year

puts "\033[96m<VirtualHost *:80>
   ServerAdmin webmaster@#{domain}
   DocumentRoot /var/www/vhosts/#{domain}/httpdocs
   ServerName #{domain}
   ServerAlias www.#{domain}
   ErrorLog logs/#{domain}-error_log
   CustomLog logs/#{domain}-access_log common
   <Directory /var/www/vhosts/#{domain}/httpdocs>
      AllowOverride All
   </Directory>
</VirtualHost>

#<VirtualHost *:443>
#   ServerAdmin webmaster@#{domain}
#   DocumentRoot /var/www/vhosts/#{domain}/httpdocs
#   ServerName #{domain}
#   ServerAlias www.#{domain}
#   ErrorLog logs/#{domain}-ssl_error_log
#   CustomLog logs/#{domain}-ssl_access_log common
#   <Directory /var/www/vhosts/#{domain}/httpdocs>
#      AllowOverride All
#   </Directory>
#
#   SSLEngine on
#   SSLCertificateFile /etc/pki/tls/certs/#{year}-#{domain}.crt
#   SSLCACertificateFile /etc/pki/tls/certs/#{year}-#{domain}.CA.crt
#   SSLCertificateKeyFile /etc/pki/tls/private/#{year}-#{domain}.key
#</VirtualHost>"


print "Press ENTER to exit..."
gets
