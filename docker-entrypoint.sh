#!/bin/sh
set -e
if [ "${1#-}" != "$1" ]; then
    set -- tor "$@"
fi
if [ "$1" = "tor" ]; then
    shift
    exec tor "$@"
fi
exec "$@"
