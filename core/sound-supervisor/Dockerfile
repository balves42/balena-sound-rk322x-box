FROM balenalib/armv7hf-node:14 as build

WORKDIR /usr/src
COPY ./package*.json ./
RUN npm install

#dev-cmd-live=npm run livepush

COPY ./src ./src
COPY ./tsconfig.json .
RUN npm run build
COPY VERSION .

FROM balenalib/armv7hf-alpine-node:14

WORKDIR /usr/src

COPY ./package*.json ./
COPY --from=build /usr/src/build ./build
COPY VERSION .

RUN npm install --production

CMD [ "npm", "start" ]
