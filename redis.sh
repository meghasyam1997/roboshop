echo -e "\e[35m >>>>>>>>> Configuring NodeJs Repos<<<<<<<<<\e[0m"
yum install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
dnf module enable redis:remi-6.2 -y

echo -e "\e[35m >>>>>>>>> Install redis<<<<<<<<<\e[0m"
yum install redis -y

echo -e "\e[35m >>>>>>>>> Restart the App<<<<<<<<<\e[0m"
systemctl enable redis
systemctl restart redis