FROM node:lts-alpine

WORKDIR /server
COPY ./package.json .
RUN npm install express dotenv
RUN npm install --save-dev typescript @types/express @types/node concurrently nodemon
RUN npx tsc --init --outDir ./dist
COPY . .
CMD [ "npm","run","dev" ]
EXPOSE 9999
