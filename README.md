# Starcraft Brood War

Docker files to install StarCraft Brood War 1.18

![Image of BroodWar](https://github.com/nidup/starcraft/raw/master/doc/brood-war.jpg)

Tested on Ubuntu 16.04 with Docker 17.03.1-ce, the container using Wine version 2.10 (Staging).

### Clone this repository

```
cd ~/git/
git clone git@github.com:nidup/starcraft.git
cd ~/git/starcraft
```

### Download StarCraft-Setup.exe

Download the file `StarCraft-Setup.exe` in the folder from the [official blizzard website](https://starcraft.com/en-us/articles/20674424).

```
cd ~/git/starcraft
ls
Dockerfile  README.md  StarCraft-Setup.exe
```

## Build the image

```
docker build -t starcraft .
```

## Run the image

```
docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --security-opt seccomp=unconfined starcraft bash
```

## Install from the image

```
wine StarCraft-Setup.exe
```

Accept to install Mono & Gecko when Wine proposes this option.

It may fails a first time during the install just after the Mono & Gecko install.
Re-launch the same command, it should ask to accept the condition and proceed to the install.

## Commit the container

In order to keep this install and not have to re-install each time you run the container, we can commit the current state.

Letting your image running, from your host, you can open a new terminal and commit the change as a new version:

```
cd ~/git/starcraft
docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
eaed235c833e        starcraft           "bash"              8 minutes ago       Up 8 minutes                            dreamy_blackwell

docker commit eaed235c833e nidup/startcraft:version1
sha256:64833859f8db864964a55930cedac6143d563a3336fe36fd3e9b67713737e67c
```

Check the image:

```
docker images
REPOSITORY                                                   TAG                     IMAGE ID            CREATED             SIZE
nidup/startcraft                                             version1                64833859f8db        5 minutes ago       5.82 GB
```

We can now stop the image, from the container:

```
developer@eaed235c833e:~$ exit
```

## Launch Starcraft

Run the image using the image id you previously committed:
```
cd ~/git/starcraft
docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --security-opt seccomp=unconfined 64833859f8db bash

wine ~/.wine/drive_c/Program\ Files\ \(x86\)/StarCraft/StarCraft.exe
```

## Troubleshooting

On your host:
 - your user id and group id should be 1000
 - your user must be in the docker group and you shouldn't run docker with sudo

To check your user and group id:
```
$ id
uid=1000(nico) gid=1000(nico) groups=1000(nico), 999(docker)
```
