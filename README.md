# virtualbox desktop linux

Basic quick setup instructions for Linux virtual desktops.
For all distros, create a VirtualBox VM with a 20GB disk. Boot off the ISO.

## Xubuntu

Insert guest additions CD:

VirtualBox: Device->Insert Guest Additions CD Image...

```bash
wget -O - https://raw.githubusercontent.com/txdavec/linux/master/xubuntu.sh | sudo bash
```

### Terminal Preferences: 
- DejaVu Sans Mono powerline font
- General->Unlimited scrollback
- General->Scrollbar disabled
- Advanced->Automatically copy selection to clipboard

### Install VSCode
Extensions:
- Code Spell Checker
- Jinja
- language-Ansible
- One Dark Pro
- Vim
- vscode-icons
