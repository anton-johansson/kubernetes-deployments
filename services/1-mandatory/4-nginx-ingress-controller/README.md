# NGINX ingress controller

We use NGINX ([Kubernetes own one](https://github.com/kubernetes/ingress-nginx), not the [NGINX Inc. one](https://github.com/nginxinc/kubernetes-ingress) as our [Ingress controller](https://kubernetes.io/docs/concepts/services-networking/ingress-controllers/). The Ingress controller is required to actually handle `Ingress` resources within the clusters. The NGINX ingress controller finds all `Ingress` resources and builds an `nginx.conf` from that. The idea is to route all HTTP traffic to nodes which have this controller and the controller will in turn route traffic to the appropriate pods.


## Controlling network traffic

To be able to set up proper domain records, we need to know which nodes that will actually run the NGINX controller. If we scale up with more nodes, we don't want to bother with changing the DNS-records. To know which nodes that will actually run the controller, we will label two nodes with `kubernetes.io/role=nginx` by using the following command:

```shell
$ kubectl label node <nodeName> kubernetes.io/role=nginx
```

Then we will utilize a `DaemonSet` resource with a node selector rule. This will cause the `DaemonSet` to place one pod on each of the labelled nodes.


## Internal vs external traffic

For proper isolation, we want to route internal traffic to one Ingress controller and external traffic to another Ingress controller. This is better for security. We will not have to enforce IP whitelists on the internal services (which is easy to forget, causing exposure of internal services) and it's also lets us route traffic on two different virtual IP addresses and we can make it technically impossible to reach internal services from the Internet. External services will have public DNS records pointing to the IP addresses of the external Ingress controllers, while internal services will have **internal DNS records** pointing to the IP addresses of the internal Ingress controllers. This way, there will be no way to access the internal services from the Internet.


## High availability

We want to be able to perform maintenance work on the nodes that hosts the Ingress controllers. For this we need a tool that manages our virtual IP addresses. Each Ingress node will have `keepalived` installed on them, that generates two virtual IP addresses. We will configure them as Active/Active, causing them to have eachother as backups. So if we take one node down, `keepalived` on the other node will take over the first nodes IP addresses. We can then point our DNS records to both of these IP addresses.


## Install

```shell
$ kubectl apply -f .
```

The example manifest above expects two labelled nodes for Ingress with the following IP addresses:

| Node           | IP address  | Virtual IP address for external traffic | Virtual IP address for internal traffic |
| -------------- | ----------- | --------------------------------------- | --------------------------------------- |
| `k8s-nginx-10` | `10.0.0.10` | `10.0.0.110`                            | `10.0.0.210`                            |
| `k8s-nginx-11` | `10.0.0.11` | `10.0.0.111`                            | `10.0.0.211`                            |

These IP addresses can of course be changed to any IP of your liking, as long as you use two separate IP addresses for internal and external.
