# serenavibe-store

Scripts to aux in install docker deps

chmod +x install_docker.sh

chmod 755 install_docker.sh

./install_docker.sh

Docker permissions

sudo usermod -aG docker $USER

For the command to run successfully, you must log out of the session.


Create database:

CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER 'wpuser'@'%' IDENTIFIED BY 'ShadowDev123';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wpuser'@'%';
FLUSH PRIVILEGES;

mysql -h wordpress-2.cp8cqkwqmsaz.us-east-2.rds.amazonaws.com:3306 -u admin -p
