#!/bin/bash

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Set path to xmrig in same directory
XMRIG_PATH="$SCRIPT_DIR/xmrig"

# Duration (in seconds)
RUN_DURATION=$((7200))   # 2 hours
SLEEP_DURATION=$((1800)) # 1 hour

echo "Starting xmrig run/pause cycle..."

while true; do
  echo "$(date): Starting xmrig..."
  "$XMRIG_PATH" &
  XMRIG_PID=$!

  sleep "$RUN_DURATION"

  echo "$(date): Stopping xmrig (PID: $XMRIG_PID)..."
  kill "$XMRIG_PID"

  echo "$(date): Sleeping for 1 hour..."
  sleep "$SLEEP_DURATION"
done