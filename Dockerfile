FROM postgres:11.7-alpine
EXPOSE 5432

COPY ./maintenance /usr/local/bin/maintenance
RUN chmod +x /usr/local/bin/maintenance/*
RUN mv /usr/local/bin/maintenance/* /usr/local/bin \
  && rmdir /usr/local/bin/maintenance \
  && mkdir /backups

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["postgres"]
