#!/bin/sh

echo "[Inception-Nginx] Creating the SSL Certificate"
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/pcoletta.42.fr.key -out /etc/ssl/pcoletta.42.fr.crt -subj "/C=IT/L=Rome/O=42Roma/OU=student/CN=pcoletta.42.fr"

echo "[Inception-Nginx] Starting up Nginx"
nginx -g "daemon off;"