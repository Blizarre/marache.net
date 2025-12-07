+++
title = "The next generation of self-hosting?"
draft = false
date = "2025-09-15T08:37:05+01:00"
thumbnail = "img/head_code.jpg"
+++

I have been trying to get more independent of third-party services. Over the years several of them have become unsuitable:
- too complex to use because they keep adding features I don't want
- abandoned/bought
- adverts and dark patterns
- increased subscription fees

I also worry about them getting hacked ([or one of their suppliers](https://www.bleepingcomputer.com/news/security/openai-discloses-api-customer-data-breach-via-mixpanel-vendor-hack/)), or just selling my data outright.

I have been following the LLM space for some time now ([book translation]( {{< relref "./2023-12-lewis-clark-french-translation.md" >}} ), [RAG experiments]({{< relref "./2024-07-03-rag-ai-search.md" >}}), [wiki of babel]({{< relref "./2024-10-26-wiki-of-babel.md" >}})...), and I have found a very nice use case for [Claude code](https://www.claude.com/product/claude-code) as way to get more independent.

I started building more and more little one-off services using AI to cover the gaps. By restricting the set of requirements (simple UI, low-availability, single-user, single deployment, in a local network/behind a proxy), I can afford to build a service for "cheap" in a couple of afternoons while watching TV.

So far I have built, and I use almost daily:
- [Flashcard](https://github.com/blizarre/flashcard): A single-page web app to create/edit/use flashcards
- [Vibe-Kanban](https://github.com/Blizarre/vibe-kanban/): A simple web app to manage all my little ideas/projects in the style of Kanban
- [Recipe-Manager](https://github.com/Blizarre/recipe-manager/): A small website to manage my recipes in markdown, with a translation feature to send them to my family (in French)

They only have the features that I want, no ads, no telemetry, and the persistence is achieved by a few json on the filesystem.

I was then discussing this with a colleague who had the same feeling: the barrier for entry is getting so low that many small SaaS/apps will have a hard time emerging on the market.

[Users only care about 20% of your application](https://idiallo.com/blog/users-only-care-about-20-percent), but when they can build this exact 20% in a couple of hours, it will be easier to just ask Claude to do it.

I don't think that is a threat for established companies selling software to business. Given how complex it is to deploy a new service in a modern environment, developers will probably just try to find a large vendor that can offer everything like AWS or Microsoft (in my company spinning up a new service means interacting with the infra team, IT team and the security team, and the overhead for the maintenance is significant).

However I can imagine individuals and small companies just asking Claude to build a small service, deploying it and letting it run in the background.

As AI coding assistants get better, the gap between "I wish this existed" and "I have something that works" will keep shrinking. I don't know if this is the future for everyone, but it's certainly working for me right now.

The real question is which services are still worth paying for when the alternative is a couple of afternoons and an LLM. I suspect we'll find out soon enough.
