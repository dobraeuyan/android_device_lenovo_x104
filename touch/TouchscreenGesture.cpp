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

#include "TouchscreenGesture.h"

#include <android-base/file.h>
#include <android-base/logging.h>
#include <android-base/strings.h>
#include <android-base/stringprintf.h>

#include <cstdlib>

namespace vendor {
namespace lineage {
namespace touch {
namespace V1_0 {
namespace implementation {

// One software-gated bit per gesture in the GT9110 driver's enable mask
// (drivers/input/touchscreen/GT9110/gt9xx.c). Bit 0 is reserved for the
// double-tap / DT2W path and is never touched here. keycode is the Linux
// scancode the driver reports and the value the LineageParts KeyHandler
// matches against (event.getScanCode()); name maps to the
// touchscreen_gesture_<name>_title string resource in LineageParts.
static constexpr const char kGestureMaskPath[] =
        "/sys/devices/virtual/gesture_mode/tp_gesture_status/gesture_mask";

struct GestureInfo {
    int32_t id;
    const char* name;
    int32_t keycode;  // Linux scancode emitted by the driver
    int32_t maskBit;  // bit in the kernel gesture_mask
};

static const GestureInfo kGestures[] = {
        {0,  "letter_c",               183, 1},   // KEY_F13
        {1,  "letter_o",               184, 2},   // KEY_F14
        {2,  "letter_m",               185, 3},   // KEY_F15
        {3,  "letter_w",               186, 4},   // KEY_F16
        {4,  "letter_s",               187, 5},   // KEY_F17
        {5,  "letter_v",               188, 6},   // KEY_F18
        {6,  "letter_e",               189, 7},   // KEY_F19
        {7,  "one_finger_up_swipe",    190, 8},   // KEY_F20
        {8,  "one_finger_down_swipe",  191, 9},   // KEY_F21
        {9,  "one_finger_left_swipe",  192, 10},  // KEY_F22
        {10, "one_finger_right_swipe", 193, 11},  // KEY_F23
};

Return<void> TouchscreenGesture::getSupportedGestures(getSupportedGestures_cb _hidl_cb) {
    std::vector<Gesture> gestures;
    for (const auto& g : kGestures) {
        gestures.push_back({g.id, g.name, g.keycode});
    }
    _hidl_cb(gestures);
    return Void();
}

Return<bool> TouchscreenGesture::setGestureEnabled(const Gesture& gesture, bool enabled) {
    int32_t bit = -1;
    for (const auto& g : kGestures) {
        if (g.id == gesture.id) {
            bit = g.maskBit;
            break;
        }
    }
    if (bit < 0) {
        LOG(ERROR) << "Unknown gesture id " << gesture.id;
        return false;
    }

    // Read-modify-write: preserve bit 0 (DT2W) and every other gesture's bit,
    // since the driver exposes a single shared mask.
    uint32_t mask = 0xFFFFFFFFu;
    std::string buf;
    if (android::base::ReadFileToString(kGestureMaskPath, &buf)) {
        mask = static_cast<uint32_t>(strtoul(android::base::Trim(buf).c_str(), nullptr, 0));
    }

    if (enabled) {
        mask |= (1u << bit);
    } else {
        mask &= ~(1u << bit);
    }

    const std::string out = android::base::StringPrintf("0x%08x", mask);
    if (!android::base::WriteStringToFile(out, kGestureMaskPath)) {
        LOG(ERROR) << "Failed to write " << kGestureMaskPath;
        return false;
    }

    return true;
}

}  // namespace implementation
}  // namespace V1_0
}  // namespace touch
}  // namespace lineage
}  // namespace vendor
