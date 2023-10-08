# Use the official Node.js image as a base image
FROM node:14-alpine

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json files to the container
COPY package*.json ./

# Install required packages
RUN npm install

# Copy the source code to the container
COPY ./src/dist /usr/src/app/

# Build the Astro project
RUN npm run build

# Expose the application on port 3000
EXPOSE 3000

# Run the application
CMD ["npm", "start"]
