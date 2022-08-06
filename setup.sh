#!/usr/bin/env bash

##########################################
# setup.sh                               #
# ---------------------------------------#
# Set up a local development workstation #
##########################################

# variables
ANSIBLE_ARGS="$@"
PREREQUISITES="ansible git stow"

# abort if not all prerequisites are satisfied
for cmd in $PREREQUISITES; do
    if ! command -v $cmd &>/dev/null; then
        echo "Please install '$cmd' and try again!"

        exit 0
    fi
done

# run the tasks
ansible-playbook workstation.yml -i hosts $ANSIBLE_ARGS
