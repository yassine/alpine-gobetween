#!/bin/sh

USER_CONFIG_FILE=$1
GOBETWEEN_CONFIG_FILE=${USER_CONFIG_FILE:='/etc/gobetween-config.toml'}
API_ENABLE=${GOBETWEEN_API_ENABLE:="true"}
API_BIND_ADDRESS=${GOBETWEEN_API_BIND_ADDRESS}
API_BIND_PORT=${GOBETWEEN_API_BIND_PORT:="9000"}
API_LOGIN=${GOBETWEEN_API_LOGIN}
API_PASSWORD=${GOBETWEEN_API_PASSWORD}
CERT_PATH=${GOBETWEEN_API_CERT_PATH}
KEY_PATH=${GOBETWEEN_API_KEY_PATH}

echo "[api]" > ${GOBETWEEN_CONFIG_FILE}
echo "enabled = ${API_ENABLE}" >> ${GOBETWEEN_CONFIG_FILE}
if [ "$API_ENABLE" = "true" ]
then
    echo "bind = \"$API_BIND_ADDRESS:$API_BIND_PORT\"" >> ${GOBETWEEN_CONFIG_FILE}
    if [ ! -z "$API_LOGIN" ]
    then
      echo "[api.basic_auth]" >> ${GOBETWEEN_CONFIG_FILE}
      echo "login = \"$API_LOGIN\"" >> ${GOBETWEEN_CONFIG_FILE}
      echo "password = \"$API_PASSWORD\"" >> ${GOBETWEEN_CONFIG_FILE}
    fi
    if [ ! -z "$CERT_PATH" ]
    then
      echo "[api.tls]" >> ${GOBETWEEN_CONFIG_FILE}
      echo "cert_path = \"$CERT_PATH\"" >> ${GOBETWEEN_CONFIG_FILE}
      echo "key_path = \"$KEY_PATH\"" >> ${GOBETWEEN_CONFIG_FILE}
    fi
fi
gobetween -c $GOBETWEEN_CONFIG_FILE
