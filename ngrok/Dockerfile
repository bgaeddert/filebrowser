FROM alpine:latest

ENV NGROK_AUTH_TOKEN="${NGROK_AUTH_TOKEN}"
#ENV NGROK_PORT="${NGROK_PORT}"

RUN apk --update add bash curl sudo jq

RUN wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz && \
    tar -xvf ngrok-v3-stable-linux-amd64.tgz && \
    mv ngrok /usr/local/bin && \
    rm ngrok-v3-stable-linux-amd64.tgz


RUN             mkdir -p /root/.config/ngrok

COPY           ngrok.yml /root/.config/ngrok/ngrok.yml
COPY           docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE          4040

CMD /docker-entrypoint.sh