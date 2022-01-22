+++
draft = false
thumbnail = "img/head_code.jpg"
date = "2021-10-20T17:35:50Z"
title = "X As a Service"
+++

I had a bit of fun over the last few months working on server apps. I focused on building simple, well-contained services that I would be able to use to learn new paradigm and languages:

## [bibin](https://github.com/blizarre/bibin): a swiss knife of a pastebin

I started with something simple but useful to learn the [rocket](https://rocket.rs) framework, [SQLite](https://www.sqlite.org/index.html) and async programming in [rust](https://www.rust-lang.org). I made a fork of [bin](https://github.com/w4/bin), a very minimalist pastebin-like service, that I upgraded by adding all the features that I could think of:
- Basic HTTP authentication
- Async SQLite storage backend using [sqlx](https://github.com/launchbadge/sqlx)
- QR code generation
- URL shortener
- Base64 encoding
- Keep the status in the persistent browser storage, so it also double as a scratchpad

Available on https://p.marache.net

## [faas](https://github.com/blizarre/faas): Fortune as a service

This time I wanted to make a very simple server from scratch and see how it behaved under load. It simply load a fortune file in memory and then serve a random quote on request. I was able to serve thousands of requests a second from a cheap arm-based cloud service, which was quite impressive.

Available on https://faas.marache.net

## [yaas](https://github.com/blizarre/yaas): youtube-dl as a service

This is a quick hack that I wrote to download youtube videos asynchronously. I wanted to be able to select videos anytime during the week and download them all at once before a flight. Since I had to manage multiple downloads in the background for an extended amount of time, I ended up building a python [flask](https://flask.palletsprojects.com/en/2.0.x/) app with [celery workers](https://docs.celeryproject.org/en/stable/userguide/workers.html). It was surprisingly easy and painless.
