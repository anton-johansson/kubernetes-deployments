# Services

This directory contains Kubernetes deployments for all services in the cluster. The services are devided into separate sections, depending on the necessity of them.


## [Mandatory](./1-mandatory)

Mandatory services are required to actually run anything properly in the cluster. It's not required to run exactly these services, but it's required to have them or an alternative to them. The order of them is also important, since we f$

* [Pod security policies](./1-mandatory/1-pod-security-policies)
* [flannel](./1-mandatory/2-flannel)
* CoreDNS
* NGINX ingress controller


## [Essential](./2-essential)

Essential services aren't required to have a working cluster, but without them you won't be able to do much of the things that you probably want to do.

* Authentication
* Certificate manager
* Dynamic storage provider
* Descheduler


## [Nice-to-have](./3-nice-to-have)

Nice-to-have services are neither mandatory or essential, but they do give you a good way of overviewing your cluster.

* Logs (the ELK stack)
* Monitoring (Prometheus and Grafana)
* Kubernetes web dashboard
