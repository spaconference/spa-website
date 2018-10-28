#!/bin/bash
set -ex

bundle exec jekyll build
bundle exec htmlproofer --url-ignore "https://spaconference.org/scripts/myprofile.php" --assume-extension --url-swap "^${1}": ./_site
