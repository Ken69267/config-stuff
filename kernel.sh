#! /bin/bash
P="/usr/src/linux/"
KNAME="Core2"

echo "Preparing to build ${KNAME} kernel"

echo "Copying old config to new kernel"
zcat /proc/config.gz > ${P}.config
cd ${P}

if [ ! -e .config ];
then
	echo "Failed copying old config!"
	exit 1
fi

echo "Calling make oldconfig:"
make oldconfig

echo "Compiling kernel..."
make -j3 && make -j3 modules_install

echo "Mounting /boot"
mount /boot/

echo "Backing up old kernel and installing new kernel..."
cp /boot/${KNAME} /boot/${KNAME}.old
cp arch/x86/boot/bzImage /boot/${KNAME}

umount /boot

echo "Done"
