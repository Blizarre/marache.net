+++
draft = true
title = "Seam carving"
date = "2015-06-07T10:34:08+01:00"
thumbnail = "img/head_code.jpg"
+++

Let's say you have a picture with an awkward ratio. You can't print it anywhere without either cropping or rescaling. The technique
described in the paper from [S. Avidan and A. Shamir](http://www.faculty.idc.ac.il/arik/SCWeb/imret/imret.pdf), Seam Carving for 
*Content-Aware Image Resizing* is a very nice and elegant solution to resize the picture without changing the pixel aspect ratio.

{{< figure src="/img/seamcarving-beach.jpg" title="Original image (picture by Beverley Goodwin)" >}}

{{< figure src="/img/seamcarving-compare.jpg" title="Horizontal Shrink using naive resize on the left and Seam Carving on the right" >}}

The picture on the right has all the features of the originalimage, with little distortion, but the aspect ratio is completely different.

The paper use dynamic programming to look for the lowest-energy path between any top-row pixel to any bottom-row pixel (line in white):

{{< figure src="/img/seamcarving-energy.jpg" title="Sample Energy map" >}}

You need to provide the energy map that will give the cost needed to cross a pixel. I implemented two versions, one with Gabor filter, and the second one with a gradient filter (Sobel on the X axis). A third solution with entropy has been made as a prototype, but since no function exists in numpy/openCV to compute the entropy over a sliding window, I do it "by hand", which is far too slow!

Animation of the seam carving in action on an image:

{{< youtube hv9PUBc2-MI >}}

The same algorithm on another image:

{{< youtube 8OPCBhF5IGE >}}

Energy map

{{< youtube pmUNQLsmTuc >}}
