FROM alpine:latest

RUN apk --update add bash curl sudo jq

COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY slack_notify.sh /slack_notify.sh

CMD /docker-entrypoint.sh