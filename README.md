<img src="https://raw.githubusercontent.com/kubernetes/kubernetes/master/logo/logo.svg?sanitize=true" height="180" align="right" />

# Kubernetes deployments

This repository contains a bunch of deployments that forms a very sophisticated Kubernetes cluster with everything from ingress controllers and DNS to monitoring, metrics and authentication.


## Purpose

Most resources on the Internet describes how to use various tools with a cloud environment. It's hard to find resources regarding bare metal installations and how to get started with a good cluster design. The purpose of this repository is to give a good view of how deployments of a good bare metal Kubernetes cluster can look like. It's important to remember that this is examples. Some parts can be used as it is, and some parts must be modified for your organization.


## Important

There are many small but yet important things to consider when designing a good cluster state.

* Be consistent with your labels. We'll be using labels to identify services in our metrics/logging service, so we'll have to keep a consistent naming convention of these.
* Include a Logstash pipeline configuration for all new services. Include logging as a part of your development process. Skipping proper Logstash pipelines will cause havoc in your Kibana and it will be very hard to navigate the logs. Always write unit tests for these Logstash pipelines to make sure you never break them.
* Be careful with your logging Elasticsearch data. Make sure you get the right types for them, because it can be tricky to change them.


## Pre-requisites

This repository expects that you have a completely empty, vanilla, bare metal Kubernetes cluster. It works perfectly with [Kubernetes The Right Way](https://github.com/amimof/kubernetes-the-right-way), which uses Ansible to initialize a vanilla bare metal cluster. This repository also utilizes Ansible to set up various tools on top of the cluster and it can even re-use the same Ansible inventory file, which makes them a perfect match.


## Installing cluster

This example installs the cluster with Kubernetes The Right Way with additional tools (found under [`ansible/`](./ansible)). Both uses Ansible and can share the same inventory file. See [`ansible-inventory`](./ansible-inventory) for an example inventory file.

```shell
$ ansible-playbook --inventory ~/projects/kubernetes-deployments/ansible-inventory ~/projects/kubernetes-deployments/ansible/install.yaml
$ ansible-playbook --inventory ~/projects/kubernetes-deployments/ansible-inventory ~/projects/kubernetes-the-right-way/install.yml
```

The sample Ansible inventory file contains some things that you may want to tweak to your preferences:

* `cluster_name`
* Hostnames of all hosts
* The `network_interface` variable of the `nginx` hosts. This is required by `keepalived` to properly watch the network interfaces.


## License

This project is distributed under the [MIT license](https://opensource.org/licenses/MIT).
