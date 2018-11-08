FROM node:10.13.0-alpine

RUN set -xe \
    && apk add --no-cache bash git openssh



RUN mkdir /app
WORKDIR /app

RUN chown node /app

USER node
RUN whoami

COPY ./node_modules /app/node_modules
COPY ./node_modules/@nebulario/nodeflow-local-graph/dist/index.js /app/dist/index.js

EXPOSE 3000

ENTRYPOINT ["node"]
CMD ["dist/index.js"]
