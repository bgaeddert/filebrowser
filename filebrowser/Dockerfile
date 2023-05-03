FROM alpine:latest

RUN apk --update add ca-certificates \
             mailcap \
             curl \
             bash

RUN curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh | bash

COPY docker_config.json /.filebrowser.json

EXPOSE 80

CMD filebrowser