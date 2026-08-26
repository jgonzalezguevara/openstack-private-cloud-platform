SHELL := /bin/bash

.PHONY: help validate validate-management validate-kolla inventory

help:
	@echo "OpenStack Private Cloud Platform"
	@echo
	@echo "Available targets:"
	@echo "  make validate             Run all platform validations"
	@echo "  make validate-management  Validate the management node"
	@echo "  make validate-kolla       Validate Kolla configuration"
	@echo "  make inventory            Display the Ansible inventory"

validate: validate-management validate-kolla

validate-management:
	@./scripts/validate-management-node.sh

validate-kolla:
	@./scripts/validate-kolla-config.sh

inventory:
	@ansible-inventory \
		-i infrastructure/ansible/inventories/homelab.yml \
		--graph
