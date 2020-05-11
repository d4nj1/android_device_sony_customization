# Copyright (C) 2019 AngeloGioacchino Del Regno <kholk11@gmail.com>
#
# ROM specific customization for Sony Open Devices
# PlatformConfig/BoardConfig overrides
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

CUST_PATH := device/sony/customization

# Compilers setup for Q
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_CLANG_VERSION := r353983c

# A/B Incremental update 
TARGET_INCREMENTAL_BLOCK_BASED := true

# Aosp SF
TARGET_USES_AOSP_SURFACEFLINGER := true

# Kernel inline building
BOARD_KERNEL_SEPARATED_DTBO := true
TARGET_COMPILE_WITH_MSM_KERNEL := true
TARGET_KERNEL_SOURCE := kernel/sony/msm-4.14/kernel
TARGET_NEEDS_DTBOIMAGE := false

# Temporary: CnE
DEVICE_MANIFEST_FILE += $(CUST_PATH)/ims/cne/vendor.hw.cneservices.xml

BOARD_VENDOR_SEPOLICY_DIRS += $(CUST_PATH)/ims/cne/sepolicy

# AVB prevents modifications like GAPPS or the dualsim patcher from working.
# It detects these "modified" files and prevent them from being loaded.
# Which results in a broken device, after an OTA reactivates AVB.
# AVB is anyway not useful, since we can't relock our device and everybody with direct hardware access can modify it.
# If we set this variable in the customization repo, it won't get used, since it gets already set in the SODP device trees.
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --set_hashtree_disabled_flag
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 2
