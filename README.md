Supysonic Docker Image
==========================

Docker container for [supysonic](https://github.com/spl0k/supysonic)the
ingenious music server.

Install
=======

1. Clone this repository
2. Optionally setup a virtualenv
3. Install docker-compose

    ```shell
    pip install docker-compose
    ```
4. Build supysonic docker image

    ```shell
    docker-compose build 
    ```
5. Setup the database

   This repo comes with a sqlite configuration. You can change to mysql or
   postgres by editing [supysonic.conf](supysonic.conf)
   
   ```shell
   sqlite3 ./data/supysonic.db < ./schema/sqlite.sql
   ```

6. Link your music folder

    For example if you want to link to `~/Music`
    ```shell
    ln -s ~/Music ./music
    ```

7. Create supysonic user and add music folders using supysonic-cli

    ```shell
    docker-compose run supysonic supysonic-cli
    ```
    
    Detailed instructions on the use of cli can be found [supysonic's README](https://github.com/spl0k/supysonic/blob/master/README.md#quickstart)
    
8. Start supysonic as daemon

    ```shell
    docker-compose up -d
    ```

9. Connect to http://localhost:8000 and enjoy!


Use
====

Supysonic exposes only a [Subsonic](http://subsonic.org/) compatible interface
and thus it can by only used through apps that can connect to the API. I enjoy
supysonic using
[DSub](https://play.google.com/store/apps/details?id=github.daneren2005.dsub) on
Android
([github repo with apks](https://github.com/daneren2005/Subsonic/releases)) and
[Jamstash](http://www.jamstash.com/) on the web.

