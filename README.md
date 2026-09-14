# OpenStack Private Cloud Platform

> Production-inspired private cloud platform built with OpenStack, Kolla-Ansible, OpenTofu and Ansible.

[![OpenStack](https://img.shields.io/badge/OpenStack-Private%20Cloud-red)](https://www.openstack.org/)
[![OpenTofu](https://img.shields.io/badge/IaC-OpenTofu-blue)](https://opentofu.org/)
[![Ansible](https://img.shields.io/badge/Automation-Ansible-black)](https://www.ansible.com/)
[![Kubernetes](https://img.shields.io/badge/Workloads-RKE2%20%2F%20Kubernetes-blue)](https://kubernetes.io/)
[![Status](https://img.shields.io/badge/Status-Active%20Development-orange)]()

## What is this?

This project implements a complete private cloud platform designed around OpenStack.

The objective is not simply to install OpenStack, but to build a reproducible platform capable of provisioning compute, networking, storage and complete application environments through Infrastructure as Code and automation.

The platform is designed to evolve from a compact private cloud deployment into a multi-node private cloud without changing the operational model.

## Architecture

The platform separates the management layer from the OpenStack infrastructure.

```text
GitHub
   |
   v
Management Node
OpenTofu / Ansible / OpenStack CLI
   |
   v
OpenStack Private Cloud
   |
   +-- Control Plane
   +-- Network Plane
   +-- Compute Plane
   +-- Storage Plane
   |
   v
Cloud Workloads
Linux / Applications / RKE2 / Kubernetes
```

Detailed architecture:

[Platform Architecture](docs/architecture/01-platform-architecture.md)

## Technology Stack

| Layer | Technologies |
|---|---|
| Cloud Platform | OpenStack |
| Deployment | Kolla-Ansible |
| Infrastructure as Code | OpenTofu |
| Configuration Management | Ansible |
| Compute | Nova, KVM, QEMU, Libvirt |
| Networking | Neutron, OVN |
| Storage | Cinder, Glance |
| Identity | Keystone |
| Web Console | Horizon |
| Containers | Docker |
| Kubernetes Workloads | RKE2 |
| Observability | Prometheus, Grafana |
| Operating System | Ubuntu Server 24.04 |

## Platform Capabilities

The project is designed to cover the complete lifecycle of a private cloud platform:

- Automated OpenStack deployment.
- Reproducible cloud infrastructure.
- Multi-tenant network provisioning.
- Virtual machine lifecycle management.
- Block storage provisioning.
- Image lifecycle management.
- Security groups and network policies.
- Floating IP management.
- Infrastructure provisioning with OpenTofu.
- Post-provisioning configuration with Ansible.
- Kubernetes deployment on OpenStack instances.
- Platform monitoring and capacity visibility.
- Operational validation and troubleshooting.
- Migration from single-node to multi-node architecture.

## Repository Structure

| Path | Purpose |
|---|---|
| `deployment/kolla/` | OpenStack deployment configuration |
| `infrastructure/opentofu/` | OpenStack Infrastructure as Code |
| `infrastructure/ansible/` | Configuration management and automation |
| `platform/` | Platform-level automation |
| `monitoring/` | Prometheus and Grafana integration |
| `examples/linux-vm/` | Linux instance deployment scenario |
| `examples/multi-tier/` | Multi-tier application scenario |
| `examples/kubernetes/` | RKE2/Kubernetes deployment scenario |
| `docs/architecture/` | Platform architecture |
| `docs/networking/` | Network design and implementation |
| `docs/storage/` | Storage architecture |
| `docs/deployment/` | Deployment procedures |
| `docs/operations/` | Operational procedures and troubleshooting |
| `docs/screenshots/` | Platform evidence and screenshots |

## Current Status

The project is currently in the foundation and architecture phase.

| Component | Status |
|---|---|
| Repository structure | Completed |
| Platform architecture | Completed |
| Management node preparation | Completed |
| Kolla-Ansible deployment framework | Completed |
| OpenStack control plane | Planned |
| OpenStack compute | Planned |
| Neutron / OVN networking | Planned |
| Cinder storage | Planned |
| OpenTofu provisioning | Planned |
| Ansible post-provisioning | Planned |
| Linux workload scenario | Planned |
| Multi-tier workload scenario | Planned |
| RKE2 Kubernetes scenario | Planned |
| Prometheus / Grafana observability | Planned |
| Multi-node expansion | Planned |

## Roadmap

### Phase 1 - Platform Foundation

- [x] Prepare the management node.
- [x] Create the repository structure.
- [x] Define the platform architecture.
- [x] Build host validation tooling.
- [x] Create Ansible inventory structure.
- [x] Prepare Kolla-Ansible configuration.

### Phase 2 - OpenStack Core

- [ ] Deploy the OpenStack control plane.
- [ ] Configure Keystone identity.
- [ ] Configure Glance images.
- [ ] Configure Nova compute.
- [ ] Configure Placement.
- [ ] Configure Neutron with OVN.
- [ ] Deploy Horizon.

### Phase 3 - Cloud Infrastructure as Code

- [ ] Configure the OpenTofu OpenStack provider.
- [ ] Build reusable network modules.
- [ ] Build compute modules.
- [ ] Build security group modules.
- [ ] Build storage modules.
- [ ] Provision complete environments from code.

### Phase 4 - Real Workloads

- [ ] Deploy Linux workloads.
- [ ] Deploy a multi-tier application.
- [ ] Automate operating system configuration with Ansible.
- [ ] Deploy an RKE2 Kubernetes cluster on OpenStack.

### Phase 5 - Operations and Observability

- [ ] Integrate Prometheus.
- [ ] Integrate Grafana.
- [ ] Add OpenStack service monitoring.
- [ ] Add capacity and infrastructure dashboards.
- [ ] Document backup and recovery procedures.
- [ ] Build operational validation tooling.

### Phase 6 - Multi-node Private Cloud

- [ ] Separate controller and compute roles.
- [ ] Add additional compute capacity.
- [ ] Validate workload migration scenarios.
- [ ] Document scaling procedures.
- [ ] Evolve the platform towards self-service cloud operations.
