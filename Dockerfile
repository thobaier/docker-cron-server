FROM alpine

# crontab
COPY cron/jobs /cron/jobs
COPY crontab /cron/crontab
RUN /usr/bin/crontab /cron/crontab

WORKDIR /cron

CMD ["/usr/sbin/crond", "-f", "-l", "8"]
