#!/usr/bin/env bash
set -eu

cd "$(dirname -- "$0")"

ansible-galaxy collection install -r collections/requirements.yml
ansible-playbook --ask-vault-pass -i inventory.ini ProvisionMachine.yml