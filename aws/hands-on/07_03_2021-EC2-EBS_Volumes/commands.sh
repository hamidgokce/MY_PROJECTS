Lsblk # show storages
sudo file -s /dev/xvdf # storages file structure
sudo mkfs -t ext4 /dev/xvdf # format
sudo file -s /dev/xvdf
sudo mkdir /mnt/2nd-vol/ # new directory
sudo mount /dev/xvdf /mnt/2nd-vol # mount process
Lsblk
Df -h
cd /mnt/2nd-vol/
sudo touch hamidwashere.txt
Ls
## AWS console volume modify
Lsblk
Df -h
sudo resize2fs /dev/xvdf
Lsblk
Df -h
sudo reboot now
Lsblk
Df -h
sudo mount /dev/xvdf /mnt/2nd-vol/
Lsblk
Df -h


