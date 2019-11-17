require 'date'
require 'awesome_print'

if ARGV.length > 1; then
        puts "Usage: vhost <domain>"
        exit
elsif  ARGV.length == 0; then
        p "Enter domain name: "
        domain = gets.chomp
else
        domain = ARGV[0].chomp
end

year = DateTime.now.year

puts <<EOF.cyan
<VirtualHost *:80>
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
EOF
puts <<EOF.blue
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
#</VirtualHost>
EOF
