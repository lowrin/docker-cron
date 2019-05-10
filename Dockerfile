FROM python:3.6-slim-stretch

ENV HTTP_PROXY "http://10.101.92.205:3128"
ENV HTTPS_PROXY "http://10.101.92.205:3128"

ENV http_proxy "http://10.101.92.205:3128"
ENV https_proxy "http://10.101.92.205:3128"

#Install Cron
RUN apt-get update && apt-get -y upgrade && apt-get -y install cron

#Clean
RUN apt-get clean autoclean && apt-get autoremove --yes && rm -rf /var/lib/{apt,dpkg,cache,log}/

ADD crontab /etc/cron.d/hello-cron
ADD entry.sh /etc/cron.d/entry.sh

RUN chmod 0644 /etc/cron.d/hello-cron
RUN chmod 0644 /etc/cron.d/entry.sh

RUN chmod +x /etc/cron.d/entry.sh

CMD ["cron", "-f"]
