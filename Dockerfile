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

# Installing node-gyp and sharp globally
RUN yarn global add node-gyp sharp

ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

WORKDIR /opt/
ENV PATH /opt/node_modules/.bin:$PATH

COPY ./package.json ./
RUN yarn config set network-timeout 600000 -g && yarn install

WORKDIR /opt/app
COPY ./ .

EXPOSE 1336
CMD ["/bin/sh","entrypoint.sh"]
