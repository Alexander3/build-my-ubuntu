#!/usr/bin/env bash

Help() {
    echo "$0 -- Utility for configuring your bare installation of Linux"
    echo "Available options:"
    echo "-d      Dry run. Show commands, do not really execute."
    exit ${1:-0}
}

TEST=false
while getopts "hd" arg "$@"; do
    case "$arg" in
        h)  Help
            ;;
        d)  TEST=true
            ;;
    esac
done
