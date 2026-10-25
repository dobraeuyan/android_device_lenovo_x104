$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

$(call inherit-product, device/lenovo/x104f/x104f.mk)

$(call inherit-product, vendor/lineage/config/common_full_tablet_wifionly.mk)

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_GMS_CLIENTID_BASE := android-lenovo
PRODUCT_NAME := lineage_x104f
PRODUCT_DEVICE := x104f
PRODUCT_BRAND := lenovo
PRODUCT_MANUFACTURER := Lenovo
PRODUCT_MODEL := Lenovo Tab E10
