mirth-connect
=============

based on [brandonstevens/mirth-connect](https://hub.docker.com/r/brandonstevens/mirth-connect/)

# What is Mirth Connect?

[Mirth Connect (now NextGen Connect Integration Engine)](https://github.com/nextgenhealthcare/connect) makes it easy to transform non-standard data into standard formats and to monitor multiple interfaces. Available to use for free under an open source license or with our commercial license, where additional enterprise features and support are at your disposal, it’s designed for seamless healthcare message integration, and is well-tested, delivering the advantages and innovation that comes with a large user base.

Like an interpreter who translates foreign languages into the one you understand, NextGen Connect (formerly Mirth Connect) translates message standards into the one your system understands. Whenever a &quot;foreign&quot; system sends you a message, NextGen Connect&apos;s integration capabilities expedite the following:
- Filtering &mdash; NextGen Connect reads message parameters and passes the message to or stops it on its way to the transformation stage.
- Transformation &mdash; NextGen Connect converts the incoming message standard to another standard (e.g., HL7 to XML).
- Extraction &mdash; NextGen Connect can &quot;pull&quot; data from and &quot;push&quot; data to a database.
- Routing &mdash; NextGen Connect makes sure messages arrive at their assigned destinations.

# How to use this image


## Running Mirth Connect Server

Mirth Connect Server contains the back-end for the management interface and the integration engine component, which performs message filtering, transformation, and transmission.

    $ docker run -d -P fabrom/mirth-connect

## Configuring Mirth Connect Server

Create a configuration file for Mirth Connect Server from the default configuration file in SVN. Update the database properties to connect to a remote MySQL instance.

    $ svn export https://svn.mirthcorp.com/connect/trunk/server/conf/mirth.properties ~/mirth.properties
    $ vim mirth.properties
    ...
    database = mysql
    database.url = jdbc:mysql://prod-cluster.us-west-2.rds.amazonaws.com:3306/mirthdb
    database.username = mirth
    database.password = mirth

Launch the container and mount the configuration file:

    $ docker run -d -P -v ~/mirth.properties:/opt/mirth-connect/conf/mirth.properties fabrom/mirth-connect

## Running Mirth Shell

In addition to the graphical Mirth Administrator, Mirth provides a command line interface known as the Mirth Shell.

First, get the name of the running Mirth Connect Server container:

    $ docker ps
    CONTAINER ID        IMAGE                                 COMMAND                CREATED             STATUS              PORTS                                              NAMES
    bf63b2b30e2c        fabrom/mirth-connect          "java -jar mirth-ser   26 minutes ago      Up 26 minutes       0.0.0.0:32769->8080/tcp, 0.0.0.0:32768->8443/tcp   fervent_torvalds

Using the name, link the Mirth Connect Server container to the Mirth Shell container:

    $ docker run -it --link fervent_torvalds:mirth-connect fabrom/mirth-connect java -jar mirth-cli-launcher.jar -a https://mirth-connect:8443 -u admin -p admin

# How to exchange message files with Docker host 

Map volume */var/spool/mirth/* to a host directory

    $ docker run -d -P -v ./data/spools/:/var/spool/mirth/:rw fabrom/mirth-connect

Then MirthConnect container could put/get messages to/from Docker host directories.
