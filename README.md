# janus-cloud-helm

Janus Cloud Helm Charts

## Prerequisites

- ingress-controller is installed

If you are using Docker Desktop, you can install ingress-controller by following [quick start](https://kubernetes.github.io/ingress-nginx/deploy/#quick-start).

```bash
helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
    --namespace ingress-nginx --create-namespace
```

## Installation

```bash
helm repo add saver https://savercorp.github.io/helm-charts
helm dependency update
helm install -n <NAMESPACE> -f values.yaml --generate-name saver/janus-cloud
```

## Export to manifest files

```bash
helm fetch saver/janus-cloud
helm template --output-dir <DIRECTORY> janus-cloud-<VERSION>.tgz
```
