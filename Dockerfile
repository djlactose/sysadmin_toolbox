FROM alpine

EXPOSE 22

VOLUME /mnt
VOLUME /root/bak

COPY sudoers /etc/sudoers
COPY sshd_config /etc/ssh/
COPY run.sh /root/run.sh
COPY start.sh /opt/sysadmin_toolbox/start.sh
COPY utils/ /opt/sysadmin_toolbox/utils/
COPY skel/ /opt/sysadmin_toolbox/skel/
COPY templates/ /opt/sysadmin_toolbox/templates/

RUN apk add --no-cache openssh-server shadow sudo bash dialog && \
chmod +x /opt/sysadmin_toolbox -R && \
ln -s /opt/sysadmin_toolbox/utils /mnt/utils && \
ln -s /opt/sysadmin_toolbox/skel /mnt/skel && \
ln -s /opt/sysadmin_toolbox/templates /mnt/templates && \
ln -s /opt/sysadmin_toolbox/start.sh /mnt/start.sh && \
mkdir /root/bak/ && \
touch /root/bak/installed.txt && \
chmod 666 /root/bak/installed.txt && \
ln -s /root/bak/installed.txt /mnt/installed.txt

CMD /root/run.sh