yum -y install epel-release
yum -y groupinstall X11
yum -y groupinstall Xfce Fonts
# so login is gui
systemctl set-default graphical.target
