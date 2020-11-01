FROM node:alpine

LABEL maintainer="elitonluiz1989@gmail.com"
LABEL version="1.0.0"

RUN apk update; \
    apk upgrade;

RUN apk add --update --no-cache \
    curl \
    wget;

RUN apk add --no-cache --virtual .yarn-deps curl gnupg && \
    curl -o- -L https://yarnpkg.com/install.sh | sh && \
    apk del .yarn-deps

# Adding option of wait other container
ADD https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh /usr/bin/wait-for-it
RUN chmod +x /usr/bin/wait-for-it

RUN  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 8080

CMD [ "tail", "-f", "/dev/null" ]