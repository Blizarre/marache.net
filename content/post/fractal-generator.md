+++
date = "2014-01-13T22:19:54Z"
draft = true
title = "Fractal Generator"
thumbnail = "img/head_fractals.png"

+++

I made this small project in C# (winforms). The interface may be (and most certainly is) confusing, but the concepts are rather simple, as long as you know a little bit about the fractal image generation.

{{< figure src="/img/fractalsEditor.png" title="Screenshot of FractalExplorer" >}}

Some examples:

{{< thumb path="/img/fractals" file="fondEcran1.png" >}}
{{< thumb path="/img/fractals" file="fondEcran2.png" >}}

{{< thumb path="/img/fractals" file="fondEcran3.png" >}}
{{< thumb path="/img/fractals" file="fondEcran4.png" >}}

{{< thumb path="/img/fractals" file="fondEcran5.png" >}}
{{< thumb path="/img/fractals" file="fondEcran6.png" >}}

{{< thumb path="/img/fractals" file="fondEcran7.png" >}}
{{< thumb path="/img/fractals" file="fondEcran8.png" >}}

{{< thumb path="/img/fractals" file="fondEcran9.png" >}}
{{< thumb path="/img/fractals" file="fondEcranA.png" >}}

{{< thumb path="/img/fractals" file="fondEcranB.png" >}}
{{< thumb path="/img/fractals" file="fondEcranC.png" >}}

{{< thumb path="/img/fractals" file="fondEcranD.png" >}}
{{< thumb path="/img/fractals" file="fondEcranE.png" >}}

{{< thumb path="/img/fractals" file="fondEcranF.png" >}}

## How it works

It generates [fractals](https://en.wikipedia.org/wiki/Fractal). I am going to talk bout the [Julia set](https://en.wikipedia.org/wiki/Julia_set), but other fractals have been implemented. For Julia, C.real and C.Imag represents the parameter. This software will render the fractals using the CPU, with a bit of threading to make things run more smoothly (Parallel.For is awesome).

In the image, each pixel represents a complex number:

- The *value* of every pixel is a number of iterations n. This number n represents the number of iterations needed to make sure that a function has a certain property at this particular location (it diverge).
- The *location* of the pixel in the image is mapped into the complex plane. The pixel at location `(x, y)` represents a complex value `z = x + i * y`

In order to find the *value* for each pixel, we run a function `f(z)`. This function will return the number of iterations required to determine if the fract function you have been using diverge or not.

## Variables

z_0 is a complex number, representing the position of the pixel, in the complex plane.
c is a parameter (Complex also), that you can change with the C.Real and C.imag parameters.
MAX is a safeguard. If the function is not divergent, we need to stop it after a fixed number of iterations because it will never stop otherwise.

~~~bash
while n < MAX and |z_n| < 4
z_n+1 = z_n * z_n + c
~~~

That's it, now you have your pixel value ! well, not really, you have the shape. All the Eye-candy is up to you. You can choose the amount of red, green and blue, as well as the overall Contrast and Brightness of the image. The CheckBox "Non Linear" will try to give you something different. It is no longer math !

I didn't talked about the smoothing part: since we compute a number of iterations, we have an integer as a value. This gives a not so nice step effect. Several tricks can make them go away by computing intermediate values. The one I've used is in the documentation.

Anyway, one last thought : it would be interesting to see what DirectCompute can offer. I'm generating small images in almost real-time on my i5 4670K, but 1080p animations are still out of reach.

## Github project

On [gitHub](https://github.com/Blizarre/FractalExplorer)
