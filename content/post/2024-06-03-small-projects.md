+++
title = "What I Have Been Up To"
draft = false
date = "2024-05-01T08:37:05+01:00"
thumbnail = "img/head_code.jpg"
+++

Recently, I've been working on a few small but fun projects. As usual it's mostly about software, but there is a bit of (light) embedded too this time! These involve using MicroPython for a hardware project, creating a user-friendly interface for DALL-E, and setting up a self-hosted music streaming solution.

## USB Volume Knob with CircuitPython

I created a volume/media key USB controller for my desktop using MicroPython and a ProMicro microcontroller. This small project was my first experience with CircuitPython, and I absolutely loved it. I used a bootleg ProMicro (RP2040) to build a "proper" physical volume knob and media buttons, which I enclosed in an old tin box I found at a thrift shop.

### Features

- **Volume Control:** The knob allows you to control the volume of your device.
- **Play/Pause:** A short press on the knob will play or pause the current track.
- **Next/Previous Track:** Pressing the previous and next buttons will skip to the previous or next track.

The simplicity and functionality of CircuitPython made this project really fun. Having a REPL on your micro-controller fells like having superpowers (I remember spending hours trying to flash [PICs](https://en.wikipedia.org/wiki/PIC_microcontrollers) at uni). You can check out the code and detailed instructions on my [GitHub page](https://github.com/Blizarre/usb_volume_knob_circuitpython).

{{< figure src="/img/usb_knob.jpg" title="Photo of the Device" >}}


## MicroDallE: A Simple UI for DALL-E

I created a simple web-based UI for DALL-E called MicroDallE. This project is as a web server that generates an image based on a user-input prompt, using DALL-E 3 from OpenAI. It was primarily an experiment to see how far I could push the capabilities of ChatGPT for coding, and it even helped write the Readme! It isn't perfect by any means but it still managed to speed the development time.

### Features

- **Image Generation:** Enter a prompt, and the server creates an image using DALL-E 3.
- **Optional Local Save:** You can optionally save each generated image with its prompt for your records. I wanted to add that feature because each generation cost money, and I didn't to waste it by mistake.

The project was developed using Python and Flask. For more details, you can visit the [GitHub repository](https://github.com/Blizarre/microdalle).

{{< figure src="/img/microdalle.jpg" title="Screenshot of MicroDallE" >}}


## Self-Hosted Music Streaming

I decided to stop using Spotify for music streaming and instead built and self-hosted my own music collection. It's really pleasant to know that my music collection won't become unavailable. When I browse my Spotify favorites, I often see tracks that have disappeared, and I may never hear them again.

### Setup

- **Backup:** All my music is backed up in [S3 Glacier](https://aws.amazon.com/s3/storage-classes/glacier/), using a daily cronjob.
- **Management:** The collection is organised using [Beets](https://beets.readthedocs.io/en/stable/index.html), which handle tagging, covers, and maintaining the filesystem.
- **Streaming:** [Navidrome](https://www.navidrome.org/) serves the music, making it accessible from anywhere in the house (internal network only).
- **Hosting:** My Raspberry pi that I already use for homeassistant. With the new "Boot from USB" feature the reliability is pretty good, there are no SD cards involved with an external SSD.
