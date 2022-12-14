## Creación de imagen en Docker

FROM node:18.12.1-alpine3.16 AS build
WORKDIR /app
COPY **/package.json **/package-lock.json ./
RUN npm install
COPY . .
RUN npm run build --prod

FROM nginx:1.17.1-alpine
COPY --from=build /app/dist/angular-docker /usr/share/nginx/html