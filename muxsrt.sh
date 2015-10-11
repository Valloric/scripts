#!/bin/sh
#
# Muxes SRT subtitles into MKV files using mkvmerge.
# Install mkvmerge with:
#   sudo apt-get install mkvtoolnix

set -e

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 foo.srt foo.mkv" >&2
  exit 1
fi

if [ "$2" != *.mkv ]; then
  echo "Usage: $0 foo.srt foo.mkv" >&2
  exit 1
fi

mkvmerge -o "$2-TEMP.mkv" "$1" "$2"
rm "$2"
mv "$2-TEMP.mkv" "$2"

