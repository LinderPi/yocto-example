#!/bin/bash

if [[ $# -lt 2 ]]; then
    echo "- Please provide image name as first argument!"
    echo "- Please provide file path to SD card block device as second argument!"
    exit 1
fi

path=$(readlink -f $(dirname $BASH_SOURCE)/..)
image_path=$path/build/tmp/deploy/images/raspberrypi4/$1-raspberrypi4.wic.bz2
sd_path=$2

if [[ !(-e $image_path) ]]; then
    echo "- Image at $image_path does not exist!"
    exit 1
elif [[ !(-e $sd_path) ]]; then
    echo "- Provided SD card block device is not a file path!"
    exit 1
fi

echo "Flash SD card ..."
echo "- Path to image: $image_path"
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
