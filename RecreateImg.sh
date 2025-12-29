#source ~/Xilinx/PetaLinux/2022.2/bin/settings.sh
### Uncomment for first build.
#petalinux-create -t project -n EosMuon.linux --template zynqMP
#cp petalinux/config EosMuon.linux/project-spec/configs/
#cp petalinux/rootfs_config EosMuon.linux/project-spec/configs/
petalinux-config -p EosMuon.linux/ --get-hw-description EosMuonPL/ --silentconfig
petalinux-config -p EosMuon.linux/ -c rootfs --silentconfig
cp petalinux/system-user.dtsi EosMuon.linux/project-spec/meta-user/recipes-bsp/device-tree/files/
cp -r petalinux/regtest EosMuon.linux/project-spec/meta-user/recipes-apps/
petalinux-build -p EosMuon.linux
petalinux-package -p EosMuon.linux/ --boot --u-boot --fsbl EosMuon.linux/images/linux/zynqmp_fsbl.elf --fpga EosMuon.linux/images/linux/system.bit -o EosMuon.linux/images/linux/BOOT.bin --force
