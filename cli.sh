#!/usr/bin/env bash
DESC="$0 -- Utility for configuring your bare installation of Linux"

Help() {
    echo "\
$DESC

Available options:

-d      Dry run. Show commands, do not really execute."

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
