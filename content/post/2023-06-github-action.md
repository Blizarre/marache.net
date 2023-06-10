+++
title = "Migrating my infra to Github Action"
draft = false
date = "2023-06-10T08:37:05+01:00"
thumbnail = "img/head_cloud.jpg"
+++

Over the year I have been using several platform to host my projects, from S3/cloudfront/ACM, docker-compose/VPS to k8s, back to docker-compose/VPS again.

But I recently found out that github pages was supporting artifacts created by github actions and custom subdomains in the free tier.

I then migrated most of my static projects:
- [Scoring assistant for Archery](https://github.com/Blizarre/score): _https://score.marache.net_
- [Simple hex/dec/binary converter](https://github.com/Blizarre/convert): _https://convert.marache.net_
- [This website](https://github.com/Blizarre/marache.net): _https://marache.net_
- [Recipe generator for Bread-making](https://github.com/Blizarre/bread_recipe): _https://pain.marache.net_

That was also a nice opportunity to clean up the remnant of the travis build pipelines, and replace them with github action pipelines. (And do some well-warranted cleanup on the legacy AWS infra).

I have been very pleased with the whole process, the tight GIT/CI/CD integration provided by github is really hard to beat.