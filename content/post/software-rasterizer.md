+++
date = "2015-01-06T22:44:38Z"
title = "Software rasterizer"
draft = true

+++

This is the follow-up on a project I started on November 2010. The goal was to code a very simple [rasterizer](http://en.wikipedia.org/wiki/Rasterisation) in c++. Even if I liked the result, the code was very messy and I wasn't proud of this work. I decided to try to port part of it to modern c++ (2011 version, less pointers) as an exercise in refactoring.

There is a lot to be done to make a real rasterizer, and I will probably continue to improve it in the future. Only flat shading is implemented, no z-buffer, etc.

You can load any model made in a simplified version of the STL, the teapot is included in /data .

usage: aff3d <model> (look in the data subdirectory)

keys:
* 'w' : wireframe / solid
* 'b' : enable/disable backface culling
* 'f' : scramble the image
* 'q' : use the mouse to move the teapot

TEAPOT_SCREENSHOT

TEQPOT_SCREENSHOT_2

The code is on [github](https://github.com/Blizarre/aff3D).
