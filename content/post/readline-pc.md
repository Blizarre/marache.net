+++
title = "Readline and pkg-config in ubuntu"
draft = false
date = "2019-08-17T10:10:00Z"
thumbnail = "img/head_cloud.jpg"
+++

I have been busy trying to learn [Chicken scheme](https://www.call-cc.org/) recently. 
The issue is that by default the REPL is a bit barebone. You are supposed to "augment" it 
by injecting a library of your choosing, like [readline](https://en.wikipedia.org/wiki/GNU_Readline).

The [documentation](https://wiki.call-cc.org/man/5/Getting%20started) for the project is quite good, 
even if a recent transition to a new major version has left some part of it out-of-date. 

I tried to install [breadline](http://wiki.call-cc.org/eggref/5/breadline), which provides bindings to
the `readline` library, but the build process failed because `pkg-config` cannot provide the compiler flags
for `readline`:

```
~  $ sudo apt install pkg-config libreadline-dev
[...]
~  $ sudo chicken-install breadline                                         
building breadline                                                                                         
   /home/user/.cache/chicken-install/breadline/build-breadline [...]
Package readline was not found in the pkg-config search path.                              
Perhaps you should add the directory containing `readline.pc'                                                                            
to the PKG_CONFIG_PATH environment variable                                                 
No package 'readline' found                                      
```

It seems that the flags definition is not provided by the packages on debian/ubuntu, even if it is generated during
the compilation of the library itself.

I downloaded the source code used to build the package and generated a simple definition file in `/usr/share/pkgconfig/readline.pc`:

```
Name: Readline
Description: Gnu Readline library for command line editing
URL: http://tiswww.cwru.edu/php/chet/readline/rltop.html
Version: 7.0
Requires.private: tinfo
Libs: -lreadline
Cflags: -I/usr/include/readline
```

The command `chicken-install` worked fine this time.
