+++
title = "Moving to a static Website"
draft = true
date = "2016-10-21T08:37:05+01:00"

+++

While hosting my website all by myself is actually quite fun, it is however very time-consuming.
Doing things right means taking care of security updates, features updates, backups, 
crashes, etc. And problems always arise when you are not ready to deal with them, like
that time when my co-hoster decided to install a new kernel module that crashed completely our VPS instance.
I was obviously with my parents this weekend and waiting for an important email. So I had to spend 2 evenings
trying to get a new platform back online and restoring my backups before the mail bounced. It was not a pleasant experience.

My next step was then to host my mail and personal web on a shared server, using Wordpress, as it was apparently the right way to make your blog. It worked well for a long time,
but the performances of Wordpress are bad, and I had no need for any of the bells and whistles provided by the plan. The final straw was that the webmail included in the [package](https://www.ovh.co.uk/web-hosting/web-hosting-personal.xml) is ... not very pleasant to use.

Since I was starting to use more and more cloud services like AWS at my job, I figured that I could very easily replace everything with pure cloud services. I decided to upgrade full static website hosted on
[S3](http://docs.aws.amazon.com/AmazonS3/latest/dev/website-hosting-custom-domain-walkthrough.html), and pay a dedicated mail provider.
