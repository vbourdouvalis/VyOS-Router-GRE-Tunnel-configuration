#!/bin/bash

ip tunnel add tun0 mode gre local 147.102.40.69 remote 147.102.7.79
ip link set dev tun0 up
ip addr add 10.0.0.2 dev tun0 peer 10.0.0.1/30
