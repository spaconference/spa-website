#!/bin/bash
set -e

bundle exec jekyll build
bundle exec htmlproofer --assume-extension --url-swap tmp/: ./_site
