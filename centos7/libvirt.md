# libvirt Setup

```
# command line
yum install qemu-kvm libvirt libvirt-python libguestfs-tools virt-install

# gui
yum install virt-manager

# control
systemctl start libvirtd.service
systemctl stop libvirtd.service
systemctl enable libvirtd.service
systemctl disable libvirtd.service
```
