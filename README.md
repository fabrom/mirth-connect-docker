# mirth-connect-docker

Mirth-Connect Docker Stack (Mirth-Connect container + Mysql container + PHPMyAdmin container)

## Prerequirements

- Docker
- Java

## Build Mirth-Connect docker image

  > \> docker-compose build

## Start Mirth-Connect-Docker stack

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
(user: *admin* / password: *password* )

or

browse to [http://localhost:8080]() to access web client.

## Change configuration

see [./mirth-connect/README.md](./mirth-connect/README.md)

## Credits

- https://github.com/fabrom/mirth-connect-docker Fabrice Romand <fabrice.romand@gmail.com>
- [based on brandonstevens/mirth-connect docker image](https://hub.docker.com/r/brandonstevens/mirth-connect/)
