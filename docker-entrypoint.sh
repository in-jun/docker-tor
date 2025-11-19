#!/bin/sh
set -e
if [ "${1#-}" != "$1" ]; then
    set -- tor "$@"
fi
if [ "$1" = "tor" ]; then
    exec tor "$@"
fi
exec "$@"
