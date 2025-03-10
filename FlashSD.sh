sudo mount /dev/sdd1 /mnt/BOOT; sudo mount /dev/sdd2 /mnt/ROOT
sudo cp EosMuon.linux/images/linux/BOOT.bin EosMuon.linux/images/linux/image.ub EosMuon.linux/images/linux/boot.scr /mnt/BOOT/
sudo cp EosMuon.linux/images/linux/rootfs.tar.gz /mnt/ROOT/
sudo gunzip -f /mnt/ROOT/rootfs.tar.gz
sudo tar -xvf /mnt/ROOT/rootfs.tar --directory /mnt/ROOT
sudo umount /mnt/ROOT; sudo umount /mnt/BOOT
