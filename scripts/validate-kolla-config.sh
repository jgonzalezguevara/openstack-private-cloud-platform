#!/usr/bin/env bash

set -uo pipefail

CONFIG="deployment/kolla/config/globals.yml"

if [[ ! -f "$CONFIG" ]]; then
    echo "[FAIL] Missing $CONFIG"
    exit 1
fi

echo "OpenStack Private Cloud Platform"
echo "Kolla Configuration Validation"
echo "================================"

if grep -q 'REPLACE_ME' "$CONFIG"; then
    echo "[WARN] Kolla configuration still contains hardware placeholders."
    grep -n 'REPLACE_ME' "$CONFIG"
    echo
    echo "RESULT: NOT DEPLOYABLE YET"
    exit 0
fi

echo "[PASS] No placeholders detected."
echo "RESULT: CONFIGURATION READY"
