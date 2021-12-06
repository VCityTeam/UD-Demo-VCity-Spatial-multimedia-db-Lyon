# Spatial multimedia demo

## FIXME FIXME FIXME

This demo does not work YET !
But it must exists separatly from
https://ud-viz.vcityliris.data.alpha.grandlyon.com/examples/DocumentWidget/example.html that
 - is not an example but a demo since it uses specific data
 - can NOT work as is because of 
   [mixed content block access](https://developer.mozilla.org/en-US/docs/Web/Security/Mixed_content)
   when accessing the extended document data (from https to http).

### Concerning the data

- an effective server is still effective on rict: try opening
  http://rict.liris.cnrs.fr:1525/document
- When on rict host the following sequence of commands will bring you to
  the code and DATA that must be brought back to this demos
  
  ```bash
  $ sudo netstat -tulpn | grep 1525  # yep, its a container serving the content
  $ docker ps | grep 1525            # that container is named enhanced_city_api
  $ docker inspect enhanced_city_api | grep Source  # will lead you to
  $ cd /home/citydb_user/Demos/UDVDemo/UDV-server-dev/API_Enhanced_City
  $ cat docker-compose.yml
  $ cat Dockerfile
  $ cat Deployment/API_Extended_Document.uwsgi.yml
  $ ls upload/                       # Yep, the images are here
  ```

- Concerning the data you can either
  - use
    `pg_dump --username citydb_user extendedDoc > extendendDoc-from_rict_2021_02_25.sql`
    refer to
    [this topic meeting](https://github.com/VCityTeam/VCity/blob/master/Topic_Meetings/2021/2021_02_25_HBO_CGA_EBO.md)
    to restore the content of the db
  - Or directly copy the content `postgres-data/postgres/` database
    directory (that the postgres container can then point to) to this
    repository.

### Concerning the docker-compose.yml

Refer to the embryo in this directory

### Concerning udviz-template

Duplicate ud-viz-tempate in a sub-directory.
Promote the [UD-Viz...examples/DocumentWidget/example.html](https://github.com/VCityTeam/UD-Viz/blob/master/examples/DocumentWidget/example.html)
to become the entrypoint of this app.

## What this demo is about

A demo illustrating how to deploy

- a [spatial multimedia database](https://github.com/VCityTeam/Spatial-Multimedia-DB)
- an [UD-Viz based](https://github.com/VCityTeam/UD-Viz-Template) urban scene
  that displays the associated multimedia content

## Docker containers used by this demo

- A [Postgres docker](https://hub.docker.com/_/postgres)
- A [Spatial Multimedia DB docker](https://github.com/VCityTeam/Spatial-Multimedia-DB-docker)
- A [UD-Viz specific demo](https://github.com/VCityTeam/UD-Viz) located in this folder

## Running the demo for the first time

The only pre-requisite is to have a host with
[docker compose](https://docs.docker.com/compose/)
installed. Once docker is installed, start the docker daemon.

If you wish to modify the default ports (as well as other parameters) used by
this demo then you might consider editing the [`.env`](.env) docker-compose
environment file.

In order to launch the demo (from a terminal) clone this repository and
change the directory to be the one holding this Readme.md file and run the
following command (you can add "-d" at the end of this line to run the command in background):

```bash
docker-compose up
```

You should now be able to access the web-gl based demo by browsing the 
`http://localhost:8080` URL

## General setup and ort configuration

To setup/configuration of this demo is made through the [.env file](.env)
available to configure several parameters for each of the three constituting
docker containers. To configure the UD-Viz view, you may need to
adjust/configure the extent and camera settings directly in the config file.
need it.

If you need to reinstall the demo with different parameters, be sure to fully
remove all the previous containers (refer below), images and volumes used by
the previous version of the demo in order to ensure that no information remains 
cached.

By default, this demo uses the ports ranging between 8080 and 8082 included.
These ports are also configurable by editing the
[docker-compose .env file](https://docs.docker.com/compose/env-file/)
located in the [same directory](.env). Refer to the comments within that file
for a documentation of the roles of the respective variables.

## Updating the demo

To ensure the update goes smoothly, you will need to run several commands to
make sure docker won't use previously built images, thus preventing certain
modules from updating.

(All the commands used in the tutorial below are documented in
[docker reference documentation](https://docs.docker.com/reference/))
First, you will need to stop the current demo.
This can be done by going into the directory where this `Readme.md` is located, 
and run the following command :

```bash
docker-compose down
```

This will stop all the containers launched when you last ran the demo.

Next step consists in removing the outdated images. If you know which parts
of the demo were updated precisely, you can use

```bash
docker images
```

to get the images id that you wish to remove and then use

```bash
docker rmi <Image ID>
```

to remove each of the images. The names of the images built by this demo
are written in the [docker-compose.yml](./docker-compose.yml) file.

If you don't know exactly what to update, then running the following command
will remove all the images built by this demo that could have been updated,
based on their name (use with this command with caution since the pattern
might match images foreign to this demo):

```bash
docker rmi -f $(sudo docker images "spatial-multimedia*" -q)
```

Once the images are removed, you will need to rebuild the demo. To ensure
docker won't use cached data that may take priority over the new updated data,
run the following command :

```bash
docker build --no-cache
```

Finally, when the build is completed, you can once again run (with "-d" if you need it in background.) :

```bash
docker compose up
```

## Known issues

### Postgres container not spinning up fast enough

The [Spatial-Multimedia-DB](https://github.com/VCityTeam/Spatial-Multimedia-DB)
component depends on a postgres DB and thus needs to "wait" for it to be up
and running. On some occasions it has been observed that the
Spatial-Multimedia-DB will start using the postgres DB while the postgres
docker has not finished its setup, resulting in the Spatial-lMultimedia-DB being
unable to connect to the database.

In this context, you might observe messages similar to the one shown below:

```bash
extended_doc_api | /api
extended_doc_api | Trying to connect to Database...
extended_doc_api | Config :  postgresql://postgres:password@postgres:5432/extendedDoc
extended_doc_api | Connection failed (psycopg2.OperationalError) could not connect to server: Connection refused
extended_doc_api |      Is the server running on host "postgres" (172.22.0.2) and accepting
extended_doc_api |      TCP/IP connections on port 5432?
extended_doc_api | 
extended_doc_api | (Background on this error at: http://sqlalche.me/e/e3q8)
```

Most often, relaunching the demo should solve the above issue.
Yet if the demo persistently fails then you might make sure that
the setup [.env file](.env) is properly and coherently configured.
