#!/bin/bash
set -ex

bundle exec jekyll build
bundle exec htmlproofer --url-ignore "http://spaconference-history.org/scripts/myprofile.php,https://spaconference.org/scripts/makeproposal.php" --assume-extension --url-swap "^${1}": ./_site
