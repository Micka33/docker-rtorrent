docker-rtorrent
===============

Create a docker that contains [rtorrent][1] ready to use.  


[Rtorrent][1] will restart automatically when it crash or is shutted down.  


Docker-rtorrent config file is [here][2].  
This docker-rtorrent is preconfigured to work with [docker-sickrage][3].  

A bundle including sickrage/rtorrent, ready-to-use, is coming soon on Vagrant.  


## How to install it ?

```
git clone https://github.com/Micka33/docker-rtorrent.git
cd docker-rtorrent
sudo docker build -t rtorrent_image ./docker_files
```

##launch as deamon

```bash
sudo docker run --name rtorrent -d -p 0.0.0.0:63256:63256 -p 127.0.0.1:5000:5000 -v `pwd`/mounted:/root/mounted rtorrent_image
```

##Check it's running

```bash
sudo docker top rtorrent
```

# About it

Rtorrent scgi is listening on 127.0.0.1:5000.  
It means anly local services can connect the scgi interface.  
You could install (ruTorrent)[4] to manage your rtorrent server through a web interface.  
*a ruTorrent docker is coming soon*


[4]:  http://doc.ubuntu-fr.org/rutorrent
[3]:  https://github.com/Micka33/docker-sickrage
[2]:  https://github.com/Micka33/docker-rtorrent/blob/master/docker_files/.rtorrent.rc
[1]:  https://github.com/rakshasa/rtorrent/wiki
