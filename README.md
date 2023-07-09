# meta-pipi

meta-pipi is a Yocto example project initiated privately by Pascal Linder. It is used to try out different features on a
Raspberry Pi 4 board.

## PiPi Distribution

PiPi is a pun from Raspberry Pi and the usual pre- or postfix in Pascal's projects.

## Usage

As the project builds upon [kas](https://github.com/siemens/kas), only a single command is required to create an image.

```bash
kas build meta-pipi/kas-project.yml
```

