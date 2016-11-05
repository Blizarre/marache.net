+++
title = "Memory access: sequential vs. random"
draft = true
date = "2016-11-05T08:59:48Z"

+++

Everybody knows that accessing memory in a non-sequential way is slower because it leads to a lot of cache miss. This micro-project was made to evaluate the difference in performance.

An array of 10 000 000 elements (size\_t)is created. It represents a typical data structure that you will access in your program. A random list of 1 000 000 offsets is generated.

I compare the time used to fetch this million offset in a random order with the time used to fetch the same offsets, but in ascending (or descending) order.

This result has been obtained on a intel i5 4570:
```
stdCreate Data: 187ms.
Create offsetAccess: 56ms.
Find Max: 2ms.
data.size=100000000, offsetAccess.size=1000000, max(offsetAccess)=99999927

Pure random access: 16 ms.
... (done 20 times)
Pure random access: 17 ms.

Sort: 86 ms.

Pseudo sequential access: 9 ms.
... (done 20 times)
Pseudo sequential access: 9 ms.

Sort (reversed): 15 ms.
Pseudo sequential access (reversed): 9 ms.
...(done 20 times)
Pseudo sequential access (reversed): 9 ms.

Total time random: 317ms (mean: 15ms)
Total time sequential: 180ms (mean: 9ms)
Total time sequential reversed: 186ms (mean: 9ms)
Performance (sequential/random): 0.567823
```

This show a twofold improvement when the data is fetched in ascending (or descending) order!

On a 2-core ARM Cortex A-15, the improvement is threefold.

Source code is available [here](https://github.com/Blizarre/microProjects/tree/master/memoryAccessPattern)

## Future plan

Improve the benchmarking library using maybe [Google benchmark](https://github.com/google/benchmark).
