#!/bin/bash
# Takes four arguments:
# The artist name, the album name, the track name, and the youtube URL.
# It downloads the piece, moves it to $HOME/music/artist/album/track.mp3 and
# adds the correct tags.
artist="$1"
album="$2"
track="$3"
URL="$4"

if [ $# -ne 4 ]
then
    echo "Usage: youtube-dl.sh [Artist] [Album] [Track] [URL]"
    exit
else
    slugartist=$(slugify "$artist")
    echo $slugartist
    slugalbum=$(slugify "$album")
    echo $slugalbum
    slugtrack=$(slugify "$track")
    echo $slugtrack

    mkdir -p ~/music/$slugartist/$slugalbum/

    yt-dlp -x --no-playlist --audio-format "mp3" -o /tmp/tmp.mp3 "$URL" && \
    ffmpeg -i /tmp/tmp.mp3 -metadata artist="$artist" -metadata album="$album" -metadata title="$track" ~/music/$slugartist/$slugalbum/"$slugtrack".mp3 
    rm /tmp/tmp.mp3
fi

