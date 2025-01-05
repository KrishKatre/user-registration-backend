#!/bin/bash
set -e # Exit on error

echo "Installing dependencies and Chrome for Puppeteer..."

# Update system and install necessary dependencies
apt-get update
apt-get install -y wget gnupg ca-certificates

# Download and install Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt-get install -y ./google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

echo "Setup complete."
