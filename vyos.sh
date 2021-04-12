#!/bin/vbash
source /opt/vyatta/etc/functions/script-template

#Connection to configure terminal
configure

#Creating space for GRE Tunnels and change-mss Policies
set policy route CHANGE-MSS rule 1 set tcp-mss 1360
set policy route change-mss rule 1 protocol tcp
set policy route change-mss rule 1 tcp flags SYN

#Creating GRE Tunnel
set interfaces tunnel tun0 encapsulation gre
set interfaces tunnel tun0 address 10.0.0.1/30
set interfaces tunnel tun0 mtu 1400
set interfaces tunnel tun0 policy route CHANGE-MSS
set interfaces tunnel tun0 local-ip 147.102.7.79
set interfaces tunnel tun0 remote-ip 147.102.40.69

#Commit and save the configuration
commit
save

#Displaying the change
run show interfaces tunnel

exit
