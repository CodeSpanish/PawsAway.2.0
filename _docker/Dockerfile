# Use the latest Ubuntu as a base image
FROM ubuntu:latest

# Update and install necessary packages
RUN apt-get update && apt-get install -y \
    curl \
    npm \
    ruby-full \
    build-essential \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install Jekyll and Bundler
RUN gem install jekyll bundler

# Install the Sass package globally
RUN npm install -g --force sass

# Set working directory
WORKDIR /srv/jekyll

# Run Jekyll and Dart-Sass as needed
# Add any custom scripts here to start both services