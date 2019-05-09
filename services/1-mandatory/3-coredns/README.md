# CoreDNS

In a vanilla cluster with pod networking enabled, pods will be able to communicate with eachother, the network that is hosting the cluster and the Internet (if the network has access to the Internet, of course). However, they won't be able to perform DNS-lookups. They can't find eachother by service names, they can't find anything on the network by hostname and they can't find anything on the Internet by hostname. Sure, you can run your cluster without DNS-lookups, but we should consider DNS lookups a vital part of the cluster. For that to work, we need to enable a DNS plug-in. The defacto-standard plug-in is [CoreDNS](https://github.com/coredns/coredns). The plug-in will ensure that pods can find eachother, services, hostnames on the network and hostnames on the Internet.


## Install

```
$ kubectl apply -f .
```


## Notes

We've disabled DNS for pods in this configuration. Querying pods directly (instead of using a service in front) feels like bad practice and should be avoided. If you want to enable this, simply modify `20-config.yaml` (see `pods disabled`).
