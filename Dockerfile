FROM python:3.6-slim-stretch

#Install Cron
RUN apt-get update && apt-get -y upgrade && apt-get -y install cron

#Clean
RUN apt-get clean autoclean && apt-get autoremove --yes && rm -rf /var/lib/{apt,dpkg,cache,log}/

ADD crontab /etc/cron.d/hello-cron
ADD entry.sh /etc/cron.d/entry.sh

RUN chmod 0644 /etc/cron.d/hello-cron
RUN chmod 0644 /etc/cron.d/entry.sh

#CMD ["cron", "-f"]
