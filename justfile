SERVER_USER := "jbaty"
SERVER_HOST := "bsd01.baty.net"
SERVER_DIR := "/usr/local/www/baty.net/public_html"
PUBLIC_DIR := "${HOME}/Sync/sites/baty.net-hugo/public/"
TARGET := "FreeBSD Vultr"

default:
        just --list

clean:
	rm -rf "{{PUBLIC_DIR}}"

checkpoint:
	git add .
	git diff-index --quiet HEAD || git commit -m "Publish checkpoint"
	
serve:
	hugo serve -D --buildFuture

build: clean
	hugo --gc --minify
	
push:
	git push


index:
	@echo "Building search index..."
	npx -y pagefind --site "public"

restart:
	killall -q hugo
	just serve
	
deploy: checkpoint build index push 
	@echo "\033[0;32mDeploying updates to {{TARGET}}...\033[0m"
	rsync -v -rz --checksum --delete --no-perms {{PUBLIC_DIR}} {{SERVER_USER}}@{{SERVER_HOST}}:{{SERVER_DIR}}
#	open raycast://confetti

