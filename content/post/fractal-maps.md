+++
title = "Fractal Maps"
draft = true
date = "2014-08-31T22:41:51Z"

+++

I'm currently working on the second iteration of my fractal drawing software. The biggest problem of the original one (see here) was that you couldn't move around like in google maps. The goal of this versions is to enable you to move around, and the software will generate pieces of the fractal on the fly.

Since it is not feasible, even on high-end hardware to generate 1080p fractal pictures in vanilla C# in real-time, i'm implementing a somewhat efficient caching system. It's not completly ready yet, and lack a lot of feature, but I will make a binary available for download as soon as it is ready.

*Edit:* after my GPU fractal rendering project using WebGL, this one is getting less and less relevant. I stopped working on it, and release it in a simple form. the binary is here, and the source code is on [github](https://github.com/Blizarre/FractalMaps) as usual. The debug data is still displayed.

IMAGE_FRACTALMAPS
