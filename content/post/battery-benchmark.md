+++
title = "Battery Benchmark"
draft = false
date = "2012-05-25T08:31:46Z"
thumbnail = "img/head_electronic.jpg"
+++

This page presents a benchmarking device for non-rechargeable battery. The idea is to use the TI Launchpad board as a voltmeter, and then to plot the voltage of a battery discharging over time. For this, I have to configure the MSP430 to make an acquisition every 60 seconds, and to store the result on the board. To make things simple, all the measurements are sent through the serial port every 15 seconds.

{{< figure src="/img/battTest.jpg" title="Photo of the Device" >}}

## How it works

Every minute I start an acquisition and store the result only if it is different from the previous one. Therefore you have a slight underestimation close to the resolution of the stored result.

### Pseudocode

Setup TimerA to fire an interruption iA every 15 seconds

~~~
currentTime = 0
currentTick = 0
oldResult = max(int)

do
    Wait until iA
    currentTick += 1

    # Start an ADC every 1 minute (4*15 seconds)
    if currentTick mod 4 == 0
    currentTick =  0
    currentTime += 1
    result = Analog to Digital Conversion
    if result != oldResult
        Store the new Result
        oldResult = result
~~~

### Code repository

Code is stored on [Github](https://github.com/Blizarre/PerfsBatt)

## Updates

* 26/05/2012: New data (IKEA batteries etc.), and the web page has been updated. The project is over !
* 25/02/2012: Ok, I have most of the data, I'm starting to make a web page to share the results.
* 05/02/2012: It works fine now, I start the real measurments.
* 01/02/2012: several tests done using UART. MSB of the data sent from the board is always corrupted. I think the problem comes from the clock. Found slides from TI that should help.
* 31/01/2012: Thanks Remy! I''ll use the inboard serial to usb converter to upload all the data at every measurements. Not extremely efficient, but it will be very easy to receive the data, and I will not need to let the computer on at all time.
* 29/01/2012: Thanks to the "User Guide", the datasheet as well as numerous blog posts, I can now make as many measurements as I want, store them in RAM, and configure the delay between the acquisitions. Now the question: should I store the data in RAM or on a SD card?
* 28/01/2012: I received the TI Launchpad board today! 4.30$ for the dev board and "express" shipping by FedEx. Thanks TI! Now, I'm trying to make a single measurement

## Authors

Simon Marache-Francisco and Rémy B.

## Documentation

* LOCAL MSP430 DataSheet
* LOCAL MSP430 User Guide
* LOCAL TI Launchpad User Guide : Board schematics p.17
* [Slides](http://www.ti.com/lit/ml/slap117/slap117.pdf) about MSP430 and UART for the new MSP430g2553 with HW UART capability. Figure Slide 25-26 give parameters for UART

