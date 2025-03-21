+++
title = "The small migration"
draft = false
date = "2025-03-20T08:37:05+01:00"
thumbnail = "img/head_cloud.jpg"
+++

Given the recent events, I have been slowly migrating my internet presence to the EU and off the Big US Tech companies. It has not been very hard,
but it is a slow process given all the tools that have been experimenting with over the years.

So far:
- **email**: [*Fastmail*](https://www.fastmail.com/): I have been using them for years, without knowing that they had a strong EU presence. One less thing to worry about.
- **Travel blogs**: from wordpress/blogger to [*Fastmail*](https://www.fastmail.com/): Fastmail offer a small online drive that can be
  [exposed via websites](https://www.fastmail.help/hc/en-us/articles/1500000280141-How-to-set-up-a-website). They handle serving the files and TLS certificates.
  I had to import the original blogs into a local docker wordpress instance and generate the static files with [staatic](https://staatic.com/). It worked surprisingly well.
- **DNS registrar**: from AWS to [*Hetzner*](https://www.hetzner.com/domainregistration/). Again, the process took a few days but was pretty smooth.
- **DNS hosting**: from AWS Route53 to [*Hetzner DNS console*](https://www.hetzner.com/dns-console/). It was pretty easy to set up, and there is an API that [Caddy](https://github.com/caddy-dns/hetzner) can use to request Acme certs.
- **Main Backups**: from IDrive to [*Hetzner Storage Boxes*](https://www.hetzner.com/storage/storage-box/) with [BorgBackup](https://www.borgbackup.org/). The constant price increases and lack of features meant that it was a no-brainer.
- **Website backups**: from AWS S3 [*Hetzner Storage Boxes*](https://www.hetzner.com/storage/storage-box/). The storage boxes offer sub-accounts that have access to only part of the filesystem tree, and can be reached via SSH.
  Transitioning from `aws s3 cp` to `scp` was trivial. Access rights and user management is also much simpler.
- **Text/Video chats**: from Whatsapp to [*Signal*](https://signal.org/) and [*Telegram*](https://telegram.org/). My parents and family were keen to move away from Meta, so we decided to switch to Signal. Some of my European friends also wanted to be out but chose Telegram. I still need WhatsApp to communicate with club groups but I reduced my usage by 90%.
- **Books store**: from the Amazon Store to whoever sells books online with Adobe DRM. I got burned by the new encryption scheme that Amazon has rolled out and prevented me from migrating some books (fortunately very few).
- **Books management**: from the kindle app to [*Calibre*](https://calibre-ebook.com/), [*Calibre-web*](https://github.com/janeczku/calibre-web) and [*DeDRM*](https://github.com/apprenticeharper/DeDRM_tools).
  It is less convenient, but I can still access all my ebooks without having to physically connect my ebook to the computer.
- **Book reader**: from Kindle to [*KOReader*](https://koreader.rocks/): that is a little gem. The source code is very easy to follow (thank you [lua](https://www.lua.org/)!) so I have been able to
  fix bugs myself, and even get them merged in days thanks to the very nice community there. I can now download my RSS feeds directly from the reader without a third-party service.
- **Bookmarks-to-reader**: From a [custom project](https://github.com/Blizarre/pouch2inflame) with Pocket to [*Wallbag*](https://wallabag.org/). There is a Wallbag plugin in KoReader so I can just hit "Sync" and get all
  my bookmarks in the reader in no time as epubs. 

More will be added as I go. I still have an oracle free account for my public web services and a couple of S3 buckets that I need to move, but I have the time. I will also try to
move out of GitHub at some point.

Moving out of the apple ecosystem for my phone and Google Photos/Youtube will be a lot more difficult, as I could not find any replacements that were good enough for now.

In the end I am pretty happy with the transition. It required quite a bit of work but I managed to reduce my dependency to big US cloud companies by a little, and
even reduced the number of services and accounts I need to wory about.
