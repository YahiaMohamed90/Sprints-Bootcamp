FROM node:10-alpine

WORKDIR usr/src/node/weather-app

ADD . usr/src/node/weather-app

COPY package*.json ./

RUN npm install

RUN npm install bcrypt --save

ARG APP_VERSION=1.0

ENV NODE_ENV production

RUN cd /

WORKDIR /var/weather-app

COPY . /var/weather-app

EXPOSE 3000

ENTRYPOINT [".bin/www"]

CMD [ "npm", "start" ]
