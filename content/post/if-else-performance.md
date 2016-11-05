+++
date = "2016-11-05T08:54:15Z"
title = "A new micro project: comparing performances between 'switch' and if-else-if-else in C++"
draft = true

+++

I was having an argument with a coworker about the fastest method to branch in a code: lots of if/Else or a switch/case. I figured that the switch case would be faster, because the compiler would be less constrained than with the if/else, and could therefore use a better algorithm to select the right execution path.

To check this, I made a new entry in my [microprojects](https://github.com/Blizarre/microprojects) repo, the aptly named switchVsIfElse. A 11 entries switch case is compared with the same algorithm, using If/Else. The calling code iterate a certain number of times (input of the program) by feeding numbers to the branching code. Most numbers are from the "default" case, or last if. This gives a worst case scenario for the if/Else.

After running the benchmark on a i5 4570, the switch is 4 times faster than the ifElse. After a bit of googling, I found out that the switch can be implemented by the compiler as a binary search or as a branch table, which are obviously much faster than the ifElse !

Look at the [code](https://github.com/Blizarre/microProjects/blob/master/switchVsIfElse/test.cpp), and see for yourself !

## References

* [http://en.wikipedia.org/wiki/Switch_statement#Compilation]
* [https://github.com/741MHz/741MHz.github.io/tree/master/switch] (very interesting, but the hosting website is down...)

