FROM debian:10.9-slim

MAINTAINER mark.hsieh

RUN apt-get update
RUN apt-get upgrade -y
RUN lsb_release -a | tee /etc/os-version
RUN cat /etc/os-release

RUN apt-get install --no-install-recommends --no-install-suggests -y -q \
    apt-utils \
    net-tools \
    telnet \
    curl \
    supervisor \
    tofrodos \
    vim \
    openssl \
    procps \
    zip \
    unzip \
    nginx \
    moreutils

RUN mkdir -p /opt/supervisord
RUN mkdir -p /opt/startup
RUN mkdir -p /opt/logratate
RUN mkdir -p /opt/app
WORKDIR /opt/app

COPY ./entrypoint.sh /opt/
RUN chmod +rw /opt/entrypoint.sh
RUN fromdos -d /opt/entrypoint.sh
RUN chmod +x /opt/entrypoint.sh

EXPOSE 80 443
CMD [ "/bin/bash", "/opt/entrypoint.sh" ]
