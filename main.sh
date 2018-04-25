#!/usr/bin/env bash
set -o nounset
set -o errexit
cd "$(dirname "$0/")"
set -x

CONFIGS='config_files'
GRUB_CONFIG='/etc/default/grub'
NEEDED_PACKAGES=(
    curl
    apt-transport-https
    gcc
    g++
    make
    build-essential
)

source cli.sh

main() {
    source config.sh

    #add_ppa_repositories
    install_needed_packages
    #add_repositories_with_curl
    #add_gpg_keys
    handle_apt_packages
    # disable_quiet_splash_in_grub
    # TODO: problem with '' not forwarded into suRun

    # without sudo
    make_symlinks_to_mounted_devices
    configure_system

    # check_tools_version_and_install_newest
    # create_swap_file

    # TODO: add echo ${FUNCNAME[0]}
    # TODO: call one command feature
}

add_ppa_repositories() {
    for ppa in ${repositories[*]}; do
        suRun add-apt-repository "$ppa" -y
    done
}

install_needed_packages() {
    suRun apt -y install ${NEEDED_PACKAGES[*]}
}

add_repositories_with_curl() {
    for ((i = 0; i < ${#manual_installed_repositories[@]}; i++)); do
        suRun "curl -sL ${manual_installed_repositories[$i]} | sudo -E bash -"
    done
}

add_gpg_keys() {
    for ((i = 0; i < ${#manual_gpg[@]}; i++)); do
	Run "wget -qO - ${manual_gpg[$i]} | sudo apt-key add -"
    done
}

handle_apt_packages() {
    suRun apt -y update
    suRun apt -y upgrade
    suRun apt -y purge ${remove_list[*]}
    suRun apt -y install ${install_list[*]}
    suRun apt -y autoremove --purge
    suRun apt -y autoclean
}

disable_quiet_splash_in_grub() {
    suRun sed -i.$(date +%d.%m.%y).bac 's/quiet splash//g' "$GRUB_CONFIG"
    suRun update-grub
}

configure_system() {
    # Git
    Run cp "$CONFIGS/.git*" ~/
    Run cat "$CONFIGS/.bashrc >> ~/.bashrc"
    Run git config --global user.email "$GIT_EMAIL"
    Run git config --global user.name "$GIT_NAME"

    # Copy ssh keys
    if [ -d "$sshDir" ]; then
      Run mkdir -p ~/.ssh
      Run cp "$sshDir/*" ~/.ssh/
      Run cp "~/.ssh/$mainSSHkey" "~/.ssh/id_rsa"
      Run chmod 0600 ~/.ssh/*.ppk
      Run chmod 0600 ~/.ssh/id_rsa
    fi

    # TODO modify fstab to mount with your uid and gid
}

make_symlinks_to_mounted_devices() {
    Run shopt -s extglob
    for disk in "$MountPoint/!($USER)"; do
    	if [ "-e ~/$disk" ]; then
    		Run echo "~/$disk exists."
    	else
        	Run ln -s "$disk" ~/
        fi
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

