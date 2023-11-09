FROM alpine

VOLUME /mnt

COPY run.sh /root/run.sh
COPY start.sh /root/start.sh
COPY utils/ /root/utils/

RUN apk add --no-cache bash dialog && \
ln -s /root/utils /mnt/utils

ENTRYPOINT /root/start.sh