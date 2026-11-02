$(call inherit-product, device/qcom/msm8909-common/msm8909.mk)

$(call inherit-product, vendor/lenovo/x104f/x104f-vendor.mk)

TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 1280

$(call inherit-product-if-exists, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)

DEVICE_PACKAGE_OVERLAYS := device/lenovo/x104f/overlay $(DEVICE_PACKAGE_OVERLAYS)

PRODUCT_PACKAGES += \
    X104OverlayFrameworksRes \
    X104OverlaySystemUI

PRODUCT_COPY_FILES += \
    device/lenovo/x104f/audio/mixer_paths_msm8909_pm8916.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_msm8909_pm8916.xml

PRODUCT_COPY_FILES += \
    device/lenovo/x104f/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.qcom \
    device/lenovo/x104f/rootdir/etc/init.device.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.device.rc
