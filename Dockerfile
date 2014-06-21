FROM       phusion/baseimage
MAINTAINER Mickael Cassy <twitter@mickaelcassy>
RUN        apt-get -y update

RUN        apt-get -y install wget
RUN        apt-get -y install pkg-config
RUN        apt-get -y install libssl-dev
RUN        apt-get -y install g++
RUN        apt-get -y install libcppunit-dev
RUN        apt-get -y install libcurl4-openssl-dev
RUN        apt-get -y install libncurses-dev
RUN        apt-get -y install subversion
RUN        mkdir rtorrent

# install libtorrent
WORKDIR    rtorrent
RUN        wget http://libtorrent.rakshasa.no/downloads/libtorrent-0.13.4.tar.gz
RUN        tar -xzf libtorrent-0.13.4.tar.gz
RUN        rm libtorrent-0.13.4.tar.gz
WORKDIR    rtorrent/libtorrent-0.13.4
RUN        ./configure
RUN        make
RUN        make install
RUN        
RUN        
RUN        

# install xmlrpc
WORKDIR    rtorrent
RUN        svn checkout http://svn.code.sf.net/p/xmlrpc-c/code/stable xmlrpc-c
WORKDIR    rtorrent/xmlrpc-c
RUN        ./configure --disable-cplusplus
RUN        make
RUN        make install
RUN        
RUN        

# install rtorrent
WORKDIR    rtorrent
RUN        wget http://libtorrent.rakshasa.no/downloads/rtorrent-0.9.4.tar.gz
RUN        tar -xzf rtorrent-0.9.4.tar.gz
RUN        rm rtorrent-0.9.4.tar.gz
WORKDIR    rtorrent/rtorrent-0.9.4
RUN        ./configure --with-xmlrpc-c
RUN        make
RUN        make install
RUN        sudo ldconfig


ADD        .rtorrent.rc ~/.rtorrent.rc
EXPOSE     5000

ENTRYPOINT rtorrent
