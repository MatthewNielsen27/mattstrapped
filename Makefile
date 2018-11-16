.PHONY: all config mac mac_setup

all: mac

mac: config mac_setup

mac_setup:
	@./strapped.sh
