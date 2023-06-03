#
# Copyright (C) 2020 The Android Open Source Project
# Copyright (C) 2020 The TWRP Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Inherit some common twrp stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/recovery/root,recovery/root) \
	$(LOCAL_PATH)/prebuilt/dtb:dtb.img

# Device specific configs.
$(call inherit-product, device/realme/RMX2117/device.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := RMX2117
PRODUCT_NAME := twrp_RMX2117
PRODUCT_BRAND := realme
PRODUCT_MODEL := Realme Narzo 30 PRO 5G
PRODUCT_MANUFACTURER := realme
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_DEVICE="RMX2117L1"

