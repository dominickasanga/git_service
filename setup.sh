#!/bin/bash
sudo apt-get install tcpdump   # For Debian/Ubuntu
sudo setcap cap_net_raw,cap_net_admin=eip /usr/bin/tcpdump

