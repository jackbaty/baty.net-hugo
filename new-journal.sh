#!/bin/bash

# Hugo new daily journal post script
# Creates a new index.md file for daily journal entries

# Get current date components
YEAR=$(date +%Y)
MONTH_NUM=$(date +%m)
MONTH_NAME=$(date +%B)
DATE_SLUG=$(date +%Y%m%d)
FULL_DATE=$(date +"%A, %B %d, %Y")
ISO_DATE=$(date +"%Y-%m-%d %H:%M:%S %z")

# Check for help flag first
if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    echo "Usage: $0 [-f|--force] [-h|--help]"
    echo "  -f, --force    Overwrite existing file for today"
    echo "  -h, --help     Show this help message"
    exit 0
fi

# Check for force flag
FORCE_OVERWRITE=false
if [ "$1" = "-f" ] || [ "$1" = "--force" ]; then
    FORCE_OVERWRITE=true
fi

# Construct the directory path
CONTENT_DIR="/Users/jbaty/sites/baty.net/site/content/journal/${YEAR}/${MONTH_NUM}-${MONTH_NAME}/${DATE_SLUG}"
FILE_PATH="${CONTENT_DIR}/index.md"

# Create the directory structure
mkdir -p "$CONTENT_DIR"

# If file exists and no force flag, exit
if [ -f "$FILE_PATH" ] && [ "$FORCE_OVERWRITE" = false ]; then
    echo "Journal entry for today already exists: $FILE_PATH"
    echo "Use -f or --force flag to overwrite, or edit the existing file."
    exit 1
fi

# Get weather (assuming you have the getweather script)
WEATHER=""
if [ -f ~/bin/getweather ]; then
    WEATHER=$(~/bin/getweather)
fi

# Create the markdown file with frontmatter
if [ "$FORCE_OVERWRITE" = true ] && [ -f "$FILE_PATH" ]; then
    echo "Overwriting existing file: $FILE_PATH"
fi

cat > "$FILE_PATH" << EOF
---
title: '${FULL_DATE}'
date: ${ISO_DATE}
categories: ["Journal"]
tags: [""]
slug: today
summary: 
draft: true
weather: ${WEATHER}
cover: 
  image: 
  alt: 
  caption: 
  relative: true
---

EOF

echo "Created new journal entry: $FILE_PATH"

# Optionally open the file in your preferred editor
# Uncomment one of the following lines based on your preference:
# code "$FILE_PATH"        # VS Code
# vim "$FILE_PATH"         # Vim
# nano "$FILE_PATH"        # Nano
open "$FILE_PATH"        # macOS default app
