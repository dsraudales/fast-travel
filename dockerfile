## Creación de imagen en Docker

FROM node:8.10 AS build
WORKDIR /usr/src/app
COPY **/package.json **/package-lock.json ./
RUN npm install
COPY . /usr/src/app/
EXPOSE 5000
