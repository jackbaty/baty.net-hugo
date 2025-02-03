---
title: 'Friday, August 16, 2024'
date: 2024-08-16 08:30:43 -0400
categories: ["Journal"]
tags: [""]
slug: today
summary: A bit about moving back to Hugo
weather: Light rain 66.0 | Low 59.1, High 83.8
---

Just when I thought the move back to Hugo was finished and had gone smoothly, I discovered the search (using Fuse.js) wasn't working on the server. It worked fine locally. I thought it must be that the server is using Caddy, so I ran it locally via Caddy and search still worked fine. It took me forever to notice that the Caddy config on the server included a redirect from index.json to index.xml. This was from an earlier time when index.json was an Atom/RSS file. Technically it still is, but the search page needs to load the file and the server was throwing it off. I removed the redirect from my Caddyfile and now [search](/search/) works again.
