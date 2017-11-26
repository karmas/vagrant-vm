A centos vagrant setup with xfce gui.

#### [cmder](https://github.com/cmderdev/cmder) mintty issue
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
