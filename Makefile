# See LICENSE file for copyright and license details.

HOST= lacamera.xyz
USER= root
TARGET= /var/www/homepage

all: options clean deploy

options:
	@echo deploy options:
	@echo "HOST   = $(HOST)"
	@echo "USER   = $(USER)"
	@echo "TARGET = $(TARGET)"

clean:
	@echo "Deleting all files from $(HOST):$(DIR)..."
	ssh -t $(USER)@$(HOST) "setopt +o nomatch; rm -rf $(TARGET)/*"

deploy: clean
	@echo "Deploying files ..."
	rsync -ram \
  	--exclude={'.git/','LICENSE','Makefile'} \
  	--include '*' \
	. $(USER)@$(HOST):$(TARGET)
	@echo "Done."

.PHONY: all options clean deploy
