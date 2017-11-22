#!/bin/bash

start_opengrok(){
    # wait for tomcat startup
    while ! ( ps aux|grep -q org.apache.catalina.startup.Bootstrap ); do
        sleep 1;
    done
    OpenGrok index /src
}

start_opengrok & catalina.sh run
