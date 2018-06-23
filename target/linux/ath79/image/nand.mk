include ./common-netgear.mk

define Device/glinet_ar300m_nand
  ATH_SOC := qca9533
  DEVICE_TITLE := GL-AR300M (NAND)
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2 kmod-usb-storage kmod-usb-ledtrig-usbport
  KERNEL_SIZE := 2048k
  BLOCKSIZE := 128k
  PAGESIZE := 2048
  VID_HDR_OFFSET := 512
  IMAGES := factory.ubi sysupgrade.tar
  IMAGE/sysupgrade.tar := sysupgrade-tar
  IMAGE/factory.ubi := append-kernel | pad-to $$$$(KERNEL_SIZE) | append-ubi
endef
TARGET_DEVICES += glinet_ar300m_nand

define Device/netgear_wndr4300
  ATH_SOC := ar9344
  DEVICE_TITLE := NETGEAR WNDR4300 (NAND)
  DEVICE_PACKAGES := kmod-usb-core kmod-usb2 kmod-usb-ledtrig-usbport
  NETGEAR_KERNEL_MAGIC := 0x33373033
  KERNEL := kernel-bin | append-dtb | lzma -d20 | netgear-uImage lzma
  KERNEL_INITRAMFS := kernel-bin | append-dtb | lzma -d20 | netgear-uImage lzma
  NETGEAR_BOARD_ID := WNDR4300
  NETGEAR_HW_ID := 29763948+0+128+128+2x2+3x3
  KERNEL_SIZE := 4096k
  BLOCKSIZE := 128k
  PAGESIZE := 2048
  VID_HDR_OFFSET := 512
  IMAGES := factory.ubi sysupgrade.tar
  IMAGE/sysupgrade.tar := sysupgrade-tar
  IMAGE/factory.ubi := append-kernel | pad-to $$$$(KERNEL_SIZE) | append-ubi | netgear-dni
  SUPPORTED_DEVICES := netgear,wndr4300-v1 wndr4300-v1
endef
TARGET_DEVICES += netgear_wndr4300
