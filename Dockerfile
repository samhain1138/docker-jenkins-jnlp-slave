FROM jenkinsci/jnlp-slave
MAINTAINER Adria Galin <@adriagalin>

ENV DOCKER_VERSION=18.06.1-ce DOCKER_COMPOSE_VERSION=1.14.0 KUBECTL_VERSION=v1.14.1

USER root

RUN apt-get update && \
     apt-get -y install apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common && \
     curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
     add-apt-repository \
     "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
     $(lsb_release -cs) \
     stable" && \
     apt-get update && \
     apt-get -y install docker-ce
