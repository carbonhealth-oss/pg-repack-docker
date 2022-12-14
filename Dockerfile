ARG PG_MAJOR=13

FROM postgres:$PG_MAJOR
ARG PG_REPACK_VERSION=1.4.7

RUN apt-get update --fix-missing && \
    apt-get install -y postgresql-server-dev-$PG_MAJOR wget openssh-server

COPY scripts .
RUN chmod +x ./*.sh && bash ./install_pg_repack.sh $PG_REPACK_VERSION
