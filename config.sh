#!/usr/bin/env bash
MountPoint='/media'             # Folder where you mounted other drives during instalation
sshDir='/media/D/ssh'           # Path to your ssh keys
mainSSHkey='#$% Key.ppk %$#'    # key that should be set as id_rsa

GIT_NAME='#$% Your name %$#'
GIT_EMAIL='#$% yourmail@example.com'

# accepts oracle-java8-installer licence, if you don't need it remove this line
Run 'echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections'


repositories=(
    ppa:webupd8team/java        # for oracle-java8-installer
    ppa:nilarimogard/webupd8    # for nautilus-columns
    ppa:webupd8team/sublime-text-3
)

manual_installed_repositories=(
    https://packagecloud.io/install/repositories/gyazo/gyazo-for-linux/script.deb.sh
)

install_list=(
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
    vim
    sublime-text-installer
    npm
    nodejs-legacy
)

remove_list=(
    unity-webapps-common    # Amazon-something by default in Unity desktop
)
