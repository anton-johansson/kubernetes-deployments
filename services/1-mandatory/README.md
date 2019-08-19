# Mandatory services

Mandatory services are required to actually run anything properly in the cluster. It's not required to run exactly these services, but it's required to have them or an alternative to them. The order of them is also important, since we add security policies that needs to apply on all pods and we create pod networking which is required by all pods. DNS may or may not be required by pods.


## Services

* [Pod security policies](./1-pod-security-policies)
* [flannel](./2-flannel)
* [CoreDNS](./3-coredns)
* [NGINX ingress controller](./4-nginx-ingress-controller)
