sudo mount /dev/sda1 /media/wto/BOOT; sudo mount /dev/sda2 /media/wto/ROOT
sudo cp EosMuon.linux/images/linux/BOOT.bin EosMuon.linux/images/linux/image.ub EosMuon.linux/images/linux/boot.scr /media/wto/BOOT/
sudo cp EosMuon.linux/images/linux/rootfs.tar.gz /media/wto/ROOT/
sudo gunzip -f /media/wto/ROOT/rootfs.tar.gz
sudo tar -xvf /media/wto/ROOT/rootfs.tar --directory /mnt/ROOT
sudo cp FPGAHomeDir/* /media/wto/ROOT/home/root/
sudo umount /media/wto/ROOT; sudo umount /media/wto/BOOT
