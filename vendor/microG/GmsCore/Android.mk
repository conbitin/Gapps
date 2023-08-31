###############################################################################
LOCAL_PATH := $(my-dir)


include $(CLEAR_VARS)
LOCAL_MODULE := mGmsCore
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_PRODUCT_MODULE := true
LOCAL_PRIVILEGED_MODULE := true
LOCAL_CERTIFICATE := PRESIGNED
# LOCAL_USES_LIBRARIES := com.android.location.provider
# LOCAL_OPTIONAL_USES_LIBRARIES := org.apache.http.legacy androidx.window.extensions androidx.window.sidecar
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
# $(shell cp $(LOCAL_PATH)/privapp-permissions-mGmsCore.xml $(TARGET_OUT)/product/etc/permissions/)
# $(shell cp $(LOCAL_PATH)/default-permissions-mGmsCore.xml $(TARGET_OUT)/product/etc/default-permissions/)
include $(BUILD_PREBUILT)