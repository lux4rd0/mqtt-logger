FROM grafana/promtail:2.5.0

RUN apt-get update && apt-get install -y dumb-init mosquitto-clients vim

RUN mkdir /mqtt-logger

COPY config.yaml /mqtt-logger
COPY start.sh /mqtt-logger

WORKDIR /mqtt-logger

RUN chmod a+x *.sh

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["/mqtt-logger/start.sh"]
