/*
 * Copyright (C) 2019-2020 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define LOG_TAG "vendor.lineage.touch@1.0-service.x104"

#include <android-base/logging.h>
#include <hidl/HidlTransportSupport.h>

#include "TouchscreenGesture.h"

using android::hardware::configureRpcThreadpool;
using android::hardware::joinRpcThreadpool;
using android::OK;
using android::sp;
using android::status_t;

using vendor::lineage::touch::V1_0::ITouchscreenGesture;
using vendor::lineage::touch::V1_0::implementation::TouchscreenGesture;

int main() {
    sp<ITouchscreenGesture> gestureService = new TouchscreenGesture();

    configureRpcThreadpool(1, true /*callerWillJoin*/);

    status_t status = gestureService->registerAsService();
    if (status != OK) {
        LOG(ERROR) << "Could not register ITouchscreenGesture service (" << status << ")";
        return 1;
    }

    LOG(INFO) << "vendor.lineage.touch@1.0 service ready.";
    joinRpcThreadpool();

    LOG(ERROR) << "vendor.lineage.touch@1.0 service exited.";
    return 1;
}
