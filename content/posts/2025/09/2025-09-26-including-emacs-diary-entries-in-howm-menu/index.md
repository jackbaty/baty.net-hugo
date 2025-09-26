---
title: 'Including Emacs diary entries in Howm menu'
date: 2025-09-26 10:45:57 -0400
slug: including-emacs-diary-entries-in-howm-menu
categories: [""]
tags: ["Emacs","Howm"]
summary: 
cover: 
  image: 
  alt: 
  caption: 
  relative: true
---


[Howm](https://github.com/kaorahi/howm) has a handy menu for viewing tasks and notes. One thing I wanted to add was my Emacs diary entries for the current date. This took 3 things:

First, I created a function for inserting the day's entries from Emacs diary in the current buffer.

```emacs-lisp
(defun my/insert-diary-entries-for-today ()
  "Insert diary entries for today at point."
  (interactive)
  (let ((diary-list-entries-hook nil)
        (diary-display-function 'ignore))
    (let ((diary-entries (diary-list-entries (calendar-current-date) 1)))
      (if diary-entries
          (dolist (entry diary-entries)
            (insert (cadr entry) "\n"))
        (message "No diary entries for today")))))
```

(and by "I" I mean Claude, mostly)

Then I added the function as an option to Howm:

```emacs-lisp
;; For including Emacs diary in Howm Menu
(setq
 howm-menu-display-rules
 (cons
  (cons "%hdiary[\n]?" 'my/insert-diary-entries-for-today)
  howm-menu-display-rules))
```

Finally, I added `%hdiary` to Howm's menu file. And now, Howm's menu shows the day's diary entries.

{{< figure src="howm-menu.jpg" caption="Screenshot of Howm Menu" >}}



