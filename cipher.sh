#!/bin/bash

# Removals
rm -rf .repo/local_manifests

# Initialize repo with specified manifest
repo init -u https://github.com/CipherOS/android_manifest.git -b fourteen-qpr --git-lfs

# Clone local_manifests repository
git clone https://github.com/winbo-yml-exe/local_manifests --depth 1 -b main  .repo/local_manifests

# Sync the repositories
/opt/crave/resync.sh

#Private Keys
rm -rf vendor/cipher-priv
git clone https://github.com/shravansayz/private_keys.git -b rise vendor/cipher-priv

export BUILD_USERNAME=winbo.yml
export BUILD_HOSTNAME=crave

#build
source build/envsetup.sh
lunch lineage_gale-ap2a-user
m installclean
m bacon
