# Certificate manager

Our `Ingress` controller has support for supplying the `Ingress` resources with server certificates. However, it would be nice if we could automatically have certificates generated for us by Let's Encrypt for `Ingress` resources of our choosing. Not-so-surprisingly, there is a service for just that! It's called [cert-manager](https://github.com/jetstack/cert-manager).


## Install

```yaml
$ kubectl apply -f .
```


## Usage

The manager will look for `Ingress` resources that are annotated with `certmanager.k8s.io/cluster-issuer` and use its value as the issuer. Here is an example:

```yaml
kind: Ingress
apiVersion: networking.k8s.io/v1beta1
metadata:
  name: my-application
  namespace: my-namespace
  annotations:
    kubernetes.io/ingress.class: external
    certmanager.k8s.io/cluster-issuer: letsencrypt
spec:
  rules:
    - host: example.com
      http:
        paths:
          - path: /
            backend:
              serviceName: my-application
              servicePort: 8080
  tls:
    - secretName: my-application-cert
      hosts:
        - example.com
```

The manager will create a secret with the same name as the `Ingress` resource but with the `-cert` suffix. When first creating the `Ingress` resource, your `Ingress` controller might complain that the secret is missing. This will shortly be fixed if the certificate generation process succeeds.
