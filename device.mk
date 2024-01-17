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

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# API
BOARD_API_LEVEL := 30
BOARD_SHIPPING_API_LEVEL := 30
PRODUCT_SHIPPING_API_LEVEL := $(SHIPPING_API_LEVEL)
SHIPPING_API_LEVEL := 30

# Architecture
TARGET_BOARD_PLATFORM := kona
TARGET_BOOTLOADER_BOARD_NAME := kona

# Authsecret
PRODUCT_PACKAGES += \
    android.hardware.authsecret@1.0.vendor

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
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service_64 \
    vendor.qti.hardware.camera.postproc@1.0.vendor

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml

# Chipset
PRODUCT_PROPERTY_OVERRIDES += \
    ro.soc.model=SM8250

# Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Device ID attestation
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.device_id_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_id_attestation.xml

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm-service.clearkey \
    android.hardware.drm@1.3.vendor

# Filesystem
PRODUCT_PACKAGES += fs_config_files

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

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

# Net
PRODUCT_PACKAGES += \
    android.system.net.netd@1.1.vendor

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
    keymaster \
    media \
    nfc \
    overlay \
    perf \
    telephony \
    usb \
    vibrator \
    wfd \
    wlan

# Sensors
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_11/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_9/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml

PRODUCT_PACKAGES += \
    android.hardware.sensors@2.0-service.multihal \
    libsensorndkbridge

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# Storage
PRODUCT_CHARACTERISTICS := nosdcard

# TrustedUI
PRODUCT_PACKAGES += \
    android.hidl.memory.block@1.0.vendor \
    vendor.qti.hardware.systemhelper@1.0.vendor