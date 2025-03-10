petalinux-config -p EosMuon.linux/ --get-hw-description ME-XU5-2EG-1I-D11E/ --silentconfig
petalinux-config -p EosMuon.linux/ -c rootfs --silentconfig
cp ptc-firmware/petalinux/configs/system-user.dtsi EosMuon.linux/project-spec/meta-user/recipes-bsp/device-tree/files/
cp -r ptc-firmware/petalinux/recipes/regtest EosMuon.linux/project-spec/meta-user/recipes-apps/
petalinux-build -p EosMuon.linux
petalinux-package -p EosMuon.linux/ --boot --u-boot --fsbl EosMuon.linux/images/linux/zynqmp_fsbl.elf --fpga EosMuon.linux/images/linux/system.bit -o EosMuon.linux/images/linux/BOOT.bin --force
