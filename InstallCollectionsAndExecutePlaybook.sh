#!/usr/bin/env bash
set -eu

cd "$(dirname -- "$0")"

ansible-galaxy collection install -r collections/requirements.yml
ansible-playbook --vault-password-file .vault_pass.txt -i inventory.ini ProvisionMachine.yml