---
title: 'Emacs from scratch once again'
date: 2024-12-14 11:04:39 -0500
slug: emacs-from-scratch-once-again
categories: [""]
tags: [""]
summary: I like the idea of building my own Emacs config, so I set Doom aside and (re)built my own configuration (mostly) from scratch.
cover: 
  image: 
  relative: true
  hidden: false
  caption: 
---

<img src="/img/small/emacs.png#floatright">


I went to bed last night all fired up about the idea of rebuilding my Emacs configuration from scratch. I've been happily using [Doom Emacs](https://github.com/doomemacs/doomemacs) for some time, but missed the feeling of having built something myself. I mean, if I wanted everything done for me, I could just use Obsidian, right?

There's some level of geek pride in building my own config, but I don't always feel it's worth the trouble, when Doom exists. But sometimes I do, so I spent the day starting over.

The first option I considered was to start with [minimal-emacs.d](https://github.com/jamescherti/minimal-emacs.d) from James Cherti. I'd used this for my previous vanilla setup. It's quite fast and the defaults are sensible. This time, though, I was hoping for a little less magic in my config, so I decided to skip it.

I ended up taking the best bits from Protesilaos' [basic and capable configuration](https://protesilaos.com/codelog/2024-11-28-basic-emacs-configuration/). Prot is so pragmatic and thoughtful that it's always valuable to look at how he does things.

Something Doom is very good at is fast startup. With all my crap included, Doom would start in about 1.5 seconds. It's one reason I moved back to Doom in the first place, as my config had blown up to around 8 seconds and I didn't have the energy to optimize it. My unofficial target for the new config was under 4 seconds. I don't launch Emacs that often, so a few seconds once or twice a day won't kill me.

I copied the particulars from my earlier configs (for Org-mode, LaTeX, org-journal, etc.) and, long story short, I have a leaner, newer configuration that I (sort of) built myself. Startup is around 3 seconds, so I have a bit of room if I need it. Or maybe I'll learn about garbage collection and compilation and see if I can improve things.

There's no public repo for this yet. I worry that my cobbled together stuff would do more harm than good if someone started copying things from it. Maybe later.
