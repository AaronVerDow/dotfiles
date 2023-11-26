#!/usr/bin/env bash
set -euo pipefail


killall firefox

firefox --new-window $1 --kiosk

kiosk_rofi.sh
