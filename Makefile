SERVER_HOST=server03.baty.net
SERVER_DIR=/srv/baty.net/public_html
PUBLIC_DIR=/Users/jbaty/Sync/sites/baty.net-hugo/public/
TARGET=server03.baty.net

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
