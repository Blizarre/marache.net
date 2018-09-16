+++
title = "Augmented reality on Android"
draft = true
date = "2015-04-16T08:31:46Z"

+++

With my friend Clement we have been working on an exciting new project lately: Augmented reality on the smartphone. The goal is to show on screen the landmarks you are looking at through the camera.

Using your location (GPS), your direction (compass), and the location of the landmark (database), the program will show where the landmark should be on the screen.

Unfortunately, for now, I am stuck with a problem: Even when correcting for the magnetic inclination, the compass measurement is off by a small angle.... It seems to be the internal compass. More tests must be done to see if the offset is constant. And the internal compass is extremely sensitive to electromagnetic interferences : any car passing by will interfere with the measurement.

Code on [Github](https://github.com/Blizarre/SummitsAround)


