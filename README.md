# WSL dynamic IP mapper to a fix hostname
- The WSL environment changes its IP every time it boots up.
- Testing/running services is problematic with checking and changing the IP address
- Amending the Windows system hosts file is a solution to overcome on this. (your little local DNS server)
# How it works
- Set a hostname binded with an IP address in  ```C:\Windows\System32\drivers\etc\hosts``` (It requires elevated privilegges to edit the file!)
- something like this: ```192.168.171.153         mywslhostname```
- Place the scrip into your WSL environment.
- Edit the script. Change you hosname in line ```OLD_IP=$(sudo cat /mnt/c/Windows/System32/drivers/etc/hosts | grep HOSTNAME_TO_LOOK_FOR |awk '{ print($1)  }')```
- Run your WSL environment with admin privileges (it won't allow to edit the host filesystem without this)
- execute the script and it will change the IP in the windows host system ```hosts``` file
 
