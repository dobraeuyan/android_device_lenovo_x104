LOCAL_PATH := $(call my-dir)

ifneq ($(filter x104f x104f1 x104l x104x,$(TARGET_DEVICE)),)

include $(call all-subdir-makefiles,$(LOCAL_PATH))

endif
