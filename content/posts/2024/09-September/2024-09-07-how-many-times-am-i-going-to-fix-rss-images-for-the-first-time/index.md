---
title: 'How many times am I going to fix RSS images for the first time?'
date: 2024-09-07 15:59:36 -0400
slug: how-many-times-am-i-going-to-fix-rss-images-for-the-first-time
categories: ["Blogging"]
tags: ["Hugo","RSS"]
summary: 
cover: 
  image: 
  relative: true
  hidden: false
  caption: 
---

OMG I never learn. Even when I write stuff down.

Every time I switch back to Hugo, I complain about the fact that when using relative image links in Hugo's Page Bundles, they don't work in the RSS feed. Then I spend time digging around old forum posts or whatever trying to fix the problem.

Except I already have fixed the problem. At least twice. Maybe just check [your own notes](https://baty.net/2023/10/images-in-hugo-rss-feeds/), Jack.

I like the PaperMod theme's built-in figure shortcode, so this time I made a local copy of that and tweaked it.

I copied the theme's shortcode to ./layouts/shortcodes/figure.html and added two lines to the top of the file:

```
{{ $imgname := .Get "src" }}
{{ $img := $.Page.Resources.GetMatch $imgname }}
```

I don't understand Hugo's templating language at all, but I think what this does is look for a file in the page bundle that matches the figure shortcode's `src` attribute. The problem is that if there isn't one, the site won't build, so I added a quick and dirty conditional to my copy of the shortcode template:

```
<img loading="lazy" src="{{- if $img }}{{ $img.Permalink }}{{ else }}{{ .Get "src" }}{{ end -}}...
```

If you see the following adorable photo of my grandson in your RSS reader[^1], and didn't before, it worked.

{{< figure src="lincoln.jpg" caption="" >}}



[^1]: Many RSS readers automatically expand the URL themselves, so it may have always appeared to work for you.
