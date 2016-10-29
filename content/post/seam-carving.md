+++
draft = true
title = "Seam carving"
date = "2015-06-07T10:34:08+01:00"

+++

Let's say you have a picture with an awkward ratio. You can't print it anywhere without either cropping or rescaling. The technique
described in the paper from [S. Avidan and A. Shamir](http://www.faculty.idc.ac.il/arik/SCWeb/imret/imret.pdf), Seam Carving for 
*Content-Aware Image Resizing* is a very nice and elegant solution to resize the picture without changing the pixel aspect ratio.

On the second picture, all the important bits are there, with little distortion, but the aspect ratio is completely different:

EXAMPLE GOES HERE

The paper use dynamic programming to look for the lowest-energy path between any top-row pixel to any bottom-row pixel (line in white):

ENERGY MAP GOES HERE

You need to provide the energy map that will give the cost needed to cross a pixel. I implemented two versions, one with Gabor filter, and the second one with a gradient filter (Sobel on the X axis). A third solution with entropy has been made as a prototype, but since no function exists in numpy/openCV to compute the entropy over a sliding window, I do it "by hand", which is far too slow!

Animation of the seam carving in action on the image:

{{< youtube pmUNQLsmTuc >}}