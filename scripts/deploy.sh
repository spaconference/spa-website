#!/bin/bash
set -e

curl --ftp-create-dirs -T _site/README.md -u $FTP_USER:$FTP_PASSWORD ftp.gridhost.co.uk/public_html/tmp/
