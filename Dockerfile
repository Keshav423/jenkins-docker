FROM jenkins/jenkins:lts

USER root
RUN set -x \
    && apt-get update && apt-get dist-upgrade -qy \
    && apt-get install -y sudo \
    && apt-get clean \
    && rm -rvf /var/lib/apt/lists/* \
               /var/tmp/* \
               /tmp/*

USER jenkins
COPY files/plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
