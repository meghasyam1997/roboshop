echo -e "\e[35m >>>>>>>>> Install the python <<<<<<<<<\e[0m"
yum install python36 gcc python3-devel -y

echo -e "\e[35m >>>>>>>>> Add the application user <<<<<<<<<\e[0m"
useradd roboshop

echo -e "\e[35m >>>>>>>>> Making App directory <<<<<<<<<\e[0m"
rm -rf /app
mkdir /app

echo -e "\e[35m >>>>>>>>> Download app content <<<<<<<<<\e[0m"
curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment.zip
cd /app

echo -e "\e[35m >>>>>>>>> unzip the content <<<<<<<<<\e[0m"
unzip /tmp/payment.zip

echo -e "\e[35m >>>>>>>>> Configure the pythyon dependencies <<<<<<<<<\e[0m"
pip3.6 install -r requirements.txt

echo -e "\e[35m >>>>>>>>> Copy the systemd <<<<<<<<<\e[0m"
cp payment.service /etc/systemd/system/payment.service

echo -e "\e[35m >>>>>>>>> Relod the application <<<<<<<<<\e[0m"
systemctl daemon-reload
systemctl enable payment
systemctl start payment