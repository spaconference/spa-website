#!/bin/bash
set -e

rsync -avz -e "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" --progress _site/ $SSH_USER@$DEPLOY_HOST:public_html/$1
