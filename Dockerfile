FROM node:latest

MAINTAINER kuperiu@docker.com

# set default workdir

WORKDIR /usr/src

# Add package.json to allow for caching

COPY package.json /usr/src/package.json

# Install app dependencies

RUN npm install

# Bundle app source and tests

COPY . /usr/src/

# user to non-privileged user

USER nobody

# Expose the application port and run application

EXPOSE 5000

CMD [“node_modules/mocha/bin/mocha test/test.js”,”test/test.js”]
