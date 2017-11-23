#!/bin/bash
set -e

if [ "$TRAVIS_PULL_REQUEST" != "false"]; then
    rsync -avz -e "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" --progress _site/ $SSH_USER@$DEPLOY_HOST:public_html/staging/$1
    exit 0
fi

rsync -avz -e "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" --progress _site/ $SSH_USER@$DEPLOY_HOST:public_html/$1
