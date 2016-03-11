#!/bin/bash

THIS_DIR=`dirname $0`

# ==============================================================================
# watch client file changes
# ==============================================================================

PID_FILE=.flow-pack
INITIAL_TIMEOUT=2

if [ "$NODE_ENV" != "production" ]
then
    flow-pack -d -w . &
    echo $! > .flow-pack
    "$THIS_DIR/stop_watchify.sh" "$PID_FILE" "$INITIAL_TIMEOUT" &
fi
