
# nginx
sudo dnf install nginx

# certbot
sudo dnf install certbot python3-certbot-nginx

certbot --nginx -d easyjava.xyz

# nginx proxy
add upsream namespace for local app server
proxy root to the namespace

# firewall-cmd
sudo firewall-cmd --list-services
sudo firewall-cmd --list-ports
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --permanent --add-port=8443/tcp --permanent

# selinux
sudo setsebool -P httpd_can_network_connect 1
getsebool httpd_can_network_connect
