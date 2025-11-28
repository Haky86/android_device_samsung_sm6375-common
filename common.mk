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

# Init Scripts
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.a23xq.rc \
    init.audio.samsung.rc \
    init.nfc.samsung.rc \
    init.qcom.factory.rc \
    init.qcom.rc \
    init.qcom.usb.rc \
    init.qti.display_boot.rc \
    init.samsung.bsp.rc \
    init.samsung.display.rc \
    init.samsung.power.rc \
    init.samsung.rc \
    init.target.rc \
    init.vendor.onebinary.rc \
    init.vendor.rilcommon.rc \
    init.vendor.sysfw.rc \
    ueventd.qcom.rc \
    vendor.samsung.rilchip.qcom.rc

PRODUCT_PACKAGES += \
    init.class_main.sh \
    init.crda.sh \
    init.kernel.post_boot.sh \
    init.kernel.post_boot-blair.sh \
    init.kernel.post_boot-holi.sh \
    init.mdm.sh \
    init.qcom.coex.sh \
    init.qcom.early_boot.sh \
    init.qcom.efs.sync.sh \
    init.qcom.sdio.sh \
    init.qcom.sh \
    init.qcom.usb.sh \
    init.qti.display_boot.sh \
    init.qti.early_init.sh \
    init.qti.kernel.debug.sh \
    init.qti.kernel.debug-blair.sh \
    init.qti.kernel.debug-holi.sh \
    qca6234-service.sh \
    vendor_modprobe.sh

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/init/etc/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom \
    $(COMMON_PATH)/init/etc/fstab.qcom:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.qcom

# Kernel
PRODUCT_ENABLE_UFFD_GC := false

# Libinit
$(call soong_config_set,libinit,vendor_init_lib,//$(COMMON_PATH):libinit_sm6375)

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

PRODUCT_PACKAGES += \
    FrameworkResOverlayCommon \
    FrameworkResOverlaySamsung \
    LineagePartsOverlayCommon \
    LineageSDKOverlayCommon \
    SettingsLibOverlayCommon \
    SettingsOverlayCommon \
    SettingsProviderOverlayCommon \
    SystemUIOverlayCommon \
    TelecommOverlayCommon \
    TelephonyOverlayCommon

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

AB_OTA_UPDATER := false

# Get non-open-source specific aspects
$(call inherit-product, vendor/samsung/sm6375-common/sm6375-common-vendor.mk)
