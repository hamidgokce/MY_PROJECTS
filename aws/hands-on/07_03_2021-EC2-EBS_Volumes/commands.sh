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
## AWS console volume modify
Sudo fdisk -l # list of storages
sudo fdisk /dev/xvdg # partition process
Lsblk
sudo mkfs -t ext4 /dev/xvdg1
sudo mkfs -t ext4 /dev/xvdg2
sudo mkdir /mnt/3rd-vol-part1
sudo mkdir /mnt/3rd-vol-part2
sudo mount /dev/xvdg1 /mnt/3rd-vol-part1
sudo mount /dev/xvdg2 /mnt/3rd-vol-part2
Lsblk
cd /mnt/3rd-vol-part2
sudo touch gokcewashere.txt
Ls
## AWS console volume modify 1 ==> 2
sudo growpart /dev/xvdg 2
sudo resize2fs /dev/xvdg2
cd /mnt/3rd-vol-part2
Ls
Sudo reboot now
Lsblk
Cd /etc
Ls
Cat fstab
Sudo cp fstab fstab.bak
Sudo Nano fstab # for permanent changes
<
/dev/xvdf       mnt/mp1   ext4    defaults,nofail        0       0
 /dev/xvdg1      mnt/mp2   ext4  defaults,nofail        0       0
 /dev/xvdg2      mnt/mp3   ext4  defaults,nofail        0       0
>
sudo reboot now
Lsblk




