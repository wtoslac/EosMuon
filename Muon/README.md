# eos/Muon

Previously
I was able to use the Mercury_XU5_PE1 reference design to setup the SoC. The code was written in VHDL. After trying to convert the VHDL to Verilog, it caused other errors in the bitstream because some of the IOs was not able usable in verilog. I made a EosMuon.v which can be instantiated in VHDL instead. I was able to turn the LED on and off using the EosMuon.v.

8/30/2024
I am use EosMuon.v to set some IO high and low to see what happens.

I added D22, D20, D18 and set those values to 1b'0, 1b'1, 1b'z. The outputs are 0, 1.8V, 0 respectively after programming the FPGA on Vitis.

To run this using an SD Card with Petalinux:

Vivado->Export->Export Hardware(include the bitstream) I put the xsa file in /mnt/c/X/ME-XU5-2EG-1I-D11E/
Vivado->Export->Export Bitstream (I put it in the same place as the xsa file.

On the Ubuntu,
cd ~/X #where I am doing all work.
cp -r /mnt/c/X/ME-XU5-2EG-1I-D11E/* ME-XU5-2EG-1I-D11E/
cp -r /mnt/c/X/ME-XU5-2EG-1I-D11E/*.bit ME-XU5-2EG-1I-D11E/
source ../petalinux2022.2/settings.sh
petalinux-create -t project -n EosMuon.linux --template zynqMP
cp 
petalinux-config -p EosMuon.linux/ --get-hw-description Mercury_XU5_PE1/

petalinux-config -p EosMuon.linux/ --get-hw-description Mercury_XU5_PE1/
petalinux-config -p EosMuon.linux/ --get-hw-description ../ME-XU5-2EG-1I-D11E/
petalinux-config -p EosMuon.linux/ -c rootfs
petalinux-build -p EosMuon.linux
petalinux-package -p EosMuon.linux/ --boot --u-boot --fsbl EosMuon.linux/images/linux/zynqmp_fsbl.elf --fpga EosMuon.linux/images/linux/system.bit -o EosMuon.linux/images/linux/BOOT.bin
petalinux-package -p EosMuon.linux/ --boot --u-boot --fsbl EosMuon.linux/images/linux/zynqmp_fsbl.elf --fpga EosMuon.linux/images/linux/system.bit -o EosMuon.linux/images/linux/BOOT.bin --force
lsblk
sudo mount /dev/sdd1 ~/X/BOOT/
sudo mount /dev/sdd2 ~/X/ROOT/
cp EosMuon.linux/images/linux/BOOT.bin EosMuon.linux/images/linux/image.ub EosMuon.linux/images/linux/boot.scr ~/X/BOOT/
sudo cp EosMuon.linux/images/linux/BOOT.bin EosMuon.linux/images/linux/image.ub EosMuon.linux/images/linux/boot.scr ~/X/BOOT/
sudo cp EosMuon.linux/images/linux/rootfs.tar.gz ~/X/ROOT/
cd ~/X/ROOT
ll
gunzip rootfs.tar.gz 
sudo gunzip rootfs.tar.gz 
sudo tar -xvf rootfs.tar 
cd ..
sudo umount ROOT
