+++
title = "Small project: Automated translation of a journal with GPT4"
draft = true
date = "2023-12-26T08:37:05+01:00"
thumbnail = "img/head_code.png"
+++

I was talking to my father about the [Lewis and Clark expedition](https://en.wikipedia.org/wiki/Lewis_and_Clark_Expedition) of 1804. 

I found the original document (in the public domain) at the [gutenberg project's webpage](https://www.gutenberg.org/ebooks/8419). I translated a couple of entries for him and he looked interested.
Unfortunately I couldn't find any French translation of these work.

Given the simple nature of the medium (cleanly separated entries with a title), we wondered if we could use ChatGPT to perform the translation.
A couple of manual tests showed that the result was very good. I was really surprised by the wuality of the translation.

I decided to build a simple script (Python / Async / openai lib) to translate every single entries (~ 1600) and generate a file in markdown. [pandoc](https://pandoc.org) was then used to convert it into epub.

It is amazing what you can do in a couple of hours. If anyone is interested, here is the output: 

It took around an hour and $20 to translate the whole book.

Github repository: https://github.com/blizarre/microProjects
