#!/bin/bash
set -e

rsync -r --delete-after --quiet _site/ $SSH_USER@$DEPLOY_HOST:public_html/tmp/
