FROM node:10.13.0-alpine

WORKDIR /app
COPY ./node_modules /app/node_modules
COPY ./node_modules/@nebulario/nodeflow-local-graph/dist/index.js /app/dist/index.js

EXPOSE 3000

ENTRYPOINT ["node"]
CMD ["dist/index.js"]
