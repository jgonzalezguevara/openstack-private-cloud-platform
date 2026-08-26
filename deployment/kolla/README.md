# Kolla-Ansible Deployment

This directory contains the deployment configuration for the OpenStack private cloud.

The management node does not host the OpenStack control plane.

OpenStack node-specific values such as management interfaces, external network interfaces and addresses are intentionally not hardcoded until the target infrastructure is available.

## Files

- `config/globals.yml` - Base Kolla-Ansible configuration.
- `inventory/` - Kolla inventory files.
- `examples/` - Reference deployment examples.

## Pending Hardware Values

The following values must be defined when the OpenStack host becomes available:

- Management interface.
- External/provider network interface.
- OpenStack internal VIP.
- Node management address.
- Storage layout.
- Compute capacity.
