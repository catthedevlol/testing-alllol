#!/bin/bash

# Attempt to start systemd
echo "Starting systemd..."
/sbin/init || echo "systemd failed (expected on Railway)"

# Attempt to start Docker daemon
echo "Starting Docker daemon..."
dockerd & || echo "dockerd failed (expected on Railway)"

# Start tmate session for pseudo VPS access
echo "Starting tmate session..."
tmate -F -n railway_session &

# Show tmate URLs
sleep 3
tmate show-messages

# Keep container alive
tail -f /dev/null
