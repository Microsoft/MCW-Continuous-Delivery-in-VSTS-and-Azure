# Dockerfile for content-web
# This is the base image that can be used
FROM node:dubnium AS build
#This is the environment variable with connection to the API. Can be overriden in the docker run command with the -e switch
ENV CONTENT_API_URL=http://api:3001
# This is the port that the container exposes
EXPOSE 80
ENV PORT=80
# Run the NPM install command to install Angular
RUN npm install -g @angular/cli@~8.3.4
# This is the directory within the container where commands will be executed
WORKDIR /usr/src/app
# Copy the package json file to the workdir
COPY package.json /usr/src/app/
# Run the NPM install command to build the application
RUN npm install
# Copy the rest of the sources
COPY . /usr/src/app
# Build the Angular Application
RUN ng build 
# Start the application
CMD [ "node", "app.js" ]