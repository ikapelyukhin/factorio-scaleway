# Factorio Scaleway

This repo provides Terraform plan and Ansible playbook to provision and deprovision Factorio server.

It is half-baked at the moment and needs a bit of extra work, e.g.:
 * add systemd service;
 * create non-privileged user
 * make sure that fetching the save works when deprovisioning.
