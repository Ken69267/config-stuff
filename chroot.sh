#!/bin/sh

if [ -z "$@" ]; then
        echo "missing operand"
        exit 1
fi

mount --bind /dev "$@"/dev
mount --bind /dev/pts "$@"/dev/pts
mount --bind /sys "$@"/sys
mkdir -p "$@"/usr/portage
mkdir -p "$@"/usr/portage/distfiles
mount --bind /usr/portage "$@"/usr/portage
mount --bind /usr/portage/distfiles "$@"/usr/portage/distfiles
mount -t proc none "$@"/proc
cp /etc/resolv.conf "$@"/etc
mount --bind /tmp "$@"/tmp

if [ -x "$@/${SHELL}" ]; then
        exe=${SHELL}
else
        exe=/bin/zsh
fi

chroot "$@" ${exe}
