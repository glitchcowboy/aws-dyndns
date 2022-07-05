FROM alpine:latest

COPY ./docker_dyndns_watcher.sh .
COPY ./dns_update.py .
COPY ./requirements.txt .

RUN apk add --no-cache aws-cli py3-pip
RUN pip3 install -r requirements.txt
RUN chmod 755 docker_dyndns_watcher.sh

ENTRYPOINT [ "/docker_dyndns_watcher.sh"]
