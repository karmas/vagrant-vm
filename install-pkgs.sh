yum -y install kernel-devel # needed for virtualbox guest additions
yum -y groupinstall 'development tools'
yum -y install epel-release # needed for many packages e.g. tmux xfce
yum -y install tmux vim
yum -y groupinstall X11
