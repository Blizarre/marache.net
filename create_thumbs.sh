#!/bin/bash

set -eu
set -o pipefail

cd "$(dirname "$0")"

find -path "./static/img/*" -type f -not -name "thumb_*" | while read IMG_PATH; do
    IMG_DIR="$(dirname "$IMG_PATH")"
    IMG_NAME="$(basename "$IMG_PATH")"
    # http://www.imagemagick.org/Usage/resize/#techniques
    echo "$IMG_DIR : $IMG_NAME -> thumb_$IMG_NAME"
    convert "$IMG_DIR/$IMG_NAME" -colorspace RGB -resize '40000@' -colorspace sRGB  -quality '80%' "$IMG_DIR/thumb_$IMG_NAME"
done

echo ""

echo "Generation done"
echo "Upload the thumbnails by running this from the root of the repo:"
echo 's3cmd -v sync -M -r static/ s3://marache.net-static'
