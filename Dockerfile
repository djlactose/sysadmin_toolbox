FROM alpine

EXPOSE 22

VOLUME /mnt
VOLUME /root/bak

COPY sudoers /etc/sudoers
COPY sshd_config /etc/ssh/
COPY run.sh /root/run.sh
COPY start.sh /opt/sysadmin_toolbox/start.sh
COPY utils/ /opt/sysadmin_toolbox/utils/

RUN apk add --no-cache openssh-server sudo bash dialog && \
chmod +x /opt/sysadmin_toolbox -R && \
ln -s /opt/sysadmin_toolbox/utils /mnt/utils && \
ln -s /opt/sysadmin_toolbox/start.sh /mnt/start.sh

CMD /root/run.sh