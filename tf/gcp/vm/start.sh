sudo apt update && sudo apt install -y nginx ufw
printf "%s" "<h2>skovati.dev is currently down while the homelab datacenter is being relocated. Thanks for your patience and for choosing skovati networks!</h2>" > /var/www/html/index.html
sudo ufw allow 22/tcp && sudo ufw allow 80/tcp
sudo ufw enable
