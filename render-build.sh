#!/bin/bash
# Install Chromium dependencies for Puppeteer
apt-get update
apt-get install -y wget gnupg ca-certificates
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt-get install -y ./google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb
