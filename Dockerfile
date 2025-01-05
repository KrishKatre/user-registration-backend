FROM ghcr.io/puppeteer/puppeteer:19.7.2

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/google-chrome-stable

WORKDIR /usr/src/app

# Copy package files and adjust permissions
COPY package*.json ./
RUN chmod 644 package*.json

# Install dependencies
RUN npm ci

# Copy the rest of the application code
COPY . .

# Ensure proper permissions for Puppeteer's user
RUN chmod -R 755 /usr/src/app

# Switch to Puppeteer's default user
USER pptruser

CMD ["node", "index.js"]
