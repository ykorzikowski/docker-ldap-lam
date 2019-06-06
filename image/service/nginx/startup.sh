#!/bin/bash -e

FIRST_START_DONE="${CONTAINER_STATE_DIR}/nginx-first-start-done"

# container first start
if [ ! -e "$FIRST_START_DONE" ]; then
  touch $FIRST_START_DONE
fi

exit 0
