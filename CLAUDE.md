# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

This site uses `just` as a task runner. Key commands:

- `just serve` - Start Hugo development server with drafts and future posts
- `just build` - Clean build with minification and garbage collection  
- `just deploy` - Full deployment: checkpoint, build, index, push, and rsync to server
- `just checkpoint` - Git add and commit with "Publish checkpoint" message
- `just index` - Build search index using pagefind
- `just restart` - Kill existing Hugo process and restart server

## Site Architecture

This is a Hugo static site using the PaperMod theme with custom layouts and partials.

### Content Organization
- **Posts** (`/content/posts/`): Main blog articles organized by year/month
- **Journal** (`/content/journal/`): Daily journal entries organized by year/month/day
- **Notes** (`/content/notes/`): Shorter notes organized by year/month
- **Pages**: About, Now, Lifestack, etc. as individual content files

### Key Configuration
- Uses BBEdit as `newContentEditor`
- Enables inline shortcodes and emoji support
- Custom permalinks: posts use `/posts/:year/:month/:slug/`, journal uses `/journal/:year/:month/:day/:slug`
- Generates HTML, RSS, and JSON outputs
- Includes weather data in journal metadata when available

### Custom Layouts
- `layouts/journal/` - Special handling for journal entries with weather metadata
- `layouts/notes/` - Custom note layouts with separate RSS feed
- `layouts/partials/journal_meta.html` - Displays weather and word count for journal entries
- Custom shortcodes for archives, figures, and gallery display

### Deployment
Site deploys to FreeBSD server at `bsd01.baty.net` via rsync. The deployment process includes building a search index with pagefind before uploading.

### Themes and Styling
Uses PaperMod theme with hugo-shortcode-gallery extension. Custom CSS in `assets/css/` directory.

## Content Types
- **Posts**: Long-form articles with full metadata
- **Journal**: Daily entries with optional weather data
- **Notes**: Short-form content, often from external systems (based on timestamp naming pattern)