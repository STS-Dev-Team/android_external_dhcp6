# Copyright 2006 The Android Open Source Project
ifneq ($(TARGET_SIMULATOR),true)

LOCAL_PATH:= $(call my-dir)

etc_dir := $(TARGET_OUT)/etc/widedhcp
hooks_dir := widedhcp-hooks
hooks_target := $(etc_dir)/$(hooks_dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := addrconf.c auth.c base64.c getifaddrs.c common.c config.c dhcp6c.c dhcp6c_ia.c dhcp6c_script.c dhcp6_ctl.c if.c lease.c prefixconf.c timer.c cftoken.c cfparse.c
LOCAL_C_INCLUDES := $(KERNEL_HEADERS) -I./includes/
LOCAL_SHARED_LIBRARIES := libc libcutils
LOCAL_MODULE = dhcp6c
LOCAL_MODULE_TAGS := optional
include $(BUILD_EXECUTABLE)

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/dhcp6c.wlan0.stateless.conf:/system/etc/dhcp6c/dhcp6c.wlan0.stateless.conf \
	$(LOCAL_PATH)/dhcp6c.wlan0.stateful.conf:/system/etc/dhcp6c/dhcp6c.wlan0.stateful.conf

endif
