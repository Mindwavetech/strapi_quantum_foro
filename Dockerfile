FROM node:18.19-bullseye-slim

# Installing dependencies for sharp and node-gyp
RUN apt-get update && apt-get install -y \
    build-essential \
    libcairo2-dev \
    libjpeg-dev \
    libpango1.0-dev \
    libgif-dev \
    librsvg2-dev

# Setting up the working directory
WORKDIR /opt/
ENV PATH /opt/node_modules/.bin:$PATH

# Copying dependency definitions and installing dependencies
COPY ./package.json ./yarn.lock ./
RUN yarn config set network-timeout 600000 -g && yarn install

# Copy the rest of the application files
WORKDIR /opt/app
COPY ./ .

# Exposing the application port
EXPOSE 1336

# Setting the command to start the application
CMD ["/bin/sh","/opt/app/entrypoint.sh"]
