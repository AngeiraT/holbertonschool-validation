#!/bin/bash
# Update and install 'Hugo' and 'Make'
apt-get update && apt-get install -y hugo make
# Download lastest release of 'Hugo'
curl -L https://github.com/gohugoio/hugo/releases/download/v0.109.0/hugo_extended_0.109.0_linux-amd64.deb -o hugo.deb
# Install the latest version of 'Hugo'
apt install ./hugo.deb
rm hugo.deb
# Build the website
make build
