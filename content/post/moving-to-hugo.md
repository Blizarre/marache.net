+++
title = "Moving to a static Website"
draft = true
date = "2016-10-21T08:37:05+01:00"

+++

While hosting things by myself is actually quite fun, it is however very time-consuming.
Doing things right means taking care of security updates, features updates, backups, eventual
crashs, etc. And all the problems always arise when you are not really ready to deal with them, like
that time when my co-hoster decided to install a new kernel module that crashed completely our VSP instance.
I was obviously with my parents this weekend and waiting for an important email. So I had to spend 2 evenings
trying to get a new platform back online and restoring my backups before the mail bounced. It was not a pleasant experience.

My next step was then to host my mail and personnal web on a mutualised server. It worked well for a long time,
but the performances of wordpress are bad, I need to constantly waych for new vulnerabilities and patch my wordpress
accordingly. And the included webmail is ... not very pleasant to use.

Since I was starting to do more and more system administration for a living, I figured that I no longer to play with
that at home and decided to go to a full static website hosted on
[S3](http://docs.aws.amazon.com/AmazonS3/latest/dev/website-hosting-custom-domain-walkthrough.html), and pay a dedicated mail provider.