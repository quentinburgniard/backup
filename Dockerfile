FROM ubuntu
RUN apt-get update && apt-get install -y cron curl mariadb-client && rm -rf /var/lib/apt/lists/*
COPY . /usr/local/bin/
RUN chmod 744 /usr/local/bin/backup.sh /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT docker-entrypoint.sh