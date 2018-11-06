FROM node:10.13.0-alpine

WORKDIR /app
COPY . /app

EXPOSE 3000

ENTRYPOINT ["node"]
CMD ["node_modules/@nebulario/nodeflow-local-graph/dist/index.js"]
