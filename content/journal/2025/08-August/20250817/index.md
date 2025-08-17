---
title: 'Sunday, August 17, 2025'
date: 2025-08-17 06:21:03 -0400
categories: ["Journal"]
tags: [""]
slug: today
summary: 
weather: Overcast 73.0 | Low 63.9, High 84.0
cover: 
  image: dish.jpg
  alt: Black and white photo of a Dish Network dish
  caption: Satellite TV (2017) / Nikon F3
  relative: true
---

All I wanted to do this morning was to add a class to an image in Hugo. At first I thought I needed to override my theme's image-render hook, but then I learned that could use the built-in [Markdown attributes](https://gohugo.io/content-management/markdown-attributes/). It required a new setting or two[^1], but worked great for adding a style to images in a single post. In lists, however, the styles are applied to the paragraph above the image, even with wrapStandAloneImageWithinParagraph set to false. I couldn't figure it out, so I just put the paragraph after the images. Not a solution, but solved the problem in this case. This will happen again, I'm sure. Normally, I'd just use raw HTML for this, but the image pipeline in Hugo "bundles" wouldn't work, and I need that.

----

Speaking of raw HTML. Have you noticed how we're too willing to jump through all sorts of hoops in Markdown just to avoid writing a little HTML.

----




[^1]: Namely, `wrapStandAloneImageWithinParagraph: false` and some block settings.