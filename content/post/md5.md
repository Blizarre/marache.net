+++
title = "Micro project: md5 implementation"
draft = false
date = "2020-12-27T10:50:27Z"
thumbnail = "img/head_code.jpg"
+++

I made a simple implementation of the md5 algorithm based on the original [RFC 1321](https://tools.ietf.org/html/rfc1321) from _1992_!

It was quite interesting to see the original code for the reference implementation, as it is using the old-style K&R syntax. For instance, the types for function arguments are defined separately:
```c
/* Decodes input (unsigned char) into output (UINT4). Assumes len is
  a multiple of 4.
 */
static void Decode (output, input, len)
UINT4 *output;
unsigned char *input;
unsigned int len;
{
```

I tried to stay as close as possible to the RFC, without considerations for speed. The resulting program is around 15% slower than the `md5sum` implementation from coreutils, which is not that bad.

Even if I spent quite some time on a test harness (`testtools`), including a python script to generate the test data, it is **not** production-ready: the error-handling system is very primitive and has not been tested thoroughly. It was only a weekend project to have a bit of fun learning about this venerable algorithm.

[The source is on github](https://github.com/Blizarre/microProjects/tree/master/md5)
