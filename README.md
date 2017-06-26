# StarCraft Brood War

Docker files to install StarCraft Brood War 1.18 or StarCraft Brood War 1.16.1.

![Image of BroodWar](https://github.com/nidup/starcraft/raw/master/doc/brood-war.jpg)

Tested on Ubuntu 16.04 with Docker 17.03.1-ce.

## Use StarCraft Brood War v1.18

Installed from the [official blizzard website](https://starcraft.com/en-us/articles/20674424).

Pull the image  (from the host):

```
docker pull nidup/starcraft:v118
```

Run the image (from the host):

```
docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --security-opt seccomp=unconfined nidup/starcraft:v118 bash
```

Launch the game (from the image):

```
wine ~/.wine/drive_c/Program\ Files\ \(x86\)/StarCraft/StarCraft.exe
```

## Use StarCraft Brood War v1.16.1

Pull the image  (from the host):

```
docker pull nidup/starcraft:v116
```

Run the image (from the host):

```
docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --security-opt seccomp=unconfined nidup/starcraft:v116 bash
```

Launch the game (from the image):

```
wine ~/.wine/drive_c/Program\ Files\ \(x86\)/StarCraft1161/StarCraft.exe
```

## Troubleshooting

On your host:
 - your user id and group id should be 1000
 - your user must be in the docker group
 - you shouldn't run docker with sudo (to be able to use the host server x)

To check your user and group id use the command `id`:

```
uid=1000(nico) gid=1000(nico) groups=1000(nico), 999(docker)
```

## Sources

[Dockerfile](https://github.com/nidup/starcraft/)

## Update the Images

[Update the Images](https://github.com/nidup/starcraft/blob/master/doc/update.md)
