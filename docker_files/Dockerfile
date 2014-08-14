FROM        phusion/baseimage
MAINTAINER  Mickael Cassy <twitter@mickaelcassy>
RUN       /etc/my_init.d/00_regen_ssh_host_keys.sh
CMD       ["/sbin/my_init"]
ENV       HOME /root

# Installs dependencies
RUN         apt-get -y update
RUN         apt-get -y install wget pkg-config libssl-dev g++ libcppunit-dev libcurl4-openssl-dev libncurses-dev subversion make

# Installs libtorrent
WORKDIR     /rtorrent
RUN         (wget http://libtorrent.rakshasa.no/downloads/libtorrent-0.13.4.tar.gz) && \
            (tar -xzf libtorrent-0.13.4.tar.gz) && (rm libtorrent-0.13.4.tar.gz)
WORKDIR     libtorrent-0.13.4
RUN         (./configure) && (make) && (make install)

# Installs xmlrpc
WORKDIR     /rtorrent
RUN         svn checkout http://svn.code.sf.net/p/xmlrpc-c/code/stable xmlrpc-c
WORKDIR     xmlrpc-c
RUN         (./configure --disable-cplusplus) && (make) && (make install)

# Installs rtorrent
WORKDIR     /rtorrent
RUN         (wget http://libtorrent.rakshasa.no/downloads/rtorrent-0.9.4.tar.gz) && \
            (tar -xzf rtorrent-0.9.4.tar.gz) && (rm rtorrent-0.9.4.tar.gz)
WORKDIR     rtorrent-0.9.4
RUN         (./configure --with-xmlrpc-c) && (make) && (make install) && (ldconfig)


ADD         .rtorrent.rc /root/.rtorrent.rc
EXPOSE      5000 63256

# Creates rtorrent as a service (using runit)
WORKDIR     /etc/service/rtorrent
ADD        ./run.sh /etc/service/rtorrent/run
RUN        chmod +x ./run

# Cleans up APT when done.
RUN        apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

