# inherit from msm8909-common
$(call inherit-product, device/qcom/msm8909-common/msm8909.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += device/lenovo/x104/overlay

# Bootanimation
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 1280

# Dalvik
$(call inherit-product-if-exists, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)

# Display
PRODUCT_AAPT_CONFIG := tvdpi mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

# Gestures
PRODUCT_COPY_FILES += \
    device/lenovo/x104/keylayout/goodix-ts.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/goodix-ts.kl
PRODUCT_PACKAGES += \
    vendor.lineage.touch@1.0-service.x104

# Rootdir
PRODUCT_COPY_FILES += \
    device/lenovo/x104/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.qcom \
    device/lenovo/x104/rootdir/etc/init.carrier.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.carrier.rc
