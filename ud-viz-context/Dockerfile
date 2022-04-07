# This is a modified copy of 
#    https://github.com/VCityTeam/UD-Viz-Template-docker/blob/60e4a9635dc1a9ef81e2a6e22e2880fe559ff0dc/DemoFull-SimpleServer/Dockerfile
FROM ubuntu:focal

LABEL maintainer "VCityTeam"
LABEL source.repo "https://github.com/VCityTeam/UD-Demo-VCity-Spatial-multimedia-db-Lyon"

RUN apt-get update

# Note: this container will only serve (through http) the client code (as 
# opposed to client code AND data required by the demo): refer to the 
# config.json file for the data server dependencies. 

######### Install the UD-Viz-template application per se (client code)

# Node version 14 is required. For this installation (on focal) refer to e.g.
#  https://computingforgeeks.com/install-node-js-14-on-ubuntu-debian-linux/
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs
RUN node --version
RUN npm --version
RUN apt-get install -y git
RUN git --version

ARG DOCUMENT_ROOT=/UD-Viz-Template
RUN git clone --branch v2.35.0 https://github.com/VCityTeam/UD-Viz-Template.git
WORKDIR $DOCUMENT_ROOT
# Customization (for hooking other services on which this container depends)
COPY config.json $DOCUMENT_ROOT/assets/config/config.json
# Eventually build the package for SimpleServer (refer below) to serve it.
RUN npm install
RUN npm run build

######### Install the ExpressJS server
WORKDIR /
RUN git clone https://github.com/VCityTeam/UD-SimpleServer.git
WORKDIR UD-SimpleServer
RUN npm install

EXPOSE 80
CMD [ "node", "./index.js", "../UD-Viz-Template", "80" ]
