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

We were both really surprised y the quality of the output. The original document is not perfect, with plenty of abbreviations, obsolete words and truncated phrases. But ChatGPT4 handled them pretty well.

> [Clark, May 29, 1804]
> 
> Tuesday 29th May Sent out hunters, got a morning obsvtn and one at 12<br/>
> oClock, rained last night, the river rises fast The Musquetors are<br/>
> verry bad, Load the pierogue

Was translated into

> ## Clark, May 29, 1804
> Mardi 29 mai, envoyé des chasseurs, pris une observation le matin et une à 12 heures, il a plu la nuit dernière, la rivière monte rapidement. Les moustiques sont très mauvais, chargez la pirogue.


The only caveat is that the tables were not translated well. They were not formatted very well in the original document, so the output is not very good:

> F        Inch<br/>
> Length from nose to tail                 5        2<br/>
> Circumpherence in largest part--                41/2<br/>
> Number of scuta on belly--221<br/>
> Do. on Tale--53<br/>

was translated into:
> F       Pouces Longueur du nez à la queue                   5        2 Circonférence à la partie la plus large--                4 1/2 Nombre de scutelles sur le ventre--221 Idem sur la queue--53

We decided that for our purpose this wasn't an issue, but that would be a potential improvement.

If anyone is interested, here is the output: 

It took around 2 hours and $20 in api calls to translate the whole book, which is really raisonnable.

Github repository: https://github.com/blizarre/microProjects
