+++
title = "video stabilization using ffmpeg"
draft = false
date = "2020-05-09T10:10:00Z"
+++

With the lockdown, I had some time available to finally take a small video of the squirrels roaming outside. I tried to take a video with my camera and a tripod but couldn't avoid some annoying shaking.

I usually use youtube to do the de-shaking, but for some reason, they removed the feature recently, so I had to see what other options were available. I was looking for a way to zoom in the video as well, and I already had used FFmpeg before for that kind of thing so that was my first option.

{{< figure src="/img/squirrels.png" title="De-shaked videos of squirrels">}}


I tried the `deshake` video plugin but wasn't particularly impressed by it, as the result was still pretty shaky, even when fiddling with the options.

Then I found that a more advanced plugin (based on [`vid.stab`](http://public.hronopik.de/vid.stab/) could be included in FFmpeg (if built with the option `--enable-libvidstab`). I was pleased to see that the version of FFmpeg bundled with arch Linux already had it.

To get the best results, the processing can be done in 2 pass:
- [vidstabdetect](https://ffmpeg.org/ffmpeg-filters.html#vidstabdetect)
- [vidstabtransform](https://ffmpeg.org/ffmpeg-filters.html#vidstabtransform)

For h264, the output quality is defined by the [`crf`](https://trac.ffmpeg.org/wiki/Encode/H.264#crf) options.

I made a simple bash script to convert the files. The `zoom=25` parameter will ensure that even with strong motions there will be no missing spots in the image.

```bash
#!/bin/bash

set -euo pipefail
set -x
input_file="${1?Input file required}"
output_file="${2?Output file required}"
transform_file="${output_file}.trf"
ffmpeg -i "$input_file" -vf "vidstabdetect=shakiness=10:accuracy=15:result=$transform_file" -f null -
ffmpeg -i "$input_file" -filter:v vidstabtransform=zoom=25:input="$transform_file":interpol=bicubic -crf 23 -preset slow "$output_file"
```
