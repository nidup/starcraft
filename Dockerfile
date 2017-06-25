FROM ubuntu:16.04

RUN dpkg --add-architecture i386

RUN apt-get update && apt-get install -y wget software-properties-common python-software-properties apt-transport-https

RUN wget -nc https://repos.wine-staging.com/wine/Release.key
RUN apt-key add Release.key
RUN apt-add-repository 'https://dl.winehq.org/wine-builds/ubuntu/'

RUN more /etc/apt/sources.list | grep 'wi'

RUN apt-get update && apt-get install -y --install-recommends winehq-staging && rm -rf /var/cache/apt/

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
mkdir -p /home/developer && \
mkdir -p /etc/sudoers.d && \
echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
echo "developer:x:${uid}:" >> /etc/group && \
echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
chmod 0440 /etc/sudoers.d/developer && \
chown ${uid}:${gid} -R /home/developer

USER developer
ENV HOME /home/developer
WORKDIR /home/developer

COPY StarCraft-Setup.exe /home/developer/
