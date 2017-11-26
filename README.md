A centos vagrant setup with xfce gui. The box's username and password are both `vagrant`.

### Requirements
* VirtualBox
* Vagrant
* Cmder to use as terminal

### Cmder mintty issue
When using mintty, `vagrant ssh` might fail because vagrant's ssh maynot recognize stdin as a terminal.
```
# vagrant ssh -- -v
# 
# OpenSSH_7.5p1, OpenSSL 1.0.2l  25 May 2017
# Pseudo-terminal will not be allocated because stdin is not a terminal.
```
However mintty's ssh might work fine.
```
λ ssh vagrant@127.0.0.1 -p 2222
vagrant@127.0.0.1's password:
[vagrant@cent ~]$
```
Copy cmder-mintty-profile.sh into $CMDER_ROOT/config/profile.d/ so vagrant uses cmder's ssh.

### VirtualBox guest additions
Needed for syncing folders, full screen gui and more.

Steps in host:
* Shutdown the vm.
* Start VirtualBox.
* Add a cdrom drive.
* Load the guest additions cd from VirtualBox installation folder (it can be loaded later via gui).
Steps in guest:
* mount the drive
```
[vagrant@cent ~]$ sudo mount /dev/cdrom /mnt
mount: /dev/sr0 is write-protected, mounting read-only
```
* kernel headers are required which have been provisioned in the vagrant file; for reference below
```
yum -y install kernel-devel # needed for virtualbox guest additions
yum -y groupinstall 'development tools'
```
* run the installer
```
[vagrant@cent mnt]$ sudo sh ./VBoxLinuxAdditions.run
```
* this message is fine
```
VirtualBox Guest Additions: modprobe vboxsf failed
```
* unmount the drive; will be unmounted when vm is shutdown
```
sudo umount /mnt
```
* reload the vm and check file sync works
