FROM node:18.19-alpine

# Installing dependencies for sharp and node-gyp
RUN apk update && apk add --no-cache \
    build-base \
    gcc \
    g++ \
    autoconf \
    automake \
    zlib-dev \
    libpng-dev \
    nasm \
    bash \
    vips \
    python3 \
    py3-pip \
    make

# Instalar sharp manualmente para el entorno musl
RUN npm install --platform=linuxmusl --arch=x64 sharp

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
