#!/bin/sh -xu

# Input Parameters
ARG_PATH="$1"
ARG_NAME="$2"
ARG_LABEL="$3"

# Configuration
CONFIG_OUTPUT="/media"
FILEBOT_PORT=${FILEBOT_PORT:-7676}

FILEBOT_CMD=$(\
echo curl \
    --data-urlencode name=\"${ARG_NAME}\" \
    --data-urlencode path=\"${ARG_PATH}\" \
    --data-urlencode label=\"${ARG_LABEL}\" \
    http://filebot:${FILEBOT_PORT}/amc)

echo $FILEBOT_CMD >> /config/filebot.log
eval $FILEBOT_CMD
