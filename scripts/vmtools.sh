#!/bin/sh

echo "Installing VirtualBox Guest Additions"
echo "mail=\ninstance=overwrite\npartial=quit" > /tmp/noask.admin
echo "runlevel=nocheck\nidepend=quit\nrdepend=quit" >> /tmp/noask.admin
echo "space=quit\nsetuid=nocheck\nconflict=nocheck" >> /tmp/noask.admin
echo "action=nocheck\nbasedir=default" >> /tmp/noask.admin
DEV=`/usr/sbin/lofiadm -a /export/home/vagrant/VBoxGuestAdditions.iso`
/usr/sbin/mount -o ro -F hsfs $DEV /mnt
/usr/sbin/pkgadd -a /tmp/noask.admin -G -d /mnt/VBoxSolarisAdditions.pkg all
/usr/sbin/umount /mnt
/usr/sbin/lofiadm -d $DEV
rm -f VBoxGuestAdditions.iso
