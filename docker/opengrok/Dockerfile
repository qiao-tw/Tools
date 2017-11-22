# Dockerfile to build Ubuntu:14.04 + ROS-Indigo-desktop-full
FROM tomcat:8.0

MAINTAINER Ubuntu Builds Eng "qiao.helloworld@gmail.com"

# Sets language to UTF8 : this works in pretty much all cases
RUN mkdir /src
RUN mkdir /data
RUN ln -s /data /var/opengrok
RUN ln -s /src /var/opengrok/src
RUN wget "https://github.com/OpenGrok/OpenGrok/releases/download/1.1-rc17/opengrok-1.1-rc17.tar.gz" -O /tmp/opengrok-1.1-rc17.tar.gz
RUN tar zxvf /tmp/opengrok-1.1-rc17.tar.gz -C /

# Install necessary packages
RUN rm -rf /var/lib/apt/lists/*
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 40976EAF437D05B5
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32
RUN echo "deb mirror://mirrors.ubuntu.com/mirrors.txt xenial main restricted universe multiverse" > /etc/apt/sources.list && \
    echo "deb mirror://mirrors.ubuntu.com/mirrors.txt xenial-updates main restricted universe multiverse" >> /etc/apt/sources.list && \
    echo "deb mirror://mirrors.ubuntu.com/mirrors.txt xenial-security main restricted universe multiverse" >> /etc/apt/sources.list

RUN apt-get update && apt-get dist-upgrade -y && apt-get install -y \
  apt-utils \
  exuberant-ctags \
  software-properties-common
  #  --no-install-recommends

RUN apt-add-repository ppa:webupd8team/java
RUN apt-get update && apt-get dist-upgrade -y && apt-get install -y \
  oracle-java8-set-default
#  --no-install-recommends

ENV SRC_ROOT /src
ENV OPENGROK_TOMCAT_BASE /usr/local/tomcat
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
ENV PATH /opengrok-1.1-rc17/bin:$PATH

ENV CATALINA_BASE /usr/local/tomcat
ENV CATALINA_HOME /usr/local/tomcat
ENV CATALINA_TMPDIR /usr/local/tomcat/temp
ENV JRE_HOME /usr
ENV CLASSPATH /usr/local/tomcat/bin/bootstrap.jar:/usr/local/tomcat/bin/tomcat-juli.jar

WORKDIR $CATALINA_HOME
RUN /opengrok-1.1-rc17/bin/OpenGrok deploy

EXPOSE 8080
ADD scripts /scripts
CMD ["/scripts/start.sh"]
