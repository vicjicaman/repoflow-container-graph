FROM node:10.13.0-alpine

RUN set -xe \
    && apk add --no-cache bash git openssh

RUN apk update
RUN apk add --no-cache python py-pip

ENV PATH=/root/.local/bin:$PATH
RUN pip install awscli --upgrade

RUN aws --version

RUN mkdir -p /workspace/app
WORKDIR /workspace/app

RUN chown -R node /workspace

USER node
RUN whoami

COPY ./node_modules /workspace/app/node_modules
COPY ./node_modules/@nebulario/nodeflow-local-graph/dist/index.js /workspace/app/dist/index.js

ENTRYPOINT ["node"]
CMD ["dist/index.js"]
