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

# FM
BOARD_HAVE_QCOM_FM := false

# Libinit
$(call soong_config_set,libinit,vendor_init_lib,//$(COMMON_PATH):libinit_sm6375)

# Telephony
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/samsung/sm6375-common/sm6375-common-vendor.mk)
