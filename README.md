# Setup microG
Using microG to replace Google Play service from validating device certification.

## 1. Download microG apks

https://github.com/microg/GmsCore/wiki/Downloads

We need GmsCore.apk and GsfProxy.apk for this project
## 2. Download patch of signature spoofing for Android 11 (R)

https://github.com/lineageos4microg/docker-lineage-cicd/tree/master/src/signature_spoofing_patches

Create new folder **$rootDir/vendor/microG** and put apks and patch into it

## 3. Implement script to build microG
- Create microG.mk to build microG's apps
- Create Android.mk (Android.bp) to include each app and default permission into firmware. 
- Create script to apply patch
   

**Please find source code which implemented these steps under: **vendor/microG****

## 7. Include microG into device's make file

Add the following line into device's make file:

````
$(call inherit-product, vendor/microG/microG.mk)
````

## 8. Apply the patch 

Run following script: 

````
vendor/microG/pathc/apply.sh
````

# Setup MindTheGapps
Using MindTheGapps for Google apps. For this project, we need only Google Play Store.
But we can include more if we want.

## 1. Download MindTheGapps

Download them from: https://gitlab.com/MindTheGapps/vendor_gapps

Select correct branch for Android R (rho).

Create new folder **$rootDir/vendor/gapps** and copy mindthegapps into it.

## 2. Include MindTheGapps into device's make file

Add the following line into device's make file:

````
$(call inherit-product, vendor/gapps/arm64/arm64-vendor.mk)
````

## 3. Remove unneccessary apps

Select and remove unncessary apps from **vendor/gapps/arm64/arm64-vendor.mk** and **vendor/gapps/common/common-vendor.mk**

We need to keep only Phonesky (Google Play Store) and GoogleServicesFramework for this project.

**Please find source code which implemented these step under **vendor/gapps****







