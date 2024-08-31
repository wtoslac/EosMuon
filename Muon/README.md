# eos/Muon

Previously
I was able to use the Mercury_XU5_PE1 reference design to setup the SoC. The code was written in VHDL. After trying to convert the VHDL to Verilog, it caused other errors in the bitstream because some of the IOs was not able usable in verilog. I made a EosMuon.v which can be instantiated in VHDL instead. I was able to turn the LED on and off using the EosMuon.v.

8/30/2024
I am use EosMuon.v to set some IO high and low to see what happens.

I added D22, D20, D18 and set those values to 1b'0, 1b'1, 1b'z. The outputs are 0, 1.8V, 0 respectively after programming the FPGA on Vitis.

To run this using an SD Card with Petalinux:

Vivado->Export->Export Hardware(include the bitstream) I put the xsa file in /mnt/c/X/ME-XU5-2EG-1I-D11E/<br />
Vivado->Export->Export Bitstream (I put it in the same place as the xsa file.

On the Ubuntu,

cd ~/X #where I am doing all work.

cp -r /mnt/c/X/ME-XU5-2EG-1I-D11E/* ME-XU5-2EG-1I-D11E/

cp -r /mnt/c/X/ME-XU5-2EG-1I-D11E/*.bit ME-XU5-2EG-1I-D11E/

source ../petalinux2022.2/settings.sh

petalinux-create -t project -n EosMuon.linux --template zynqMP

cp ~/ptc.firmware/petalinux/configs/config EosMuon.linux/project-spec/configs/

cp ~/ptc.firmware/petalinux/configs/rootfs_config EosMuon.linux/project-spec/configs/

petalinux-config -p EosMuon.linux/ --get-hw-description ../ME-XU5-2EG-1I-D11E/

On the screen that pops up, double check that Image Packaging Configuration->Root Filesystem type is set to EXT4 SDCard/MMC

petalinux-config -p EosMuon.linux/ -c rootfs

cp ~/ptc.firmware/petalinux/configs/system-user.dtsi EosMuon.linux/project-spec/meta-user/recipes-bsp/device-tree/files/#this shouldn't be needed.

cp -r ~/ptc.firmware/petalinux/recipes/regtest EosMuon.linux/project-spec/meta-user/recipes-apps

cp ~/ptc.firmware/petalinux/configs/user-rootfsconfig EosMuon.linux/project-spec/meta-user/conf/

petalinux-build -p EosMuon.linux

petalinux-package -p EosMuon.linux/ --boot --u-boot --fsbl EosMuon.linux/images/linux/zynqmp_fsbl.elf --fpga EosMuon.linux/images/linux/system.bit -o EosMuon.linux/images/linux/BOOT.bin --force #the force is needed if rebuilding

Since I am running Ubuntu on WSL, I have to recompile the entire Ubuntu OS the first time to install the USB Mass Storage driver and the usbipd tool.

https://github.com/dorssel/usbipd-win/wiki/WSL-support

After getting everything setup on the WSL side, we should be able to mount the USB SD Card reader directly on Ubuntu.

PS C:\Users\wingt> usbipd bind --busid 4-1

PS C:\Users\wingt> usbipd attach --wsl --busid 4-1

wto@yoga716:~$ lsblk

NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS

sda      8:0    0 388.6M  1 disk

sdb      8:16   0     3G  0 disk [SWAP]

sdc      8:32   0     1T  0 disk /snap

                                 /mnt/wslg/distro
                                 
                                 /
                                 
sdd      8:48   1  14.9G  0 disk

├─sdd1   8:49   1   256M  0 part

└─sdd2   8:50   1  14.7G  0 part

Use gparted to create a 256MB FAT32 BOOT partition that's has the property "boot" also.

Use gparted to create an EXT4 partition labelled ROOT with the rest of the space.

sudo mount /dev/sdd1 ~/X/BOOT/

sudo mount /dev/sdd2 ~/X/ROOT/

cp EosMuon.linux/images/linux/BOOT.bin EosMuon.linux/images/linux/image.ub EosMuon.linux/images/linux/boot.scr ~/X/BOOT/

sudo cp EosMuon.linux/images/linux/BOOT.bin EosMuon.linux/images/linux/image.ub EosMuon.linux/images/linux/boot.scr ~/X/BOOT/

sudo cp EosMuon.linux/images/linux/rootfs.tar.gz ~/X/ROOT/

cd ~/X/ROOT

sudo gunzip rootfs.tar.gz 

sudo tar -xvf rootfs.tar 

sudo umount ROOT

sudo umount BOOT

PS C:\Users\wingt> usbipd detach --busid 4-1

Pop the SD Card from the Reader into the PE1. 

Have XTERM open COM6 (in my case) and turn on the PE1. You should see the boot message scroll through and get to the login prompt at the end. The LEDs (done via the PL) should behave as you programmed it.

