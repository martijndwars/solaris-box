#!/bin/sh

# Setup the vagrant key
echo "Setting the vagrant ssh pub key"
mkdir /export/home/vagrant/.ssh
chmod 700 /export/home/vagrant/.ssh
touch /export/home/vagrant/.ssh/authorized_keys
if [ -f /usr/sfw/bin/wget ] ; then
  /usr/sfw/bin/wget --no-check-certificate https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub -O /export/home/vagrant/.ssh/authorized_keys
else
  /usr/bin/wget --no-check-certificate https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub -O /export/home/vagrant/.ssh/authorized_keys
fi
chmod 600 /export/home/vagrant/.ssh/authorized_keys
chown -R vagrant:staff /export/home/vagrant/.ssh

echo "Disabling sendmail and asr-norify"
/usr/sbin/svcadm disable sendmail
/usr/sbin/svcadm disable asr-notify

echo "Clearing log files"
cp /dev/null /var/adm/messages
cp /dev/null /var/log/syslog
cp /dev/null /var/adm/wtmpx
cp /dev/null /var/adm/utmpx

echo "Zeroing disk, this takes about 10 mins"
dd if=/dev/zero of=/EMPTY bs=1024
rm -f /EMPTY

echo "Post-install done"
