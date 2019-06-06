#!/bin/bash -e

FIRST_START_DONE="${CONTAINER_STATE_DIR}/nginx-first-start-done"

# container first start
if [ ! -e "$FIRST_START_DONE" ]; then
  cp -nr /usr/share/ldap-account-manager/config.example/* /usr/share/ldap-account-manager/config/
  chown www-data /usr/share/ldap-account-manager/config/
  touch $FIRST_START_DONE
fi

exit 0
