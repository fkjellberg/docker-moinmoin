#!/bin/sh

MOIN_BASE_PATH=/opt/moin
WIKI_BASE_PATH=/opt/wiki

chown -R ${MOIN_UID}:${MOIN_GID} "${WIKI_BASE_PATH}"

echo Starting MoinMoin Wiki
exec /opt/uwsgi/bin/uwsgi --uid ${MOIN_UID} --gid ${MOIN_GID} "${WIKI_BASE_PATH}/uwsgi.ini"
