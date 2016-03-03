#!/usr/bin/env bash
set -o nounset
set -o errexit
cd "$(dirname "$0/")"

CONFIGS='config files'
GRUB_CONFIG='/etc/default/grub'
NEEDED_PACKAGES=(
    curl
)

source cli.sh

main() {
    source config.sh

    add_ppa_repositories
    install_needed_packages
    add_repositories_with_curl
    hanlde_apt_packages
    disable_quiet_splash_in_grub

    # without sudo
    make_symlinks_to_mounted_devices
    configure_system

#    check_tools_version_and_install_newest
#    create_swap_file
}

add_ppa_repositories() {
    for ppa in ${repositories[*]}; do
        suRun add-apt-repository "$ppa" -y
    done
}

install_needed_packages() {
    suRun apt-get -y install ${NEEDED_PACKAGES[*]}
}

add_repositories_with_curl() {
    for link in ${manual_installed_repositories[*]}; do
        suRun "curl -s $link | sudo bash"
    done
}
hanlde_apt_packages() {
    suRun apt-get -y update
    suRun apt-get -y upgrade
    suRun apt-get -y purge ${remove_list[*]}
    suRun apt-get -y install ${install_list[*]}
    suRun apt-get -y autoremove --purge
    suRun apt-get -y autoclean
}

disable_quiet_splash_in_grub() {
    suRun sed -i.$(date +%d.%m.%y).bac 's/quiet splash//g' "$GRUB_CONFIG"
    suRun update-grub
}

configure_system() {
    # Git
    Run cp "$CONFIGS/.git*" ~/
    Run "echo \"$CONFIGS/.bashrc\" >> ~/.bashrc"
    Run git config --global user.email "$GIT_EMAIL"
    Run git config --global user.name "$GIT_NAME"

    # Copy ssh keys
    Run cp "$sshDir/*" ~/.ssh/
    Run chmod 0600 ~/.ssh/*.ppk
    Run chmod 0600 ~/.ssh/id_rsa

    # TODO modify fstab to mount as your uid and gid
}

make_symlinks_to_mounted_devices() {
    Run shopt -s extglob
    for disk in "$MountPoint/!($USER)"; do
        Run ln -s "$disk" ~/
    done
}

Run() {
    if [ "$TEST" == true ]; then
        echo "$*"
        return 0
    fi
    eval "$@"
}

suRun() {
    if [ "$TEST" == true ]; then
        echo "sudo $*"
        return 0
    fi
    eval "sudo $@"
}

main

