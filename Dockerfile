FROM node:alpine3.10

EXPOSE 8080

RUN apk add dumb-init && \
    npm install @redocly/openapi-cli -g

ADD weather-api.yml /

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD [ "openapi", "preview-docs", "/weather-api.yml" ]
