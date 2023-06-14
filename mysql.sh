echo -e "\e[35m >>>>>>>>> Disable mysql<<<<<<<<<\e[0m"
dnf module disable mysql -y

echo -e "\e[35m >>>>>>>>> Copy the mysql repo<<<<<<<<<\e[0m"
cp mysql.repo /etc/yum.repos.d/mysql.repo

echo -e "\e[35m >>>>>>>>> instal the mysql server<<<<<<<<<\e[0m"
yum install mysql-community-server -y

echo -e "\e[35m >>>>>>>>> Restart the mysql server<<<<<<<<<\e[0m"
systemctl enable mysqld
systemctl restart mysqld

echo -e "\e[35m >>>>>>>>> se password for mysql<<<<<<<<<\e[0m"
mysql_secure_installation --set-root-pass RoboShop@1

