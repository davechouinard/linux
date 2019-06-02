## VNC Setup

```
# as root
yum -y groupinstall "X Window System"
yum -y install tigervnc-server
```

```
# as user
vncpasswd
vncserver
vncserver -kill :1
cat << "EOF" > .vnc/xstartup
#!/bin/sh

unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
##/etc/X11/xinit/xinitrc
openbox
vncserver -kill $DISPLAY
EOF
```
