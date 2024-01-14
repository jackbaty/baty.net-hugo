---
title: 'Creating custom error documents in httpd on OpenBSD'
date: 2024-01-14 10:54:27 -0500
slug: creating-custom-error-documents-in-httpd-on-open-bsd
tags: ["OpenBSD","httpd"]
summary: 
---


The default error (e.g. 404) pages in OpenBSD's built-in web server are super basic. I can live with that, but what I can't live with is that they use Comic Sans. I kid you not...

{{< figure src="not-found.png" caption="Seriously?" >}}

I don't know if it's supposed to be a joke, but it's not funny.

If you do a search for "httpd custom 404 page" you'll find a lot of responses claiming that changing error pages can't be done without patching httpd and recompiling. Well I'm not doing that!

On about page 4 of search results I found [this post](https://utux.fr/article324/openbsd-httpd-comic-sans-ms) explaining how to do it. Turns out it's now possible with a simple config change:

Just add something like `errdocs "/errdocs"` in httpd.conf. Then put a file named err.html file in /var/www/errdocs with the generic error message or create one for each error code, e.g. 404.html.

I could have just read the man page [httpd.conf(5)](https://man.openbsd.org/httpd.conf.5#errdocs) and saved myself a lot of trouble.
