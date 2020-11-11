+++
title = "3d terrain rendering for embedded hardware"
draft = false
date = "2020-08-09T10:50:27Z"
thumbnail = "img/head_code.jpg"
+++

{{< figure src="/img/terrain-rendering.jpg" title="Screenshot in 1080p" >}}

I had some fun writing a simple real-time [ray-casting](https://github.com/Blizarre/ray) and a [triangle rasterizer](https://github.com/Blizarre/aff3D) years ago as a student, and recently wanted to implement another of these old 3d rendering algorithms.

I remembered being blown away by the voxel rendering of the Outcast and Delta Force games as a child, so it was an obvious next step.
I also had bought a new PocketGo mini-game console and thought that it could be interesting to port an engine on this very weak hardware.

This is a a simple implementation of the voxel engine used in the comanche video games, also called VoxelSpace. This was heavily inspired by [s-macke's github project VoxelSpace](https://github.com/s-macke/VoxelSpace).

The difference is that in my case the target is a small arm9 portable game console. Javascript would not be able to render anything fast enough on this kind of hardware. This was a good opportunity to try something a bit faster, and even more modern: rust.

I made a small [docker image](https://github.com/Blizarre/pocketgo-docker-rust) with the arm9 toolchain and a modern version of rust that i use to build the sources.

I tried several tricks to reduce the memory footprint by using the a colormap (8bit palette) but in the end it was a little bit slower, probably because the full texture is already small enough to fit in caches. I made a small fixed-point library in rust as the pocketGo lacked a hardware FPU.

[Project source on github](https://github.com/Blizarre/mountain)
