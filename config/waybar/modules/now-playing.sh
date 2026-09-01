#!/usr/bin/env bash

# Get active player
player=$(playerctl -l 2>/dev/null | head -n 1)

# If no players running
if [ -z "$player" ]; then
  echo "Not Playing"
  exit 0
fi

# Get song metadata
song=$(playerctl --player="$player" metadata --format '{{artist}} - {{title}}' 2>/dev/null)

# If nothing is playing
if [ -z "$song" ]; then
  echo "Not Playing"
  exit 0
fi

# Fake visualizer
bars=(▁ ▂ ▃ ▄ ▅ ▆ ▇ █)
visualizer=""
for i in {1..10}; do
  visualizer+="${bars[$RANDOM % ${#bars[@]}]}"
done

echo "$song  $visualizer"
