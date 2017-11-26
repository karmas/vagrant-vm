# needed for virtualbox guest additions
yum -y install kernel-devel

yum -y groupinstall 'development tools'

# needed for xfce
yum -y install epel-release

yum -y install tmux vim

if [ "$gui" = true ]; then
  # gui
  yum -y groupinstall X11
  yum -y groupinstall Xfce Fonts
  # login gui
  sudo systemctl set-default graphical.target
fi
