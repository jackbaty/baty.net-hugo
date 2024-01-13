---
title: 'Friday, January 12, 2024'
date: 2024-01-12 11:27:03 -0500
categories: ["Journal"]
tags: [""]
slug: today
summary: A day with Kirby, Hugo, and OpenBSD
draft: false
cover:
  image: "bsd-cover.jpg"
  alt: "Screenshot of laptop running OpenBSD"
  caption: "So much for stopping my OpenBSD experiment"
  relative: true
---

## Editing Kirby content via the server's panel

I can't remember why I switched to managing the blog via a local Kirby instance. Probably because I was doing so much customization that the content vs code syncing was confusing me. Now that development changes have settled down, I'm using the server panel for publishing. I'll cross the how-to-sync-code-vs-content-changes bridge with I get to it.

## Sync is where it gets tricky
My OpenBSD experiment that I (almost) ended has been going surprisingly well. I've got most of the basic settings configured and I have a real window manager (xfce) running. The whole idea of setting up the laptop is that it will be a bare-bones system for mostly writing/blogging/browsing. Should be easy, right? Just Emacs and my org directory. Except no. I need a bunch of dotfiles, espanso macros, passwords, git, and some shell scripts all synched. Lots of work still to do, it seems. Syncthing is running, but that was a trick. Now to work on dotfiles, since I hadn't been worrying about synching those for years now.

## RSS feeds and daily notes

This should show up as an update in the RSS feed. I'm mostly just testing here.

```
SERVER_HOST=server01.baty.net
SERVER_DIR=/home/jbaty/apps/baty.net/public_html
PUBLIC_DIR=/Users/jbaty/sites/hugo-blog/public/
TARGET=server01.baty.net

.POSIX:
.PHONY: build checkpoint deploy

# npx -y pagefind --source public

build:
	rm -rf $(PUBLIC_DIR)
	hugo --gc --minify

checkpoint:
	git add .
	git diff-index --quiet HEAD || git commit -m "Publish checkpoint"

deploy: build checkpoint
	git push
	@echo "\033[0;32mDeploying updates to $(TARGET)...\033[0m"
	rsync -v -rz --checksum --delete --no-perms $(PUBLIC_DIR) $(SERVER_HOST):$(SERVER_DIR)
	open raycast://confetti

```
