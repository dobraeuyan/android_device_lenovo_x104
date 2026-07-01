# inherit from msm8909-common
-include device/qcom/msm8909-common/BoardConfigCommon.mk

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/lenovo/x104/bluetooth

# DT2W
TARGET_TAP_TO_WAKE_NODE := /sys/devices/virtual/gesture_mode/tp_gesture_status/gesture

# Filesystem
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2583691264
BOARD_VENDORIMAGE_PARTITION_SIZE := 1719664640
BOARD_USERDATAIMAGE_PARTITION_SIZE := 10923514368
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456

# Kernel
TARGET_KERNEL_ADDITIONAL_CONFIG := lineage_x104_defconfig
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive

# OTA
TARGET_OTA_ASSERT_DEVICE := X104F,x104

# Properties
TARGET_SYSTEM_PROP += device/lenovo/x104/system.prop

# Recovery
TARGET_RECOVERY_FSTAB := device/lenovo/x104/rootdir/etc/recovery.fstab
TARGET_RECOVERY_DEFAULT_ROTATION := ROTATION_RIGHT

# SELinux
BOARD_SEPOLICY_DIRS += device/lenovo/x104/sepolicy

