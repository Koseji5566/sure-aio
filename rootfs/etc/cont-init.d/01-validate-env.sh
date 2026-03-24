#!/bin/bash
if [ -z "$SECRET_KEY_BASE" ]; then
  echo "ERROR: SECRET_KEY_BASE must be set."
  exit 1
fi
if [ -z "$APP_DOMAIN" ]; then
  echo "ERROR: APP_DOMAIN must be set."
  exit 1
fi
echo -e "\e[32mAll required environment variables are present.\e[0m"
