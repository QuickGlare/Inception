#!/bin/sh

echo "[Inception-Ftp] Configuring vsftpd..."

adduser $FTP_USR --disabled-password
echo "$FTP_USR:$FTP_PWD" | /usr/sbin/chpasswd &> /dev/null
chown -R $FTP_USR:$FTP_USR /var/www/html

echo "[Inception-Ftp] Started on :21"

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf