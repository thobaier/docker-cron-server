FROM alpine

# mysql client
RUN apk update && apk add mysql-client bash && rm -f /var/cache/apk/*

# crontab
COPY cron/jobs /cron/jobs
COPY crontab /cron/crontab
RUN /usr/bin/crontab /cron/crontab

WORKDIR /cron

CMD ["/usr/sbin/crond", "-f", "-l", "8"]
