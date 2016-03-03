#!/usr/bin/env bash
MountPoint='/media'             # Folder where you mounted other drives during instalation
sshDir='/media/D/ssh'           # Path to your ssh keys

GIT_NAME='Your name'
GIT_EMAIL='yourmail@example.com'

repositories=(
    ppa:webupd8team/java        # for oracle-java8-installer
    ppa:nilarimogard/webupd8    # for nautilus-columns
)

manual_installed_repositories=(
    https://packagecloud.io/install/repositories/gyazo/gyazo-for-linux/script.deb.sh
)

packet_list=(
    synaptic
    git
    oracle-java8-installer
    tree
    terminator
    python3-pip
    ipython3
    htop
    virtualenvwrapper
    ruby-sass
    gimp
    nautilus-image-converter
    nautilus-columns
    gyazo
)

remove_list=(
    unity-webapps-common    # Amazon-somthing by default in Unity desktop
)
