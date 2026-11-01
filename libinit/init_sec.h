/*
 * SPDX-FileCopyrightText: The LineageOS Project
 * SPDX-License-Identifier: Apache-2.0
 */

#ifndef INIT_SEC_H
#define INIT_SEC_H

#include <string.h>

enum device_variant {
    VARIANT_A = 0,
    VARIANT_A2360,
    VARIANT_A236B,
    VARIANT_A233C,
    VARIANT_A236E,
    VARIANT_A236M,
    VARIANT_MAX
};

typedef struct {
    std::string model;
    std::string codename;
} variant;

static const variant china_models_a23xq = {
    .model = "SM-A2360",
    .codename = "a23xqzh"
};

static const variant european_models_a23xq = {
    .model = "SM-A236B",
    .codename = "a23xq"
};

static const variant japan_models_a23xq = {
    .model = "SM-A233C",
    .codename = "a23xq"
};

static const variant asia_oceanica_models_a23xq = {
    .model = "SM-A236E",
    .codename = "a23xq"
};

static const variant latino_models_a23xq = {
    .model = "SM-A236M",
    .codename = "a23xq"
};

static const variant *all_variants[VARIANT_MAX] = {
    &china_models_a23xq,
    &european_models_a23xq,
    &japan_models_a23xq,
    &asia_oceanica_models_a23xq,
    &latino_models_a23xq,
};

#endif // INIT_SEC_H
