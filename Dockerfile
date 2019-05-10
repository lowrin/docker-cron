FROM debian:stretch-slim

#Install Cron
RUN apt-get update && apt-get -y upgrade && apt-get -y install cron dos2unix

#Clean
RUN apt-get clean autoclean && apt-get autoremove --yes && rm -rf /var/lib/{apt,dpkg,cache,log}/

ADD crontab /etc/cron.d/hello-cron
ADD entry.sh /etc/cron.d/entry.sh

RUN chmod 0644 /etc/cron.d/hello-cron
RUN chmod 0644 /etc/cron.d/entry.sh

RUN chmod +x /etc/cron.d/entry.sh

RUN dos2unix /etc/cron.d/hello-cron && dos2unix /etc/cron.d/entry.sh

CMD ["cron", "-f"]
