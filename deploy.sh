#!/bin/sh

# TODO: Replace scp with rsync

USER="root"
HOST="lacamera.xyz"
DIR="/var/www/homepage"

ssh -t $USER@$HOST "rm -rf '$DIR/*'"
rsync -ram --progress --force \
  --exclude={'.git/','LICENSE','deploy.sh'} \
  --include '*' \
  . $USER@$HOST:$DIR
