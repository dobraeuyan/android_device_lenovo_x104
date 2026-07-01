# Inherit framework first
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Inherit from x104 device
$(call inherit-product, device/lenovo/x104/x104.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_tablet_wifionly.mk)

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_GMS_CLIENTID_BASE := android-lenovo
PRODUCT_NAME := lineage_x104
PRODUCT_DEVICE := x104
PRODUCT_BRAND := lenovo
PRODUCT_MANUFACTURER := Lenovo
PRODUCT_MODEL := Lenovo Tab E10
