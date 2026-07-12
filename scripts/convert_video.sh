#!/usr/bin/env bash

set -eu

input_video=$1
output_video=$2
crf=${3:-23}          # CRF: 23=visually lossless, 28=web, 32=tiny
max_width=${4:-1920}  # Cap horizontal resolution (1080p)

ffmpeg -y -i "$input_video" \
  -map 0:v:0 \
  -c:v libx264 \
  -crf "$crf" \
  -vf "scale='min($max_width,iw)':-2" \
  -pix_fmt yuv420p \
  -movflags +faststart \
  -an \
  "$output_video"
