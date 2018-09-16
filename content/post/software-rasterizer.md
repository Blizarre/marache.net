+++
date = "2015-01-06T22:44:38Z"
title = "Software rasterizer"
draft = false
thumbnail = "img/head_code.jpg"
+++

*Edit:* there is a more [recent post](/post/update-cpp.html) on this project. The new version has more feature and is finally able to render any STL.

This is the follow-up on a project I started on November 2010. The goal was to code a very simple [rasterizer](http://en.wikipedia.org/wiki/Rasterisation) in c++. I used the [framebuffer](https://en.wikipedia.org/wiki/Framebuffer) provided by the [SDL library](https://www.libsdl.org/) to perform the rendering. In other word, SDL only provide a canvas on which I "paint" the model, pixel by pixel.

Even if I liked the result, the code was very messy and I wasn't really proud of this work. I decided to try to port part of it to modern c++ (2011 version, less pointers) as an exercise in refactoring.

There is a lot to be done to make a real rasterizer, and I will probably continue to improve it in the future. Only flat shading is implemented, no z-buffer, etc.

You can load any model made in a simplified version of the STL, the teapot is included in `/data`.

~~~text
usage: aff3d <model> (look in the data subdirectory)

keys:
* 'w' : wireframe / solid
* 'b' : enable/disable backface culling
* 'f' : scramble the image
* 'q' : use the mouse to move the teapot
~~~

{{< figure src="/img/rasterizer1.png" title="Solid rendering of the teapot" >}}

{{< figure src="/img/rasterizer2.png" title="Wireframe rendering of the teapot" >}}

The code is on [Github](https://github.com/Blizarre/aff3D).
