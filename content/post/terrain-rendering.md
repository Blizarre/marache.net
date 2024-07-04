+++
title = "3d terrain rendering for embedded hardware"
draft = false
date = "2020-08-09T10:50:27Z"
thumbnail = "img/head_voxel.jpg"
+++

{{< figure src="/img/terrain-rendering.jpg" title="Screenshot in 1080p" >}}

I had some fun writing a simple real-time [ray-caster](https://github.com/Blizarre/ray) and a [triangle rasterizer](https://github.com/Blizarre/aff3D) years ago as a student, and recently wanted to implement another of these old 3d rendering algorithms.

I remembered being impressed by the voxel rendering of the Outcast and Delta Force games as a child, so it was an obvious next step.
This project was a nice way to use my new PocketGo mini-game console. The processor is very weak compared to any consumer game console, which would bring some interesting challenges. [s-macke's GitHub project VoxelSpace](https://github.com/s-macke/VoxelSpace) was a major source of inspiration. It is a good introduction to this rendering technique. JavaScript would not be able to render anything fast enough on this kind of hardware. This was a good opportunity to try something a bit faster, and even more modern: rust.

Along the way I made a small [docker image](https://github.com/Blizarre/pocketgo-docker-rust) with BuildRoot, the arm9 toolchain and rust to build the sources. It was necessary because rust is moving so fast that there were no guarantees that future versions would still work.

I tried several tricks to reduce the memory footprint by using a colormap (8bit palette) but in the end it was always a little bit slower, probably because the full texture is already small enough to fit in caches. I got the best performance improvements by switching computations to fixed-point as the PocketGo lacked a hardware FPU.

[The source is on github](https://github.com/Blizarre/mountain)
