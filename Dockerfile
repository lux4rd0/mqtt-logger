FROM grafana/promtail:2.5.0

RUN echo "deb [allow-insecure=yes] http://ppa.launchpad.net/mosquitto-dev/mosquitto-ppa/ubuntu focal main" > /etc/apt/sources.list.d/mosquitto-dev-ubuntu-mosquitto-ppa-focal.list
RUN apt-get update && apt-get install --allow-unauthenticated --no-install-recommends -y dumb-init mosquitto-clients vim

RUN mkdir /mqtt-logger

COPY config.yaml /mqtt-logger
COPY start.sh /mqtt-logger

WORKDIR /mqtt-logger

RUN chmod a+x *.sh

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["/mqtt-logger/start.sh"]
