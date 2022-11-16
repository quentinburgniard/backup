FROM ubuntu
RUN apt-get update && apt-get install -y cron curl mariadb-client && rm -rf /var/lib/apt/lists/* && echo "0 3 * * * BASH_ENV=/etc/environment /usr/local/bin/backup.sh" | crontab -
COPY . /usr/local/bin/
RUN chmod 744 /usr/local/bin/backup.sh /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT docker-entrypoint.sh