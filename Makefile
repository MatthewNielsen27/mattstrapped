.PHONY: all config mac mac_setup brew_apps git_repos

all: mac

mac: config mac_setup brew_apps git_repos

config:
	@. config.sh

mac_setup:
	@routines/mac_setup.sh

brew_apps:
	@routines/brew.sh

git_repos:
	@routines/git_repos.sh
