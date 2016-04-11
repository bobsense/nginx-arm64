FROM jefby/centos-arm64
ADD nginx /usr/local/nginx
ADD run.sh /root
EXPOSE 80
CMD sh /root/run.sh
