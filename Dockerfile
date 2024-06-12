# Use Node.js image as the base image
FROM node:16-alpine

# Expose port 5000
EXPOSE 5000

# Set working directory
WORKDIR /usr/src/app

# Copy folders
COPY package*.json ./
COPY src ./src
COPY public ./public

# Install project dependencies
RUN npm install

# Install serve globally
RUN npm install -g serve

# Build the application
ENV REACT_APP_BACKEND_URL=https://backend-new-fly.dev
RUN npm run build

# Serve the application
CMD ["serve", "-s", "-l", "5000", "build"]
