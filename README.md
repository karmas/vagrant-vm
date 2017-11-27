A centos vagrant setup with xfce gui. The box's username and password are both `vagrant`.

### Requirements
* VirtualBox
* Vagrant
* Cmder to use as terminal
* Xming for X11

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
Copy bash\_profile into home. It sets env var to make vagrant use system binaries.
```
λ cp vagrant-centos/bash_profile $HOME/.bash_profile
```

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
* reload the vm and check file sync works; by default vagrant syncs host directory with guest /vagrant/

### X11 forwarding
* Vagrantfile already is setup to forward x11.
* It is provisioned to install X11 and Fonts groups required for most graphical programs.
* However the local machine should have xming started and the shell should have DISPLAY variable exported.
* Else running graphical programs on vm can give following problem.
```
Can't connect to X11 window server using 'localhost:10.0' as the value of the DISPLAY variable.
```
* Before ssh into vm export following. This has been written to the bash\_profile file.
```
export DISPLAY=localhost:0
```
