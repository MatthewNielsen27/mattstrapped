#!/usr/bin/env bash

echo -e "\nNow we gotta clone some git repos:"

# Try and make the repo directory
mkdir -p $REPO_DIR

# Read each app from vars/brew_apps
while read line; do
    IFS=', ' read -r -a array <<< "$line"

    incoming_dir="${array[0]}"
    incoming_link="${array[1]}"

    if [ -d "$REPO_DIR/$incoming_dir" ]; then
        echo "[Git] repo $incoming_dir already exists"
    else
        echo "[Git] cloning repo $incoming_dir"
        git clone $incoming_link "$REPO_DIR/$incoming_dir"
    fi
done <vars/git_repos.txt