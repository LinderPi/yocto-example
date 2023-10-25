# meta-pipi

meta-pipi is a Yocto example project initiated by Pascal Linder. It is used to try out different
features on a Raspberry Pi 4 board.

## PiPi Distribution and Image

PiPi is a pun from Raspberry Pi and the usual pre- or postfix in Pascal's projects. The image
provides a root user password (*z2P%b!Sy*) that can be used when connecting over the serial console.

## Build

As the project builds upon [kas](https://github.com/siemens/kas), only a single command is required
to create an image.

```bash
kas build kas-project.yml
```

In order to have access to the usual bitbake commands, type something similar to one of the
following into your console.

```bash
kas shell kas-project.yml
kas shell kas-project.yml -c 'bitbake -e pipi-image | grep ^IMAGE_INSTALL'
```
