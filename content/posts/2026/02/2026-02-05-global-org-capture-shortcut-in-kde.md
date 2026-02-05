---
title: 'Global org-capture shortcut in KDE'
date: 2026-02-05 05:29:52 -0500
slug: global-org-capture-shortcut-in-kde
categories: [""]
tags: ["Linux","Emacs"]
summary: 
---

I like being able to create new Org mode tasks from anywhere, via a simple keyboard shortcut. This probably doesn't justify a whole post, but here's how I did it.

Create a script at ~/.local/bin/orgcapture.sh

Here's the script:

```sh
#!/bin/bash
emacsclient -c -F '((name . "capture") (width . 80) (height . 34))' -e '(progn (org-capture) (delete-other-windows))'
```

In KDE's Settings, I added a new command in the Shortcuts settings that point to that script. I assigned it to F3.

Now I hit F3 any time and a small capture buffer pops up in a new frame. That's it. If there's a better method for doing this, let me know.
