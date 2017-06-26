# Update Images

## Build the Empty Image

### Clone this Repository

```
$ cd ~/git/
$ git clone git@github.com:nidup/starcraft.git
$ cd ~/git/starcraft
```

### Build the Empty Image

```
$ docker build -t nidup/starcraft:empty .
```

### Push the Empty Image

```
$ docker login -u nidup
$ docker push nidup/starcraft:empty
```

## Build v1.18 Image

### Download StarCraft-Setup.exe

Download the file `StarCraft-Setup.exe` in the `install` folder from the [official blizzard website](https://starcraft.com/en-us/articles/20674424).

```
$ cd ~/git/starcraft/install
$ ls
$ StarCraft-Setup.exe
```

### Run the Empty Image

```
$ docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/nico/git/starcraft/install:/home/developer/install --security-opt seccomp=unconfined nidup/starcraft:empty bash
```

### Install from the Empty Image

```
$ wine install/StarCraft-Setup.exe
```

Accept to install Mono & Gecko when Wine proposes this option.

It may fails a first time during the install just after the Mono & Gecko install.
Re-launch the same command, it should ask to accept the condition and proceed to the install.

Once the install done, don't launch, close the popin and let the image open.

### Create a New Image

In order to keep this install and not have to re-install each time you run the container, we can commit the current state.

Letting your image running, from your host, you can open a new terminal and commit the change as a new version:

```
$ docker ps
CONTAINER ID        IMAGE                   COMMAND             CREATED             STATUS              PORTS               NAMES
45e51a9fdd1e        nidup/starcraft:empty   "bash"              22 minutes ago      Up 22 minutes                           friendly_hodgkin

$ docker commit 45e51a9fdd1e nidup/starcraft:v118
```

Check the image:

```
$ docker images
REPOSITORY                                                   TAG                     IMAGE ID            CREATED             SIZE
nidup/starcraft                                              v118                    496621e99e92        27 seconds ago      5.82 GB
```

We can now stop the image:

```
developer@45e51a9fdd1e:~$ exit
```

### Push the v118 Image

```
$ docker push nidup/starcraft:v118
```

## Build v1.16.1 Image

### Download Brood+War.7z

Install following the [ICC Tutorial](https://iccup.com/en/starcraft/sc_start.html).

Download the file `Brood+War.7z` in the `install` folder from the [ICC](http://www.mediafire.com/file/nao9aef0n6p27dg/Brood+War.7z).

Download the file `SC-1161.exe` in the `install` folder from the [official blizzard website](http://ftp.blizzard.com/pub/starcraft/patches/PC/SC-1161.exe).

```
$ cd ~/git/starcraft/install
$ ls
$ Brood+War.7z SC-1161.exe
```

Unzip Brood+War.7z

### Run the v118 Image

```
$ docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/nico/git/starcraft/install:/home/developer/install --security-opt seccomp=unconfined nidup/starcraft:v118 bash
```

### Copy the ICC client

```
$ mkdir ~/.wine/drive_c/Program\ Files\ \(x86\)/StarCraft1161
$ cp -r install/Brood\ War/* ~/.wine/drive_c/Program\ Files\ \(x86\)/StarCraft1161/
```

### Create a New Image

In order to keep this install and not have to re-install each time you run the container, we can commit the current state.

Letting your image running, from your host, you can open a new terminal and commit the change as a new version:

```
$ docker ps
CONTAINER ID        IMAGE                  COMMAND             CREATED             STATUS              PORTS               NAMES
c4266930ad4d        nidup/starcraft:v118   "bash"              9 minutes ago       Up 9 minutes                            upbeat_pasteur

$ docker commit c4266930ad4d nidup/starcraft:v116
```

Check the image:

```
$ docker images
REPOSITORY                                                   TAG                     IMAGE ID            CREATED             SIZE
nidup/starcraft                                              v116                    622d592ea3f6        15 seconds ago      5.97 GB
```

We can now stop the image:

```
developer@45e51a9fdd1e:~$ exit
```

### Push the v116 Image

```
$ docker push nidup/starcraft:v116
```
