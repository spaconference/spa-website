#!/bin/bash
set -ex

bundle exec jekyll build
bundle exec htmlproofer --assume-extension --url-swap "^${1}": ./_site
