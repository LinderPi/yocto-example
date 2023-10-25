# meta-pipi

meta-pipi is a Yocto example project initiated by Pascal Linder. It is used to try out different
features on a Raspberry Pi 4 board.

## Raspberry Pi 4

Refer to the *doc/* folder for documentation about the embedded target.

### Serial Console

A serial console is used to interact directly with the Raspberry Pi. Therefore, an FTDI cable is
required that converts UART to USB. Following the cable pinout that, together with the schematics,
is used to connect the serial console.

1. GND (black)
2. CTS (brown)
3. Vcc (red)
4. TxD (orange)
5. RxD (yellow)
6. RTS (green)

## PiPi Distribution and Image

PiPi is a pun from Raspberry Pi and the usual pre- or postfix in Pascal's projects. The image
provides a root user password (*z2P%b!Sy*) that can be used when connecting over the serial console.

## Build

As the project builds upon [kas](https://github.com/siemens/kas), only a single command is required
to create an image.

```bash
kas build kas/pipi.yml
```

In order to have access to the usual bitbake commands, type something similar to one of the
following into your console.

```bash
kas shell kas/pipi.yml
kas shell kas/pipi.yml -c 'bitbake -e pipi-image | grep ^IMAGE_INSTALL'
```
