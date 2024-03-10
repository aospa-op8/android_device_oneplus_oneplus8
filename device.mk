DEVICE_PATH := device/oneplus/oneplus8

# A/B
ENABLE_VIRTUAL_AB := true
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES +=
    update_engine \
    update_engine_client \
    update_engine_sideload \
    update_verifier \
    android.hardware.boot@1.1-impl-qti \
    android.hardware.boot@1.1-impl-qti.recovery \
    android.hardware.boot@1.1-service

# API
BOARD_API_LEVEL := 30
BOARD_SHIPPING_API_LEVEL := 30
PRODUCT_SHIPPING_API_LEVEL := $(SHIPPING_API_LEVEL)
SHIPPING_API_LEVEL := 30

# Architecture
TARGET_BOARD_PLATFORM := kona
TARGET_BOOTLOADER_BOARD_NAME := kona

# AVB
BOARD_AVB_ENABLE := true

# Biometrics
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.qcom.bluetooth.soc=hastings \
	ro.sf.lcd_density=560

# Camera
PRODUCT_PACKAGES += \
    camera.device@3.2-impl
    camera.device@1.0-impl
    android.hardware.camera.provider@2.4-impl
    android.hardware.camera.provider@2.4-service_64

# Chipset
PRODUCT_PROPERTY_OVERRIDES += \
    ro.soc.model=SM8250

# Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Filesystem
PRODUCT_PACKAGES += fs_config_files

# FM
BOARD_HAVE_QCOM_FM := false

# GSI
$(call inherit-product, build/make/target/product/gsi_keys.mk)

# Init
PRODUCT_COPY_FILES += $(DEVICE_PATH)/init/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.target.rc \
    init.qti.dcvs.sh

# Incremental FS 
PRODUCT_PROPERTY_OVERRIDES += ro.incremental.enable=1

# Kernel
TARGET_KERNEL_VERSION := 4.19
KERNEL_LLVM_SUPPORT := true
KERNEL_SD_LLVM_SUPPORT := true

# Lights
PRODUCT_PACKAGES += android.hardware.lights-service.qti

# Manifests
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml

# Partitions - Dynamic
BOARD_DYNAMIC_PARTITION_ENABLE ?= true
PRODUCT_BUILD_ODM_IMAGE := true
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# Partitions - FRP
BOARD_FRP_PARTITION_NAME := frp

# Partitions - Vendor
ENABLE_VENDOR_IMAGE := true

# QRTR
PRODUCT_PACKAGES += \
    qrtr-ns \
    qrtr-lookup \
    libqrtr

# QSSI configuration
TARGET_USES_QSSI := true

# RRO configuration
TARGET_USES_RRO := true

# Storage
PRODUCT_CHARACTERISTICS := nosdcard

# QTI Components
TARGET_COMMON_QTI_COMPONENTS := \
    adreno \
    alarm \
    audio \
    av \
    bt \
    display \
    gps \
    init \
    media \
    nfc \
    overlay \
    perf \
    telephony \
    usb \
    vibrator \
    wfd \
    wlan
