FROM python:2.7.18-alpine3.11 AS builder

ARG UWSGI_VERSION=2.0.20
ARG MOIN_VERSION=1.9.11

RUN apk -U add --no-cache alpine-sdk linux-headers

RUN set -ex && pip install --prefix=/opt/uwsgi --no-cache-dir "uwsgi==${UWSGI_VERSION}"

RUN set -ex && pip install --prefix /opt/moin --no-cache-dir "moin==${MOIN_VERSION}"

FROM python:2.7.18-alpine3.11

ENV MOIN_UID=220
ENV MOIN_GID=220

COPY --from=builder /opt/uwsgi /opt/uwsgi/
COPY --from=builder /opt/moin /opt/moin/

COPY uwsgi.ini /opt/moin/share/moin/

RUN mkdir /opt/wiki \
    && chown -R ${MOIN_UID}:${MOIN_GID} /opt/moin /opt/wiki

EXPOSE 1717
EXPOSE 3031
EXPOSE 9090

VOLUME /opt/wiki

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
