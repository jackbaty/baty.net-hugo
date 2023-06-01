---
title: Chat using GPT-3
---

I made a simple chatbot using Flowise that lets me ask questions about the contents of this blog.

To begin, click the purple chat icon at the bottom right of this page.

<script type="module">
    import Chatbot from "https://cdn.jsdelivr.net/npm/flowise-embed@latest/dist/web.js"
    Chatbot.init({
        chatflowid: "2ffcbd00-4d02-48eb-b018-15d7e40409e8",
        apiHost: "http://localhost:3000",
    })
</script>