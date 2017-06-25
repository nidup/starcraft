# Starcraft for Ubuntu 16.04

## Install Wine Staging

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

## Download Starcraft 1.18

Download the file `StarCraft-Setup.exe` from the [official blizzard website](https://starcraft.com/en-us/articles/20674424).

## Install

```
wine StarCraft-Setup.exe
```

## Run

```
wine ~/.wine/drive_c/Program\ Files\ \(x86\)/StarCraft/StarCraft.exe
```
