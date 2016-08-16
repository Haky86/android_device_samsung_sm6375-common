#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

COMMON_PATH := device/samsung/sm6375-common

# 64 Bit
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# AAPT
PRODUCT_CHARACTERISTICS := nosdcard

# Libinit
$(call soong_config_set,libinit,vendor_init_lib,//$(COMMON_PATH):libinit_sm6375)

# Telephony
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/samsung/sm6375-common/sm6375-common-vendor.mk)
