#!/bin/bash
set -e

echo "Running model copy..."
/bin/bash /copy_models.sh

echo "Starting original start.sh..."
exec /start.sh
