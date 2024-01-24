# Use the official Node.js image
FROM node:latest

ARG BUILD_ENV=${BUILD_ENV}
# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .
RUN echo ${BUILD_ENV}
COPY .env.${BUILD_ENV:-dev} ./.env
# Expose the port that the app will run on
EXPOSE 80
