#!/usr/bin/env bash
MountPoint='/media'
sshDir='D/ssh'

GIT_NAME='Your name'
GIT_EMAIL='yourmail@example.com'

repositories=(
    ppa:webupd8team/java
    ppa:nilarimogard/webupd8
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
    unity-webapps-common
)
