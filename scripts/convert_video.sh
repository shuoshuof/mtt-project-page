#!/usr/bin/env bash

set -eu

input_video=$1
output_video=$2

ffmpeg -y -i "$input_video" \
  -map 0:v:0 \
  -c:v libx264 \
  -pix_fmt yuv420p \
  -movflags +faststart \
  -an \
  "$output_video"
