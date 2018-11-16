.PHONY: all config mac mac_setup

all: mac

mac: config mac_setup

config:
	@. config.sh

mac_setup:
	@./strapped.sh
