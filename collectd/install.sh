sudo apt-get install collectd
sudo service --status-all | egrep "collectd|apache2"
systemctl restart collectd.service
systemctl status collectd.service
