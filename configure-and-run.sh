#!/usr/bin/env bash

set -e

if [ "$#" -ne 1 ]
then
    echo "usage: $0 ENVOY_CONFIG_FILE"
    exit 1
fi

FILE="$1"

declare -A VARS
VARS=(
    ["ENVOY_ADMIN_PORT"]="9901"
    ["ENVOY_ADMIN_ADDRESS"]="127.0.0.1"
    ["GRPC_SERVICE_PORT"]="8080"
    ["GRPC_SERVICE_ADDRESS"]="127.0.0.1"
    ["GRPC_WEB_PORT"]="8080"
    ["GRPC_WEB_ADDRESS"]="0.0.0.0"
)

for VAR in "${!VARS[@]}"
do
    VALUE="${!VAR}"
    if [ "$VALUE" = "" ]
    then
        VALUE="${VARS[$VAR]}"
    fi
    sed -i 's/'"$VAR"'/'"$VALUE"'/g' "$FILE"
done

exec envoy -c "$FILE"