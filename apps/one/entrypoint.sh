#!/bin/sh

if [ "$CONSUL_SERVER" != "" ]; then
    consul agent -retry-join "$CONSUL_SERVER" -bind 0.0.0.0 -data-dir=/tmp/consul &
fi

"/opt/app/bin/${APP_NAME}" start
