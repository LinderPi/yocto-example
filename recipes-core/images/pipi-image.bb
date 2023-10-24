SUMMARY = "PiPi image."
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

inherit core-image extrausers

IMAGE_FEATURES = " \
    read-only-rootfs \
"

EXTRA_USERS_PARAMS = " \
    usermod -p '\$6\$92TvUxAgcV/5o63r\$Esx3xAUPu8Ltun6LwsaSuxGi/tAFEx2t9Bf1MLk8woKz0qvmo1B2olM1GDaCYHhR/Ve6vKP1T0P5MrXLwoxlE.' root; \
"
