#!/usr/bin/env bash

# Hackish way to ensure the vm will launch
virsh --connect qemu:///system start win11
virt-manager --connect qemu:///system --show-domain-console win11

exit 0
