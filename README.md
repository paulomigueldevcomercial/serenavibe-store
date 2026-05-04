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

## Deploy neste servidor

O proxy HTTP deste projeto fica no nginx principal de `goldeplaca-projeto`.
O container `serenavibe-wordpress` sobe separado e entra na rede Docker
`goldeplaca_proxy`, criada pelo compose principal.

Subir o nginx principal no diretorio raiz de `goldeplaca-projeto`:

```bash
docker compose up -d nginx
```

Subir somente a loja Serenavibe:

```bash
cd serenavibe-store
./start-serenavibe-store.sh
```

DNS esperado:

- `store.serenavibe.com.br` aponta para este servidor e o nginx encaminha para `serenavibe-wordpress:80`.
- `www.store.serenavibe.com.br` redireciona para `store.serenavibe.com.br`.
