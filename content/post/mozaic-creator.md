+++
title = "Mozaic Creator"
draft = true
date = "2014-03-22T22:06:49Z"
thumbnail = "img/head_code.jpg"
+++

This program will create a mosaic image made from thousands of thumbnails, close to a reference image  :

{{< thumb file="mozaic1_orig.jpg" >}}
{{< thumb file="mozaic1_tr.jpg" >}}

{{< thumb file="mozaic2_orig.jpg" >}}
{{< thumb file="mozaic2_tr.jpg" >}}

{{< thumb file="mozaic3_orig.jpg" >}}
{{< thumb file="mozaic3_tr.jpg" >}}

**WARNING:** This is a small hack I made in a few afternoon, the code quality is pretty bad. 😔

You will need to provide a directory with the thumbnails used to generate the final image. How to generate it is left as an exercice to the reader.

## Features

* Can handle more than 2000 small images.
* Theses images can be split into 5 smaller images to increase the sample number (split option), thus making more than 10 000 thumbnails
* For now, the comparison function is a sum of square difference in the Lab space
* The Mindistance parameter prevent the frequent reuse of the same thumbnail at the same place : you will limit the number of time a thumbnail cans be used for a given radius (in thumbnail number)
* The comparison is done using smaller thumbnails to increase speed. This is the ReductionFactor, and has no impact on the final size of thumbnails
* Contrary to the reductionThumb parameter, which will reduce the final size of the thumbnails.
* The images from the gallery above were made in in less than 30 seconds !

Warning : should be run on x64 computer, it can fill up RAM very quickly, and support bmp images only for now.

Currently the source code is for visual studio 2013. Very easy to port on linux, the only windows-only parts are the filesystem module.

Source code, as usual stored on [GitHub](https://github.com/Blizarre/mozaicCreator)

{{< figure src="/img/mozaic_cli.png" title="Mozaic Creator" >}}