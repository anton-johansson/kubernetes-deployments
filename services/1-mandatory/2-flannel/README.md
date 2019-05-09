# flannel

In an empty, vanilla Kubernetes cluster, there is no pod networking available. This means, that there is no way for pods to communicate with eachother. Pod networking is a vital part in order to get a functioning Kubernetes cluster up and running. To achieve pod networking you need to install some kind of application or plug-in that implements the Kubernetes networking model. There is a lot of different implementations out there, many of which you can find [here](https://kubernetes.io/docs/concepts/cluster-administration/networking/).

flannel is maybe the simplest implementation and easiest to get started with and many people have reported success with it according to the Kubernetes documentation. We've chosen flannel here for those reasons and it meets the requirements of what we want to achieve.


## Install

```shell
$ kubectl apply -f .
```
