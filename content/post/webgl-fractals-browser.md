+++
title = "Fractals in the browser using WebGl"
draft = false
date = "2014-10-27T22:51:27Z"
thumbnail = "img/head_fractals.png"
+++

Following my work on almost real-time fractals generation, I wanted to test OpenGL shaders. I have been really impressed with the results. You can render fractals in real-time on a full screen with an nvidia GTX 770. The shaders I have been using are probably not very optimized, but the results is great nevertheless.

[Access the demo](/projects/jscripts/fractal.html)

## Features:

* Julia fractal : You can change the values of c0 in the Julia function ( x'=x? + c0 )
* Animations: The software will slowly change the values of the Julia function to animate the fractal.
* Full-screen mode

{{< figure src="/img/webglFractals.png" title="Screenshot" >}}

The source code is available in [Github](https://github.com/Blizarre/jscripts/blob/master/fractal.js).
