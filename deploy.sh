#!/bin/sh

# NOTICE: This scripts removes all files from the target dir!!!

USER="root"
HOST="lacamera.xyz"
DIR="/var/www/homepage"

ssh -t $USER@$HOST "rm -rf '$DIR\*'" && scp -r [!.,!LICENSE,!README]* $USER@$HOST:$DIR
