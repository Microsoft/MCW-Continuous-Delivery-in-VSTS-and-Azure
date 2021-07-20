# This is the base image that can be used
FROM node:argon AS build
#This is the environment variable with connection to the MongoDB. Can be overriden in the docker run command with the -e switch
ENV MONGODB_CONNECTION=mongodb://mongo:27017/contentdb
# This is the directory within the container where commands will be executed
WORKDIR /usr/src/app
# Copy the package json file to the workdir
COPY package.json /usr/src/app/
# Run the NPM install command to build the application
RUN npm install
# Copy the rest of the sources
COPY . /usr/src/app
# Start the application
CMD [ "npm", "start" ]