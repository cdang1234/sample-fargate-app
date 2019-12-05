FROM node:13.1.0-alpine
  WORKDIR /usr/app
  COPY package-lock.json .
  RUN npm i --quiet
  COPY . .
  RUN npm install pm2 -g
  CMD ["pm2-runtime", "server.js"]