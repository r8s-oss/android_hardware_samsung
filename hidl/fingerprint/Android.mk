#
# Copyright (C) 2019 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    BiometricsFingerprint.cpp \
    service.cpp

LOCAL_SHARED_LIBRARIES := \
    libbase \
    libhardware \
    libhidlbase \
    liblog \
    libutils \
    android.hardware.biometrics.fingerprint@2.1 \
    android.hardware.biometrics.fingerprint@2.2 \
    android.hardware.biometrics.fingerprint@2.3

ifeq ($(TARGET_SEC_FP_CALL_NOTIFY_ON_CANCEL),true)
    LOCAL_CFLAGS += -DCALL_NOTIFY_ON_CANCEL
endif

ifeq ($(TARGET_SEC_FP_USES_PERCENTAGE_SAMPLES),true)
    LOCAL_CFLAGS += -DUSES_PERCENTAGE_SAMPLES
endif

ifeq ($(TARGET_SEC_FP_CALL_CANCEL_ON_ENROLL_COMPLETION),true)
    LOCAL_CFLAGS += -DCALL_CANCEL_ON_ENROLL_COMPLETION
endif

ifeq ($(TARGET_SEC_FP_HAS_FINGERPRINT_GESTURES),true)
    LOCAL_CFLAGS += -DHAS_FINGERPRINT_GESTURES
endif

ifeq ($(TARGET_SEC_FP_REQUEST_FORCE_CALIBRATE),true)
    LOCAL_CFLAGS += -DREQUEST_FORCE_CALIBRATE
endif

ifeq ($(TARGET_SEC_FP_HAS_OPTICAL_UDFPS),true)
    LOCAL_CFLAGS += -DHAS_OPTICAL_UDFPS
endif

LOCAL_MODULE := android.hardware.biometrics.fingerprint@2.3-service.samsung
LOCAL_INIT_RC := android.hardware.biometrics.fingerprint@2.3-service.samsung.rc
LOCAL_VINTF_FRAGMENTS := android.hardware.biometrics.fingerprint@2.3-service.samsung.xml
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := samsung
LOCAL_VENDOR_MODULE := true

include $(BUILD_EXECUTABLE)

include $(call all-makefiles-under,$(LOCAL_PATH))
