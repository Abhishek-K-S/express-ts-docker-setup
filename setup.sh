#!/bin/bash

# create a custom package.json file
echo "{
  \"name\": \"express-ts-docker\",
  \"version\": \"1.0.0\",
  \"description\": \"Created using BashScript (https://github.com/Abhishek-K-S/express-ts-docker-setup)\",
  \"main\": \"dist/index.js\",
  \"scripts\": {
    \"build\": \"npx tsc\",
    \"start\": \"node dist/index.js\",
    \"dev\": \"npx concurrently \\\"npx tsc --watch\\\" \\\"npx nodemon -q dist/index.js\\\"\"
  },
  \"keywords\": [],
  \"author\": \"\",
  \"license\": \"MIT\"
}
" > package.json

#create a default ts file
echo "import express, { Express, Request, Response } from 'express';
import dotenv from 'dotenv';

dotenv.config();

const app: Express = express();
const port = process.env.PORT;

app.get('/', (req: Request, res: Response) => {
  res.send('Express + TypeScript Server');
});

app.listen(port, () => {
  console.log(\`⚡️[server]: Server is running at http://localhost:\${port}\`);
});" > index.ts

#create a environment file
echo "PORT=9999" >.env

#create the dockerfile
echo "FROM node:lts-alpine

WORKDIR /server
COPY ./package.json .
RUN npm install express dotenv
RUN npm install --save-dev typescript @types/express @types/node concurrently nodemon
RUN npx tsc --init --outDir ./dist
COPY . .
CMD [ \"npm\",\"run\",\"dev\" ]
EXPOSE 9999" > Dockerfile


#create the dockerignore
echo ".env">.dockerignore

#create a compose file
echo "version: '3.9'

services:
    express_docker_server:
        container_name: express_ts_docker
        build:
            dockerfile: Dockerfile
        labels:
            - com.docker.compose.container-number=8
        restart: unless-stopped
        volumes:
            - ./:/server
        ports:
            - 9999:9999
        env_file:
            - ./.env" > docker-compose.yaml

# remove tsconfig file if exists
if [ -e "tsconfig.json" ]; then
  rm tsconfig.json
fi

docker compose up