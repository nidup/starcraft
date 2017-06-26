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
sha256:496621e99e92ebaa9b76b43cee69ddd75c724192f082efdefc672d44db643f91
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
