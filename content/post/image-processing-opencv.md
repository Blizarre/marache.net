+++
title = "Image processing using OpenCV"
draft = true
date = "2015-05-27T08:22:50Z"
thumbnail = "img/head_code.jpg"

+++

A few days ago I took a picture of the night sky using my camera, right in the middle of nowhere. I expected a nice clear picture but no matter where I looked, there was always some background light, and the sensor noise was quite strong:

{{<figure src="/img/opencv-raw.jpg" title="Thumbnail of the original image: notice the haze" >}}

I wanted to play with the python version of OpenCV for a long time, so this was a great opportunity to try to improve the result! And I'm in love with the python bindings: making Numpy, OpenCV and Scipy working together is really easy !

## Image improvement

1. Estimate the background light on blocks of 256x256 pixels using the maximum of the histogram on the block, for each color channel.
2. Create a map of the background light by upscaling the estimation to the size of the image.
3. Remove the background map from the image.
4. Apply a threshold to the image in order to remove the sensor noise.
5. Apply a small gaussian filter to smoothen the edges left by the thresholding.
6. Adjust the gamma correction to brighten the image

### Result:

{{<figure src="/img/opencv-cleaned.jpg" title="Thumbnail of the cleaned image" >}}

Depending on the calibration on your screen and your environment, the effect may not be very noticeable. You can switch between the full size images to get a better view, see the gallery at the end of the post.

### Possible improvements

The subtracting step in this script is not really correct. We are subtracting the pixels value of the background from the image, but the pixel value in RGB space is not a linear function of the amount of light. It works well here because the background map does not change much, so that each star is dimmed approximately by the same value.  I should work on the [raw image](http://en.wikipedia.org/wiki/Raw_image_format), straight out of the sensor, where the value of pixels is proportional to the number of photons received.

## Local orientation estimation

As a bonus, I wanted to estimate the orientation of the star trails in the images. I designed a simple estimator using the gradient. For each block in the image, the computation of the angle is done as follow:

1. Estimate the gradient image with a Sobel filter on X and Y.
2. Select the points corresponding to the star trails with a simple adaptative threshold on the gradient value (low value = background noise).
3. Compute the angle for each selected pixel with the atan function. The norm of the gradient is also generated, and will be used as weight for the histogram generation.
4. Generate the histogram of the angles for the selected pixels.
5. Select the highest value of the histogram as the angle for the block.

**Result:**

{{<figure src="/img/opencv-orient.jpg" title="Orientation estimation on a part of the image" >}}

## Full-sized images

Original image:

{{< thumb suffix="opencv_full_raw.jpg" >}}

Cleaned image:

{{< thumb suffix="opencv_full_cleaned.jpg" >}}

Orientation image:


{{< thumb suffix="opencv_full_orient.jpg" >}}

