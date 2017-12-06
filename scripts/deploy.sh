#!/bin/bash
set -e

# Note this does not delete files that have been removed from the source, as the programme is generated outside of this project
# and purging on deploy would remove the programme.
rsync -avz -e "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" --progress _site/ $SSH_USER@$DEPLOY_HOST:public_html/$1
