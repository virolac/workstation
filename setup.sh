#!/usr/bin/env bash

##########################################
# setup.sh                               #
# ---------------------------------------#
# Set up a local development workstation #
##########################################

# variables
ANSIBLE_ARGS="$@"
PREREQUISITES="ansible git stow"
REMOTE_DOTFILE_REPO="https://github.com/virolac/dotfiles"
LOCAL_DOTFILE_REPO="$HOME/.repos/dotfiles"

# abort if not all prerequisites are satisfied
for cmd in $PREREQUISITES; do
    if ! command -v $cmd &>/dev/null; then
        echo "Please install '$cmd' and try again!"

        exit 0
    fi
done

# get/update the dotfiles
if [ -d $LOCAL_DOTFILE_REPO ]; then
    (cd -- $LOCAL_DOTFILE_REPO && git pull >/dev/null)
else
    git clone $REMOTE_DOTFILE_REPO $LOCAL_DOTFILE_REPO
fi

# run the tasks
ansible-playbook workstation.yml -i hosts $ANSIBLE_ARGS
