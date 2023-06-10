+++
title = "A new project: Immediate mode UI in rust"
draft = true
date = "2023-05-22T08:37:05+01:00"
thumbnail = "img/head_fractals.png"
+++

I am a backend/DevOps, so I haven't a lot of opportunities to work on any kind of GUI. But at the same time, I am always fascinated by image generation (See my [voxel renderer](https://github.com/Blizarre/mountain), [software rasterizer](https://github.com/Blizarre/aff3D), and many fractal generators), and having a simple engineering UI makes life much easier for the developer.

Since my last project was (another) fractal generator, written in rust/OpenGL this time, I decided to look for a simple UI component that I could use to provide the interface, and stumbled on [egui](https://github.com/emilk/egui) (the UI) + [glow](https://github.com/grovesNL/glow) (the OpenGL bindings).

I had never worked with [immediate mode](https://en.wikipedia.org/wiki/Immediate_mode_(computer_graphics)) before and that's pretty refreshing: The code that generate the UI is called at every frame. It's not very efficient from from a performance point of view, and probably doesn't scale well, but writing code that way is really fun.

{{< thumb path="/img/fractals" file="fondEcran1.png" >}}
