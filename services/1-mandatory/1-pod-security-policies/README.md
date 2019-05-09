# Pod security policies

Pod security policies is a way of saying how privileged a pod is. It's a good practice to use as low privilege as possible for the pods, but some pods of course needs a higher privilege level. You can read more about pod security policies [here](https://kubernetes.io/docs/concepts/policy/pod-security-policy/).


## Requirements

To use pod security policies, we need to enable a switch to `kube-apiserver`, like this: `--enable-admission-plugins=PodSecurityPolicy`. If you already have enabled admission plugins, simply add `PodSecurityPolicy` to the list (comma separated).


## Using a policy

Kubernetes will find all policies that are allowed to use by looking at the role bindings. If multiple policies are found, the first one in alphabetical order is used. This is why we prefix the restricted policy with a `9` and binding it to the `system:authenticated` group, meaning that it will be used by default for all service accounts.


## Install

```
$ kubectl apply -f .
```
