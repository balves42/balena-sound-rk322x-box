#!/bin/bash
set -e

SOUND_SUPERVISOR_PORT=${SOUND_SUPERVISOR_PORT:-80}
SOUND_SUPERVISOR="$(ip route | awk '/default / { print $3 }'):$SOUND_SUPERVISOR_PORT"
# Wait for sound supervisor to start
while ! curl --silent --output /dev/null "$SOUND_SUPERVISOR/ping"; do sleep 5; echo "Waiting for sound supervisor to start at $SOUND_SUPERVISOR"; done

# Get mode from sound supervisor.
# mode: default to MULTI_ROOM
MODE=$(curl --silent "$SOUND_SUPERVISOR/mode" || true)

if [[ "$MODE" == "MULTI_ROOM" ]]; then
  echo "Multi-room has been disabled on this device type due to performance constraints."
  echo "You should use this device in 'MULTI_ROOM_CLIENT' mode if you have other devices running balenaSound, or 'STANDALONE' mode if this is your only device."
fi

# Start snapserver
echo "Starting multi-room server..."
/usr/bin/snapserver
