+++
date = "2014-01-13T22:19:54Z"
draft = true
title = "Fractal Generator"

+++

I made this small project in C# (winforms). The interface may be (and most certainly is) confusing, but the concepts are rather simple, as long as you know a little bit about the fractal image generation.

IMAGE_MAIN_SCREENSHOT

Some images made with this tool are available

IMAGE_GALLERY

## How it works

Well, it generates [fractals](https://en.wikipedia.org/wiki/Fractal). The [Julia set](https://en.wikipedia.org/wiki/Julia_set), to be more precise (C.real and C.Imag represents parameter). Now everything is made in software mode, with a bit of threading to make things run more smoothly (Parallel.For is awesome).

To keep things simple, every pixel is viewed as a complex number:

The value of every pixel is a number of iterations n.

This number n represents the number of iterations needed to make sure that a function has a certain property at this particular location (it diverge).

So basically, you repeat a certain operation until you meet a criterion. Then you know the function diverge at this place.

## Variables:

z_0 is a complex number, representing the position of the pixel, in the complex plane.
c is a parameter (Complex also), that you can change with the C.Real and C.imag parameters.
MAX is a safeguard. If the function is not divergent, we need to stop it after a fixed number of iterations because it will never stop otherwise.

~~~
while n < MAX and |z_n| < 4
z_n+1 = z_n * z_n + c
~~~

That's it, now you have your pixel value ! well, not really, you have the shape. All the Eye-candy is up to you. You can choose the amount of red, green and blue, as well as the overall Contrast and Brightness of the image. The CheckBox "Non Linear" will try to give you something different. It is no longer math !

I didn't talked about the smoothing part: since we compute a number of iterations, we have an integer as a value. This gives a not so nice step effect. Several tricks can make them go away by computing intermediate values. The one I've used is in the documentation.

Anyway, one last thought : it would be interesting to see what DirectCompute can offer. I'm generating small images in almost real-time on my i5 4670K, but 1080p animations are still out of reach.

## Where is the code?
On [gitHub](https://github.com/Blizarre/FractalExplorer)

