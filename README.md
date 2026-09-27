Intended installation flow:

sudo apt update
sudo apt install pipx -y
sudo pipx ensurepath
(Re-login to ensure path changes are implemented)
pipx install ansible-core==2.17
pipx inject ansible-core argcomplete


Optional: Creating a virtual environment:
    python3 -m venv ~/ansible-env
    source ~/ansible-env/bin/activate
    
mkdir ansible_repo && cd ansible_repo

Transfer AnsibleRepo_ProvisionMachine.zip to the ansible_repo directory.

sudo apt install unzip
unzip AnsibleRepo_ProvisionMachine.zip

chmod +x InstallCollectionsAndExecutePlaybook.sh
./InstallCollectionsAndExecutePlaybook.sh

The launcher prompts for the Ansible Vault password. Do not put the Vault password file in the repository or the zip archive.

For the first SSH bootstrap, install `sshpass` on the Ubuntu control node:

    sudo apt update
    sudo apt install sshpass

The playbook creates an Ed25519 key pair under `~/.ssh/ansible_provision_ed25519` on the control node if it does not already exist. The private key stays on that control node and must not be included in the project archive. On the first run for each inventory host, Ansible uses the vaulted `ansible_provision` SSH password to add the matching public key to that account. The provisioning play then uses the private key; subsequent runs skip password-based bootstrap for hosts already recorded locally.

Bootstrap markers are stored under `~/.local/state/ansible-provisioning`, outside the project. If a host is rebuilt or the provisioner account loses its authorized key, remove that host's marker (for example, `server1-*`) from this directory before rerunning so password bootstrap is attempted again. If the control-node key pair is lost, remove the markers for the affected hosts as well.


    The ./InstallCollectionsAndExecutePlaybook.sh is meant to install the necessary collections (needed for putting user-defined public keys on the )