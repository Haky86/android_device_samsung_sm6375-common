#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

COMMON_PATH := device/samsung/sm6375-common

# 64 Bit
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# AAPT
PRODUCT_CHARACTERISTICS := nosdcard

# Android Verified Boot
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml

# API
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.se.omapi.ese.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.ese.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.sd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.sd.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.uicc.xml

# Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Data Services
$(call inherit-product, vendor/qcom/opensource/dataservices/dataservices_vendor_product.mk)

# DebugFS
PRODUCT_SET_DEBUGFS_RESTRICTIONS := true

# Display
$(call soong_config_set,qtidisplay,gralloc_handle_has_reserved_size,true)

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd

TARGET_BOARD_FASTBOOT_INFO_FILE := $(COMMON_PATH)/fastboot-info.txt

# HWUI
TARGET_USES_VULKAN := true

# Kernel
PRODUCT_ENABLE_UFFD_GC := false

# Libinit
$(call soong_config_set,libinit,vendor_init_lib,//$(COMMON_PATH):libinit_sm6375)

# Partitions
$(call inherit-product, hardware/qcom-caf/common/common.mk)
$(call soong_config_set,rfs,mpss_firmware_symlink_target,firmware_modem)

PRODUCT_PACKAGES += \
    vendor_dsp_mountpoint \
    vendor_firmware_mnt_mountpoint \
    vendor_firmware-modem_mountpoint

PRODUCT_USE_DYNAMIC_PARTITIONS := true

# QMI
TARGET_FWK_SUPPORTS_FULL_VALUEADDS := true

# Ramdisk
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)

# Recovery
PRODUCT_PACKAGES += \
    init.recovery.qcom.rc

# Soong Namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(COMMON_PATH) \
    bootable/deprecated-ota \
    hardware/samsung

# Storages
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Telephony
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Updater
$(call inherit-product, $(SRC_TARGET_DIR)/product/non_ab_device.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/samsung/sm6375-common/sm6375-common-vendor.mk)
