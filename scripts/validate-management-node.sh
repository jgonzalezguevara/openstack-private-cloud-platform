#!/usr/bin/env bash

set -uo pipefail

PASS=0
WARN=0
FAIL=0

pass() {
    printf '[PASS] %s\n' "$1"
    ((PASS+=1))
}

warn() {
    printf '[WARN] %s\n' "$1"
    ((WARN+=1))
}

fail() {
    printf '[FAIL] %s\n' "$1"
    ((FAIL+=1))
}

echo
echo "OpenStack Private Cloud Platform"
echo "Management Node Validation"
echo "================================"
echo

echo "HOST"
echo "----"

printf 'Hostname:  %s\n' "$(hostname)"
printf 'Kernel:    %s\n' "$(uname -r)"
printf 'OS:        %s\n' "$(. /etc/os-release && echo "$PRETTY_NAME")"
printf 'Arch:      %s\n' "$(uname -m)"
echo

echo "RESOURCES"
echo "---------"

CPU_COUNT=$(nproc)
MEM_MB=$(free -m | awk '/^Mem:/ {print $2}')
ROOT_FREE_GB=$(df -BG / | awk 'NR==2 {gsub("G","",$4); print $4}')

if (( CPU_COUNT >= 2 )); then
    pass "CPU: ${CPU_COUNT} logical processors"
else
    fail "CPU: only ${CPU_COUNT} logical processor"
fi

if (( MEM_MB >= 2048 )); then
    pass "Memory: ${MEM_MB} MiB"
else
    warn "Memory: only ${MEM_MB} MiB"
fi

if (( ROOT_FREE_GB >= 10 )); then
    pass "Root filesystem: ${ROOT_FREE_GB} GiB free"
else
    warn "Root filesystem: only ${ROOT_FREE_GB} GiB free"
fi

echo
echo "VIRTUALIZATION"
echo "--------------"

if grep -Eq '(vmx|svm)' /proc/cpuinfo; then
    pass "Hardware virtualization supported"
else
    warn "CPU virtualization flags not detected"
fi

if [[ -e /dev/kvm ]]; then
    pass "/dev/kvm available"
else
    warn "/dev/kvm unavailable"
fi

echo
echo "NETWORK"
echo "-------"

DEFAULT_IF=$(ip route show default 2>/dev/null | awk 'NR==1 {print $5}')

if [[ -n "${DEFAULT_IF:-}" ]]; then
    pass "Default interface: ${DEFAULT_IF}"
else
    fail "No default network interface detected"
fi

DEFAULT_GW=$(ip route show default 2>/dev/null | awk 'NR==1 {print $3}')

if [[ -n "${DEFAULT_GW:-}" ]]; then
    pass "Default gateway: ${DEFAULT_GW}"
else
    warn "No default gateway detected"
fi

echo
echo "TOOLING"
echo "-------"

for tool in git python3 ssh docker ansible tofu openstack; do
    if command -v "$tool" >/dev/null 2>&1; then
        pass "$tool installed"
    else
        warn "$tool not installed"
    fi
done

echo
echo "================================"
echo "SUMMARY"
echo "================================"
printf 'PASS: %d\n' "$PASS"
printf 'WARN: %d\n' "$WARN"
printf 'FAIL: %d\n' "$FAIL"
echo

if (( FAIL > 0 )); then
    echo "RESULT: NOT READY"
    exit 1
elif (( WARN > 0 )); then
    echo "RESULT: READY WITH WARNINGS"
    exit 0
else
    echo "RESULT: READY"
    exit 0
fi
