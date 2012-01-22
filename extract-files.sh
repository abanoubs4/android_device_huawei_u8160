#!/bin/sh

# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Extract prebuilt libraries (from a CM7 running device) needed for the U8160

DEVICE=u8160

DIRS="
etc/bluetooth
bin
lib/hw
"

for DIR in $DIRS; do
	mkdir -p ../../../vendor/huawei/$DEVICE/proprietary/$DIR
done

FILES="
etc/01_qc.cfg
etc/AudioFilterU8160.csv
etc/pvplayer.cfg
etc/bluetooth/BCM4329.hcd

bin/akmd2
bin/akmd8962
bin/akmd8975
bin/qmuxd
bin/rild

lib/hw/gralloc.msm7k.so
lib/hw/sensors.default.so

lib/libaudioeq.so
lib/libcamera.so
lib/libcm.so
lib/libdiag.so
lib/libdll.so
lib/libdsm.so
lib/libdss.so
lib/libgsdi_exp.so
lib/libgstk_exp.so
lib/libmm-adspsvc.so
lib/libmmgsdilib.so
lib/libmmipl.so
lib/libmmjpeg.so
lib/libmm-omxcore.so
lib/libmmprocess.so
lib/libnv.so
lib/libOmxCore.so
lib/libOmxH264Dec.so
lib/libOmxMpeg4Dec.so
lib/libOmxVidEnc.so
lib/libOmxWmvDec.so
lib/liboncrpc.so
lib/libpbmlib.so
lib/libqcamera.so
lib/libqmi.so
lib/libqueue.so
lib/libril.so
lib/libril-qc-1.so
lib/libril-qcril-hook-oem.so
lib/libwms.so
lib/libwmsts.so
"

for FILE in $FILES; do
    adb pull system/$FILE ../../../vendor/huawei/$DEVICE/proprietary/$FILE
done

chmod 755 ../../../vendor/huawei/$DEVICE/proprietary/bin/*

(cat << EOF) | sed s/__DEVICE__/$DEVICE/g > ../../../vendor/huawei/$DEVICE/$DEVICE-vendor-blobs.mk
# Copyright (C) 2010 The AndroidOpen Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This file is generated by device/huawei/__DEVICE__/extract-files.sh - DO NOT EDIT

# All the blobs necessary for U8160
PRODUCT_COPY_FILES += \\
    vendor/huawei/__DEVICE__/proprietary/etc/01_qc.cfg:system/etc/01_qc.cfg \\
    vendor/huawei/__DEVICE__/proprietary/etc/AudioFilterU8160.csv:system/etc/AudioFilterU8160.csv \\
    vendor/huawei/__DEVICE__/proprietary/etc/pvplayer.cfg:system/etc/pvplayer.cfg \\
    vendor/huawei/__DEVICE__/proprietary/etc/bluetooth/BCM4329.hcd:system/etc/bluetooth/BCM4329.hcd

PRODUCT_COPY_FILES += \\
    vendor/huawei/__DEVICE__/proprietary/bin/akmd2:system/bin/akmd2 \\
    vendor/huawei/__DEVICE__/proprietary/bin/akmd8962:system/bin/akmd8962 \\
    vendor/huawei/__DEVICE__/proprietary/bin/akmd8975:system/bin/akmd8975 \\
    vendor/huawei/__DEVICE__/proprietary/bin/qmuxd:system/bin/qmuxd \\
    vendor/huawei/__DEVICE__/proprietary/bin/rild:system/bin/rild

PRODUCT_COPY_FILES += \\
    vendor/huawei/__DEVICE__/proprietary/lib/hw/gralloc.msm7k.so:system/lib/hw/gralloc.msm7k.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/hw/sensors.default.so:system/lib/hw/sensors.default.so

PRODUCT_COPY_FILES += \\
    vendor/huawei/__DEVICE__/proprietary/lib/libaudioeq.so:system/lib/libaudioeq.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libcamera.so:system/lib/libcamera.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libcamera.so:obj/lib/libcamera.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libcm.so:system/lib/libcm.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libdiag.so:system/lib/libdiag.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libdll.so:system/lib/libdll.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libdsm.so:system/lib/libdsm.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libdss.so:system/lib/libdss.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libgsdi_exp.so:system/lib/libgsdi_exp.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libgstk_exp.so:system/lib/libgstk_exp.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libmm-omxcore.so:system/lib/libmm-omxcore.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libmmgsdilib.so:system/lib/libmmgsdilib.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libmmipl.so:system/lib/libmmipl.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libmmjpeg.so:system/lib/libmmjpeg.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libmmprocess.so:system/lib/libmmprocess.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libnv.so:system/lib/libnv.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libOmxCore.so:system/lib/libOmxCore.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libOmxWmvDec.so:system/lib/libOmxWmvDec.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/liboncrpc.so:system/lib/liboncrpc.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libpbmlib.so:system/lib/libpbmlib.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libqcamera.so:system/lib/libqcamera.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libqmi.so:system/lib/libqmi.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libqueue.so:system/lib/libqueue.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libril.so:system/lib/libril.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libril-qc-1.so:system/lib/libril-qc-1.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libril-qcril-hook-oem.so:system/lib/libril-qcril-hook-oem.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libwms.so:system/lib/libwms.so \\
    vendor/huawei/__DEVICE__/proprietary/lib/libwmsts.so:system/lib/libwmsts.so

EOF

./setup-makefiles.sh
