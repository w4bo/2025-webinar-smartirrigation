#!/bin/bash
set -e
cd _site
sudo chmod -R 777 .
date=$(date '+%Y-%m-%dT%H:%M:%S')
for FILE in *.html; do 
    echo "Processing $PWD/$FILE file...";
    filename=$(basename -- "$FILE")
    extension="${filename##*.}"
    filename="${filename%.*}"
    docker run -v $(pwd):/home/user astefanutti/decktape /home/user/$FILE $filename-$date.pdf
    docker cp `docker ps -lq`:slides/$filename-$date.pdf .
done
