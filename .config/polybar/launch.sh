#!/usr/bin/env sh
# shellcheck disable=SC2059

# Start the primary bar on the main screen and the secondary on any others.
#
# Author: Benedikt Vollmerhaus <benedikt@vollmerhaus.org>
# License: MIT

set -eu

# Retrieve first interface names for network module
readonly ETH=$(ip link | grep -m 1 -E '\b(en)' \
  | awk '{print substr($2, 1, length($2)-1)}')
readonly WIFI=$(ip link | grep -m 1 -E '\b(wl)' \
  | awk '{print substr($2, 1, length($2)-1)}')
# awk: print second column ($2) without trailing ':'

readonly NC='\033[0m'
readonly IT='\033[3m'
readonly RED='\033[1;31m'
readonly BLUE='\033[1;34m'

kill_running_instances() {
  pkill polybar || true

  while pgrep -u "$(id -u)" -x polybar >/dev/null; do
    sleep 0.25
  done
}

launch_bar() {
  MONITOR=$(xrandr --listactivemonitors | rg -o eDP[0-9\-]+ | sed '1!d')
  MONITOR=${MONITOR} IF_ETH=${ETH} IF_WIFI=${WIFI} polybar "$1" &
}

launch_secondary_bars() {
  IFS=$(printf '\n')
  for line in $(xrandr --listactivemonitors | sed '1d' | grep -v '\*'); do
    output=${line##* } # Get output name from last column
    printf "${BLUE}::${NC} Launching secondary bar(s) on %s...\n" "${output}"
    launch_bar "${output}" top-secondary
  done
}

main() {
  if ! command -v xrandr >/dev/null 2>&1; then
    printf '%b' \
      "${RED}error:${NC} ${IT}xrandr${NC} is required " \
      "for monitor detection but not installed.\n" >&2
    exit 1
  fi

  printf "Network interfaces: ${IT}%s${NC}, ${IT}%s${NC}\n" "${ETH}" "${WIFI}"

  printf "${BLUE}::${NC} Terminating running bar instances...\n"
  kill_running_instances

  printf "${BLUE}::${NC} Launching bar(s) on primary monitor...\n"
  launch_bar top-main

  launch_secondary_bars
}

main
