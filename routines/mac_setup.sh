#!/usr/bin/env bash

echo -e "First we gotta install Homebrew:"

which brew > /dev/null 
if [ $? -ne 0 ] ; then
  echo "[Installing] Homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
  echo "[Already Installed] Homebrew"
fi