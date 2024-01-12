#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

INSTALLED_KERNEL_TARGET := $(PRODUCT_OUT)/kernel
recovery_uncompressed_ramdisk := $(PRODUCT_OUT)/ramdisk-recovery.cpio

RECOVERY_FIRMWARE_TARGETS := \
    a619_gmu.bin \
    a660_gmu.bin \
    apnv11.bin \
    crnv21.bin \
    dax_param.bin \
    lx891rs_a23xq_ltps.bin \
    multical.bin \
    nt36672_a23_csot.bin \
    nt36672_a23_csot_mp.bin \
    ois_mcu_stm32g_fw.bin \
    td4375_a23xq_boe.bin \
    td4375_a23xq_tianma.bin

INSTALLED_RECOVERY_FIRMWARE_TARGETS := $(RECOVERY_FIRMWARE_TARGETS:%=$(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware/%)
$(INSTALLED_RECOVERY_FIRMWARE_TARGETS): $(INSTALLED_KERNEL_TARGET)
	echo -e ${CL_GRN}"Copying touchscreen firmware to recovery"${CL_RST}
	@mkdir -p $(dir $@)
	cp $(@F:%=$(TARGET_OUT_VENDOR)/firmware/%) $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware/

$(recovery_uncompressed_ramdisk): $(INSTALLED_RECOVERY_FIRMWARE_TARGETS)
