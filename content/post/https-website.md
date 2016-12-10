+++
title = "HTTPS"
draft = true
date = "2016-11-21T08:37:05+01:00"
thumbnail = "img/head_cloud.jpg"

+++

I knew since the beginning that I had to comply with best practices and provide my website over a secure
channel. Not that there is much to hide in a static, open source website, but at least this part of
your surf will stay private (within [limits](https://news.ycombinator.com/item?id=7730265)).

This website is now stored on [S3](https://aws.amazon.com/s3/), but served though the CDN 
[AWS Cloudfront](https://aws.amazon.com/cloudfront/) which provides the (free) HTTPS certificate.

As a side note, I would like to thank everyone at [Travis](https://travis-ci.org/) for this amazing
service. It is extremely easy to configure and the github integration is top-notch !

