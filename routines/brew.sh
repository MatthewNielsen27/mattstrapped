#!/usr/bin/env bash

echo -e "\nNow we gotta install brew apps:"

# Read each app from vars/brew_apps
while read app; do
    which $app > /dev/null 
    if [ $? -ne 0 ] ; then
        echo "[Brew] installing $app"
        brew install $app
    else
        if [ "$UPDATE_EXISTING_BREW_APPS" = true ] ; then
            echo "[Brew] upgrading $app."
            brew upgrade $app
        else
            echo "[Brew] $app has already been installed."
        fi
    fi
done <vars/brew_apps.txt

# See the list of already installed apps
apps=`brew cask list`

# Read each app from vars/brew_apps
while read app; do
    if [[ "$apps" == *"$app"* ]] ; then
        echo "[Brew cask] $app has already been installed"
    else
        echo "[Brew cask] installing $app"
        brew cask install $app
    fi
done <vars/brew_cask_apps.txt