#!/usr/bin/env bash
MountPoint='/media'             # Folder where you mounted other drives during instalation
sshDir='/media/D/ssh'           # Path to your ssh keys
mainSSHkey='#$% Key.ppk %$#'    # key that should be set as id_rsa


echo Your git name:
read GIT_NAME
echo Your git email:
read GIT_EMAIL

# accepts oracle-java8-installer licence, if you don't need it remove this line
Run 'echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections'


repositories=(
    ppa:webupd8team/java        # for oracle-java8-installer
    ppa:nilarimogard/webupd8    # for nautilus-columns
)

manual_installed_repositories=(
    https://deb.nodesource.com/setup_10.x
)

manual_gpg=(
    https://download.sublimetext.com/sublimehq-pub.gpg
)

sudo touch /etc/apt/sources.list.d/extra.list
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

install_list=(
    synaptic
    git
    oracle-java8-installer
    tree
    terminator
    htop
    vim
    sublime-text
    # Python developer
    python3-dev
    python3-pip
    # Webdeveloper tools
    nodejs
    # Other
    gimp
    nautilus-image-converter
    #nautilus-columns
)

remove_list=(
    ubuntu-web-launchers    # Amazon-something by default in Unity desktop
)
