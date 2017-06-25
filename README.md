# Starcraft Installer

Utilities to install StarCraft Broodwar 1.18

## With Docker

Tested with Docker version 17.03.1-ce & Wine version 2.10 (Staging).

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

## Run from the image

```
wine ~/.wine/drive_c/Program\ Files\ \(x86\)/StarCraft/StarCraft.exe
```

## On a Local Ubuntu 16.04

### Install Wine Staging

Install [wine stagging on ubuntu](https://wine-staging.com/installation.html#distro_ubuntu).

```
wget -nc https://repos.wine-staging.com/wine/Release.key
sudo apt-key add Release.key
sudo apt-add-repository 'https://dl.winehq.org/wine-builds/ubuntu/'
sudo apt-get update
sudo apt-get install --install-recommends winehq-staging
```

Tested with the version wine-2.10 (Staging).

Does not work (for me) with:
 - distribution package, wine 1.6.2 (install KO)
 - distribution wine HQ, wine-stable 2.0.1 (install KO, launch KO)

### Download StarCraft-Setup.exe

Download the file `StarCraft-Setup.exe` from the [official blizzard website](https://starcraft.com/en-us/articles/20674424).

### Install

```
wine StarCraft-Setup.exe
```

### Launch

```
wine ~/.wine/drive_c/Program\ Files\ \(x86\)/StarCraft/StarCraft.exe
```
