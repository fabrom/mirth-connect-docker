# mirth-connect-docker

Mirth-Connect Docker Stack :

- Mirth-Connect container
- NGINX container (forward HTTP to HTTPS reverse-proxy)
- Mysql container
- PHPMyAdmin container

## Prerequirements

- Docker
- Java (for MirthConnect client)

## Build Mirth-Connect docker image

  > \> docker-compose build --force-rm --no-cache --pull --parallel

... docker login, docker tag, docker push ...

## Start Mirth-Connect-Docker stack

Prepare local datas directories :

  > \> ./init.sh

  Eventually, add java db drivers to ./data/mirth-connect/custom-lib/ and
    edit ./data/mirth-connect/conf/dbdrivers.xml (see dbdrivers.example.xml)

  Finally, start the stack

  > \> docker-compose up -d

## Stop Mirth-Connect-Docker stack

  > \> docker-compose down

## Connect to PHPMyAdmin

- url: [http://localhost:8181]()
- user: *root*
- password: *password*

## Connect to MySQL

Use your preferred MySQL client connected to *localhost* port *3306*
(admin user: *root* / password: *password*)

### Mirth database

- database: *mirth-test*
- user: *mirth*
- password: *password*

## Connect to Mirth-Connect

Double-click on *./webstart.jnlp* to start the Mirth-Connect client
(user: *admin* / password: *admin* )

or

browse to [http://localhost:8080]() to access web client.

## Using host filesystem in MirthConnect

_./data/mirth-connect/spools_ (host FS) mapped to _/var/spool/mirth/_ (Mirth container)

## Using reverse-proxy in MirthConnect

Reverse-proxy hostname is _rp-https_

## Change configuration

see [./mirth-connect/README.md](./mirth-connect/README.md)

## Forward HTTP sender to HTTPS destination

see [./rp-https/README.md](./rp-https/README.md)

## Credits

- https://github.com/fabrom/mirth-connect-docker Fabrice Romand <fabrice.romand@gmail.com>
- [based on brandonstevens/mirth-connect docker image](https://hub.docker.com/r/brandonstevens/mirth-connect/)
