# Ansible playbook

This is an Ansible playbook for installing necessary services that [Kubernetes The Right Way](https://github.com/amimof/kubernetes-the-right-way) does not install, for example `keepalived` for high availability and `haproxy` for a load balanced `kube-apiserver` endpoint. This playbook can share the inventory file with Kubernetes The Right Way.


## Running

```shell
$ ansible-playbook --inventory <path-to-inventory> install.yml
```


## Cleaning up

```shell
$ ansible-playbook --inventory <path-to-inventory> cleanup.yml
```
