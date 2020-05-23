+++
title = "Migration to Kubernetes"
draft = false
date = "2020-05-01T08:37:05+01:00"
thumbnail = "img/head_cloud.jpg"
+++

It is never easy to get your company to move its entire infrastructure to the new shiny buzzwordy tech stack, and it is probably for the best. But the nice thing with your personal infra is that the stakes are lower, and the scope smaller.

I have always been fascinated by Docker-based infra since I first came into contact with them (Mesos, Docker swarm, Docker compose), because they seem to provide a much lower coupling between the SysAdmin and the dev/devOps. The devs can provide a few docker images and a description of the environment, and the sysadmins can take over from there without having to worry about the internals.

## Previous infrastructure

I have a simple setup, with a wiki ([wikijs](https://wiki.js.org/) is amazing), this website, and a few scripts on a Cron job. The wiki and the scripts are running from a Raspberry Pi that I have at home, while the website is static and served via [CloudFront](https://aws.amazon.com/cloudfront/)/[S3](https://aws.amazon.com/s3/).

## Rationale for change

Since I had to jump through some hoops to be able to access the wiki on the Raspberry Pi (my ISP modem doesn't support [hairpinning](https://en.wikipedia.org/wiki/Hairpinning)), I looked for a cheap cloud offering and found [Contabo VPS](https://contabo.com/?show=vps). Since [Kubernetes](https://Kubernetes.io/) seems to be the winner in the dockerized app management space, I looked for a "lightweight" Kubernetes implementation (a good candidate for [this page](https://examples.yourdictionary.com/examples-of-oxymorons.html)) and found [K3s](https://rancher.com/docs/k3s/latest/en/).

My goal was not to learn a lot about Kubernetes administration, but simply to get some hands-on experience as a user. I would gladly have used any of the big cloud providers Kubernetes offering, but they were all very expensive (I set myself a budget of 5GBP/month).

## Migration to Kubernetes

I set up a few ansible scripts to prepare the VPS and install K3s, which was surprisingly easy. I can now confidently tear down the VPS and recreate a working Kubernetes environment in less than 10 minutes, which is good enough for a personal project.

Learning how to use Kubernetes was much more difficult, as the learning curve is a bit steep. There are a lot of new concepts and a few gotchas due to the extensibility of the Kubernetes platform. For instance I tried to install the Nginx ingress controller, and could not understand why it did not work. It turns out that K3s come [preinstalled with Traefik](https://rancher.com/docs/k3s/latest/en/networking/) which would take over port `80` and `443`. Then I installed a Kubernetes certificate management solution called [cert-manager](https://github.com/jetstack/cert-manager/) to request the certificates from LetsEncrypt.

I have been very impressed with the way all the configuration is done via tags and the flexibility that it brings.

My last problem was that Traefik did not auto-redirect HTTP requests to HTTPS, which was a deal-breaker. I had to disable it in K3s and install it with a custom helm config with the `ssl.enforced` [flag](https://github.com/helm/charts/tree/master/stable/traefik). 

Now that I had HTTPS certificates and HTTP to HTTPS redirect, I could focus on migrating the wiki. It was surprisingly easy since the wiki was already managed with `docker-compose` on my Raspberry Pi. I fiddled a bit with the concepts of [Deployments](https://Kubernetes.io/docs/concepts/workloads/controllers/deployment/), [Services](https://Kubernetes.io/docs/concepts/services-networking/service/), and the persistence storage options, but I quickly managed to get a PostgreSQL database with persistent storage and a node server running.

The last missing piece for the wiki was the automated backups to S3, and for that I created a small docker image based on Alpine, that I schedule using Kubernetes' [CronJobs](https://Kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/). All the passwords and tokens are stored in [Secrets](https://Kubernetes.io/docs/concepts/configuration/secret/) for added security.

I decided as an experiment to add my website as well, but since it is hosted on S3, I just added an Nginx container to act as a HTTPS reverse proxy to S3.

## Conclusion

Overall, I have been very impressed by Kubernetes, it is incredibly overkill for my setup, but being on both side of the fence at work (dev/sysadmin), I can definitely understand why it has become an industry standard, I would really recommend it at work for evaluation on any medium to large-sized deployment, as long as the cluster itself is managed by a third-party like [Amazon's EKS](https://aws.amazon.com/eks/) or [Google's Kubernetes engine](https://cloud.google.com/Kubernetes-engine).

I plan to move the rest of my services to kubernetes little by little over the next few months.