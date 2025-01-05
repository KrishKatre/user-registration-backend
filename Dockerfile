# Use Puppeteer's base image for compatibility
FROM ghcr.io/puppeteer/puppeteer:19.7.2

# Set environment variables for Puppeteer
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/google-chrome-stable

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Adjust ownership and permissions for the working directory
RUN chown -R pptruser:pptruser /usr/src/app

# Switch to the Puppeteer's default user
USER pptruser

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY --chown=pptruser:pptruser . .

# Expose the port your application listens on
EXPOSE 5000

# Run the application
CMD ["node", "index.js"]
