SERVER_USER := "jbaty"
SERVER_HOST := "server03.baty.net"
SERVER_DIR := "/srv/baty.net/public_html"
PUBLIC_DIR := "/Users/jbaty/Sync/sites/baty.net/public/"
TARGET := "Server03 Hetzner"

default:
        just --list

clean:
	rm -rf "{{PUBLIC_DIR}}"

checkpoint:
	git add .
	git diff-index --quiet HEAD || git commit -m "Publish checkpoint"
	
serve:
	hugo serve -D

build: clean
	hugo --gc --minify
	
push:
	git push


index:
	@echo "Building search index..."
	/opt/homebrew/bin/npx -y pagefind --site "public"
	
deploy: checkpoint build index push
	@echo "\033[0;32mDeploying updates to {{TARGET}}...\033[0m"
	rsync -v -rz --checksum --delete --no-perms {{PUBLIC_DIR}} {{SERVER_USER}}@{{SERVER_HOST}}:{{SERVER_DIR}}
	open raycast://confetti

