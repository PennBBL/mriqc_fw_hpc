#!/usr/bin/env bash
set -euo pipefail

echo "This is an example run script."
echo "Modify as desired, or set the manifest 'command' key to something else entirely."
echo

echo "This command was called with arguments:"
echo "$0" "$@"
echo

# Some simple diagnostics
set -x
env
cat /flywheel/v0/config.json
find /flywheel/v0/input -type f | xargs -r file || true
