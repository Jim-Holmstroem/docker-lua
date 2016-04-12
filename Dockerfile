FROM centos:7.2.1511

MAINTAINER Jim Holmstrom <jim.holmstroem@gmail.com>

ENV LUA_MAJOR_VERSION 5.2
ENV LUA_MINOR_VERSION 4
ENV LUA_VERSION ${LUA_MAJOR_VERSION}.${LUA_MINOR_VERSION}

RUN yum install -y make tar unzip gcc gcc-devel openssl-devel readline-devel && yum cl

RUN curl -L http://www.lua.org/ftp/lua-${LUA_VERSION}.tar.gz | tar xzf - && \
    cd /lua-$LUA_VERSION && \
    make linux test && \
    make install && \
    cd .. && rm /lua-$LUA_VERSION -rf
