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


    The ./InstallCollectionsAndExecutePlaybook.sh is meant to install the necessary collections (needed for putting user-defined public keys on the )