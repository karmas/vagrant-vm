# vagrant ssh -- -v
# 
# OpenSSH_7.5p1, OpenSSL 1.0.2l  25 May 2017   <-- uses vagrant's ssh which doesn't recognize stdin as a terminal
# Pseudo-terminal will not be allocated because stdin is not a terminal.
#
# Copy this file to $CMDER_ROOT/config/profile.d/
# setting this variable allows mintty's ssh to be used
export VAGRANT_PREFER_SYSTEM_BIN=1
