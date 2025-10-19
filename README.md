# serenavibe-store

Scripts to aux in install docker deps

chmod +x install_docker.sh

chmod 755 install_docker.sh

./install_docker.sh

Docker permissions

sudo usermod -aG docker $USER

For the command to run successfully, you must log out of the session.


Create database:

sudo mysql -e "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;"
sudo mysql -e "CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'senhaSegura';"
sudo mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wpuser'@'localhost';"
sudo mysql -e "FLUSH PRIVILEGES;"

mysql -h wordpress-db.cp8cqkwqmsaz.us-east-2.rds.amazonaws.com:3306 -u admin -p
