#!/bin/bash

ADDITIONAL_URL=$1
CONFIG_FILE=$2

# for example
# ADDITIONAL_URL=https://dl.espressif.com/dl/package_esp32_index.json
# CONFIG_FILE=arduino-cli-test.yaml

if grep -q "additional_urls: \[\]" "${CONFIG_FILE}"; then
  sed -i -e 's|additional_urls: \[\]|additional_urls:\r\n    - '"${ADDITIONAL_URL}"'|g' ${CONFIG_FILE}
else
  sed -i -e 's|additional_urls:|additional_urls:\r\n    - '"${ADDITIONAL_URL}"'|g' ${CONFIG_FILE}
fi

