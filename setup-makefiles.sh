#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0

set -e

DEVICE=x104f
VENDOR=lenovo
DEVICE_COMMON=x104f

MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$MY_DIR" ]]; then MY_DIR="$PWD"; fi

LINEAGE_ROOT="$MY_DIR"/../../..

HELPER="$LINEAGE_ROOT"/vendor/lineage/build/tools/extract_utils.sh
if [ ! -f "$HELPER" ]; then
    echo "Unable to find helper script at $HELPER"
    exit 1
fi
. "$HELPER"

setup_vendor "$DEVICE" "$VENDOR" "$LINEAGE_ROOT" true

write_headers "x104f x104f1 x104l x104x"

write_makefiles "$MY_DIR"/proprietary-files.txt true

write_footers
