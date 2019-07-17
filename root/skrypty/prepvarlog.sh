#!/bin/bash
mkdir /var/log/{apache2,apt,exim4,fsck,installer}
touch /var/log/exim4/mainlog /var/log/fail2ban /var/log/fail2ban.log /var/log/vsftpd.log /var/log/lastlog
chmod -R u+rw /var/log/exim4
chown -R Debian-exim /var/log/exim4
mkdir /var/log/samba
touch /var/log/samba/log.{smbd,nmbd}  /usr/share/samba/panic-action
cp --preserve -r /mnt/dysk/var/* /var/
#chown -R www-data:www-data www/

