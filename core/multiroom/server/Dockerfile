# hadolint ignore=DL3006
FROM bh.cr/g_tomas_migone1/multiroom-armv7hf:latest
WORKDIR /usr/src

ENV PULSE_SERVER=tcp:audio:4317
ENV PULSE_SOURCE=snapcast.monitor
COPY snapserver.conf /etc/snapserver.conf
COPY start.sh .

CMD [ "/bin/bash", "/usr/src/start.sh" ]
