echo -e "\e[35m >>>>>>>>> Copying the MongoDB repo<<<<<<<<<\e[0m"
cp mongo.repo /etc/yum.repos.d/mongo.repo

echo -e "\e[35m >>>>>>>>> Install the MongoDB<<<<<<<<<\e[0m"
yum install mongodb-org -y

echo -e "\e[35m >>>>>>>>> Change the iP adress <<<<<<<<<\e[0m"
sed -i -e 's|127.0.0.1|0.0.0.0|' /etc/mongod.conf

echo -e "\e[35m >>>>>>>>> Restart the Application<<<<<<<<<\e[0m"
systemctl enable mongod
systemctl restart mongod