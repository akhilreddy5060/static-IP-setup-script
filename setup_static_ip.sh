#..............................................................
#   Title : Script to setup static IP
#   Author :akhil100698@gmail.com
#   Script version : 1.0
#   Description : This script will setup static IP for VM
/usr/bin/bash: line 1: /usr/bin/bash:: No such file or directoryuthor :akhil100698@gmail.com
#   Script version : 1.0
#   Description : This script will setup static IP for VM
#...............................................................

      echo "Enter below values of VM as per plan"
      read -p 'Enter New Hostname to configure for VM: ' VM_hostname
      read -p 'Enter a Static IP to configure for VM: ' Vm_staticip
      read -p 'Enter Gateway IP Address: ' gatway
      echo "we are about setup static ip for vm ....."
      sleep 10
      hostnamectl1 set-hostname $VM_hostname
      cp /etc/hosts /etc/hosts.bak
      echo "$VM_staticip $VM_hostname" >> /etc/hosts
      rm -f /etc/sysconfig/network-scripts/ifcfg-enp0s3.bak
      cp /etc/sysconfig/network-scripts/ifcfg-enp0s3 /etc/sysconfig/network-scripts/ifcfg-ens0s3.bak
      echo -e "IPADDR=$VM_Staticip \nDNS1=$gateway \nDSN2=8.8.8.8 \nGATEWAY=$gateway" >> /etc/sysconfig/network-scripts/ifcfg-enp0s3
      sed -i 's/dhcp/static/' /etc/sysconfig/network-scripts/ifcfg-enp0s3
      sed -i 's/ONBOOT=no/ONBOOT=yes/' /etc/sysconfig/network-scripts/ifcfg-enp0s3
      echo "we have successfully configured VM on static IP"
      sleep 5
      echo " VM will reboot to impact changes and reconnect using new static IP"
      sleep 5
      shutdown -r
