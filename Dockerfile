# Use an official Node.js runtime as a base image
FROM node:14-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install Node.js dependencies
RUN npm install

# Copy the local files to the container
COPY . .

# Build the React app
RUN npm run build

# Expose port 80 (default for HTTP)
EXPOSE 80

# Command to run the application
CMD ["npm", "start"]
