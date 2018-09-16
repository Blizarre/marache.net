+++
title = "MSGPCC on Linux"
draft = true
date = "2013-01-13T08:31:46Z"
thumbnail = "img/head_electronic.jpg"
+++

This post is about compiling and uploading software to a [Texas Instrument MSP board](http://www.ti.com/lsds/ti/tools-software/launchpads/launchpads.page) on linux.

I have been disapointed by the official MSP IDE, [CCS](http://www.ti.com/tool/ccstudio) because it is far too big for the small projects I am working on.

So I tried to use the MSP430 unofficial compiler, [mspgcc](http://sourceforge.net/apps/mediawiki/mspgcc/index.php?title=MSPGCC_Wiki). Nothing worked as expected. That is why I created this page to list all the tricks needed to make it work.

## Installation

Just use apt-get. `gdb-msp430` did not work on my computer, so I used `mspdebug` instead :

~~~bash
sudo apt-get install binutils-msp430 gcc-msp430 msp430-libc msp430mcu mspdebug
~~~

## Makefiles

The offical Makefile works fine.

## Setting interrupts

To enable interrupts :

~~~c
__enable_interrupt();
~~~

To define the functions, no #pragma needed, just use the attribute :

~~~c
__attribute__((interrupt(TIMER0_A0_VECTOR))) void ta0_isr(void) {
    P1OUT &= ~P_TIM_LED;
    LPM0_EXIT;          // Exit LPM0 on return
}
__attribute__((interrupt(PORT1_VECTOR))) void Port_1(void) {
    P1OUT ^= P_TIM_LED;                                     // Toggle LED state
    P1IFG &= ~P_SWITCH;                                     // P1.3 Interrupt Flag cleared
}
~~~

## Problem with memory.x

For the error:

~~~bash
simon@simon-VirtualBox:~/programmation/light4Garage$ make
Linking light4Garage.elf
/usr/lib/gcc/msp430/4.5.3/../../../../msp430/bin/ld: cannot open linker script file memory.x: No such file or directory
collect2: ld a retourné 1 code d'état d'exécution
make: *** [light4Garage.elf] Erreur 1
~~~

I didn't manage to pinpoint the exact origin of this. However, I managed to build after I changed the Makefile to copy the right memory.x on the current dir :

~~~bash
/usr/msp430/lib/ldscripts/$(MCU)/memory.x
~~~

But after a while this file was no longer needed. I guess ld just needed some time to update some cache.

## Send the program to the Launchpad

Can't use mspdebug with Virtualbox (usb incompatibilites), However it work fine with VMware Player.
