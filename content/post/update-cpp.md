+++
title = "Back to c++"
draft = false
date = "2018-05-20T08:37:05+01:00"
thumbnail = "img/head_code.jpg"

+++

I missed C++ since I started my job 2 years ago, and I think that now is the
right time to have a look at what has changed. I bought [Effective Modern
C++](http://shop.oreilly.com/product/0636920033707.do), which is really well
written and to the point. I am now going to update my old [3d rasterizer
project](https://github.com/blizarre/aff3d) with what I gained from the book. I
already made a few changes to support SDL2, fixed a few cmake issues, added
travis support to make sure it would build properly, and added support for the
STL file format.

I plan to try to improve the overall architecture and fix some bugs to the rendering code.

{{< figure src="/img/aff3dSkull.png" title="T-Rex skull" >}}

This model has 167000 triangles and was created by [MakerBot](https://www.thingiverse.com/thing:308335).

The code is on [GitHub](https://github.com/blizarre/aff3d).