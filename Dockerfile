FROM node:8.13.0-alpine

RUN set -xe \
    && apk add --no-cache bash git openssh

RUN mkdir -p /workspace/app
RUN chown -R node /workspace

WORKDIR /workspace/app

USER node
RUN whoami

COPY ./node_modules /workspace/app/node_modules
COPY ./node_modules/@nebulario/nodeflow-local-graph/dist/index.js /workspace/app/dist/index.js

ENTRYPOINT ["node"]
CMD ["dist/index.js"]
















# Move to build server, only dependency is git
#RUN apk update
#RUN apk add --no-cache python py-pip
#ENV PATH=/root/.local/bin:$PATH
#RUN pip install awscli --upgrade
#RUN aws --version
#RUN apk add docker
#RUN apk --no-cache add shadow
#RUN usermod -aG docker node
