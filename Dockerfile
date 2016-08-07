FROM ruby:2.3.1

RUN apt-get update
RUN apt-get -y install rsyslog cron

RUN mkdir /app
WORKDIR /app

ADD app /app

RUN crontab /app/crontabfile

RUN cp /app/crontabfile /etc/crontab
RUN touch /var/log/cron.log

RUN chmod +x /app/run.sh

#WORKDIR /app

CMD ["bash","/app/run.sh"]
