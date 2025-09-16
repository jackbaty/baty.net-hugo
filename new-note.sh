#!/bin/bash

# Hugo new note script
# Creates a new markdown note file

# Function to convert title to slug (dashed words)
title_to_slug() {
  echo "$1" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-\|-$//g'
}

# Check for help flag first
if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
  echo "Usage: $0 [OPTIONS] \"Note Title\""
  echo "       $0 [OPTIONS]  (will prompt for title)"
  echo ""
  echo "Options:"
  echo "  -f, --force    Overwrite existing file"
  echo "  -h, --help     Show this help message"
  echo ""
  echo "Creates a note file with format: YYYYMMDD-title-slug.md"
  exit 0
fi

# Parse command line arguments
FORCE_OVERWRITE=false
TITLE=""

while [[ $# -gt 0 ]]; do
  case $1 in
  -f | --force)
    FORCE_OVERWRITE=true
    shift
    ;;
  -*)
    echo "Unknown option $1"
    exit 1
    ;;
  *)
    TITLE="$1"
    shift
    ;;
  esac
done

# Get title if not provided
if [ -z "$TITLE" ]; then
  read -p "Title: " TITLE
fi

# Validate title
if [ -z "$TITLE" ]; then
  echo "Error: Title cannot be empty"
  exit 1
fi

# Get current date components
YEAR=$(date +%Y)
MONTH=$(date +%m)
DATE_PREFIX=$(date +%Y%m%d)
ISO_DATE=$(date +"%Y-%m-%d %H:%M:%S %z")

# Create slug from title
TITLE_SLUG=$(title_to_slug "$TITLE")

# Create full slug with date prefix
SLUG="${DATE_PREFIX}-${TITLE_SLUG}"

# Set up paths with year/month structure
CONTENT_DIR="./content/notes/${YEAR}/${MONTH}"
FILE_PATH="${CONTENT_DIR}/${SLUG}.md"

# Create the directory structure
mkdir -p "$CONTENT_DIR"

# Check if file exists and handle force flag
if [ -f "$FILE_PATH" ] && [ "$FORCE_OVERWRITE" = false ]; then
  echo "Note already exists: $FILE_PATH"
  echo "Use -f or --force flag to overwrite, or edit the existing file."
  exit 1
fi

# Show overwrite warning if forcing
if [ "$FORCE_OVERWRITE" = true ] && [ -f "$FILE_PATH" ]; then
  echo "Overwriting existing file: $FILE_PATH"
fi

# Create the markdown file with frontmatter
cat >"$FILE_PATH" <<EOF
---
title: '${TITLE}'
date: ${ISO_DATE}
slug: ${SLUG}
categories: ["Note"]
cover: 
  image: 
  alt: 
  caption: 
  relative: true
---

EOF

echo "Created new note: $FILE_PATH"

# Optionally open the file in your preferred editor
# Uncomment one of the following lines based on your preference:
# code "$FILE_PATH"        # VS Code
# vim "$FILE_PATH"         # Vim
# nano "$FILE_PATH"        # Nano
# open "$FILE_PATH"        # macOS default app
typora "$FILE_PATH"
