FROM redis

COPY redis.conf /usr/local/etc/redis/redis.conf

RUN apt-get update && \
    apt-get install dnsutils -y

CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]