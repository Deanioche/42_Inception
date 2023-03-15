#!/bin/sh
#   _   _   _     _   _   _   _   _   _   _   _   _   _   _  
#  / \ / \ / \   / \ / \ / \ / \ / \ / \ / \ / \ / \ / \ / \ 
# ( S | S | L ) ( C | e | r | t | i | f | i | c | a | t | e )
#  \_/ \_/ \_/   \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ 

# *************************************************************************** #
apk add --no-cache nginx openssl
mkdir -p /etc/nginx/ssl
openssl req -x509 -new -newkey rsa:4096 -nodes -keyout /etc/nginx/ssl/dohyulee.key -out /etc/nginx/ssl/dohyulee.crt -subj "/C=KR/ST=Seoul/L=Seoul/O=wordpress/OU=/CN=dohyulee.42.fr"
# *************************************************************************** #
