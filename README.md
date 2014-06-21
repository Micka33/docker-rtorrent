docker-rtorrent
===============

Create a docker that contains [rtorrent][1] ready to use.  


[Rtorrent][1] will restart automatically when it crash or is shutted down.  


Docker-rtorrent config file is [here][2].  
This docker-rtorrent is preconfigured to work with [docker-sickrage][3].  

A bundle including sickrage/rtorrent, ready-to-use, is coming soon on Vagrant.  


##How to build/run

```
> git clone --depth=1 https://github.com/Micka33/docker-rtorrent.git .
> docker build --tag micka33/rtorrent .
```


##Check it's running


```
> docker top rtorrent
```

##launch as deamon

```
> docker run --name rtorrent -d -p 0.0.0.0:63256:63256 micka33/rtorrent
```


[3]:  https://github.com/echel0n/SickRage
[2]:  https://github.com/Micka33/docker-rtorrent/blob/master/.rtorrent.rc
[1]:  https://github.com/rakshasa/rtorrent/wiki
