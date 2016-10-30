+++
title = "Image generation acceleration using X86_64 SIMD extensions"
draft = true
date = "2015-10-25T20:36:12+01:00"

+++

The [SSE](https://en.wikipedia.org/wiki/Streaming_SIMD_Extensions) and [AVX2](https://en.wikipedia.org/wiki/Advanced_Vector_Extensions)
extensions of the x86 instruction set can dramatically improve the speed of a program if you can optimize ot for SIMD instructions.

I made a small test with a fractal generator, which lends itself very well to this kind of optimization. I was impressed by the results:
In very little time, thanks to the [intel intrisics guide](https://software.intel.com/sites/landingpage/IntrinsicsGuide/), I have been able
to reduce the rendering time by a factor of 6.6 using AVX2 extensions (200ms to 30ms). This is pretty close to the maximum gain you 
can expect when working on 8 pixels at the same time.

As a test I made a SSE version of the algorithm, which doesn't seem to work on computers without AVX2, even if it should support it.
I'll try to debug this once I'll have access to a computer with older hardware.

{{< figure src="/img/avx-screen.jpg" title="Screenshot with AVX activated" >}}


The source code available on [github](https://github.com/Blizarre/fractVect), see function 
[generateImageAVX](https://github.com/Blizarre/fractVect/blob/master/main.cpp#L199")
