+++
title = "Micro project: PNG Implementation, Chunk Decoding
draft = false
date = "2021-07-11T10:50:27Z"
thumbnail = "img/head_code.jpg"
+++

I wanted to have a quick look at the PNG implementation, to see if I could have a high level understanding of the [W3C spec](https://www.w3.org/TR/PNG/#11iCCP) over the weekend. After a quick implementation of the chunk parsing logic in `rust`, I started to dig into the specification for the [`IDAT`](https://www.w3.org/TR/PNG/#11IDAT) chunk, ... and things got a bit ouf of hand...

I am now reading the [RFC1950](https://www.ietf.org/rfc/rfc1950.txt) (zlib data format) and [RFC1951](https://datatracker.ietf.org/doc/html/rfc1951) (DEFLATE algorithm), as they are are used to encode the image data. It looks like something that would be really interesting to implement, so I think that I will do that myself!


