#!/bin/bash

path=$(readlink -f $(dirname $BASH_SOURCE))
image_path=$path/build/tmp/deploy/images/raspberrypi4/core-image-minimal-raspberrypi4.wic.bz2

echo "Flash SD card ..."
echo "- Path to image: $image_path"

if [[ ($# -lt 1) || !( -e $1) ]]; then
    echo "- Please provide file path to SD card block device as argument!"
    exit 1
fi

sd_path=$1

echo "- Path to SD card: $sd_path"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "- Linux OS detected"

    if (command -v bmaptool > /dev/null); then
        echo "- bmap-tools installed"
        umount $sd_path*
        bmaptool copy $image_path $sd_path
    else
        echo "- Please install bmap-tools!"
        exit 1
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "- MacOS detected"
    echo "- This script is currently not supported on MacOS!"
    exit 1
else
    echo "- This script is not supported on your operating system ($OSTYPE)!"
    exit 1
fi
