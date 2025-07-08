---
title: 'A little TUI for updating exif data in photos'
date: 2025-07-08 06:00:53 -0400
slug: a-little-tui-for-updating-exif-data-in-photos
tags: ["Photography","Software"]
summary: 
cover: 
  image: 20250708-tui.jpeg
  alt: Screenshot of TUI
  caption: 
  relative: true
---

I like to have Make and Model information available in film scans, and use exiftool for this. I have a lisp function in Emacs that does this, but sometimes I'd like to do it from a terminal instead.

So I asked Claude for help. The result was [camera-exif-tui](https://github.com/jackbaty/camera-exif-tui). It's a tiny Go app that launches a TUI that allows me to select a make/model and a folder full of image files. It calls exiftool and updates the images with the selected camera info.

These quick, handly little scripts are ideal for AI. People seem to ignore this when railing against LLM use. The whole thing, including writing the README file and setting up the git repo took less than an hour. I would _never_ have bothered with this without something like Claude. It was _fun_! I don't want to learn the details of Golang, but I'm happy to tweak whatever Claude spits out. Now I have something that I wouldn't have had before, and it was easy to do. I don't care if it's "correct" or not. It works for me.


