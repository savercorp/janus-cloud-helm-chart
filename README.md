# janus-cloud-helm-chart

[Janus Cloud](https://github.com/OpenSight/janus-cloud) brings you scalablity of [Janus Gateway](https://janus.conf.meetecho.com).  
This helm chart is made to run Janus Cloud on Kubernetes.

## System Composition

![deployment diagram](./deployment-diagram.svg)

## Ecosystem

### Docker Image

- [saverops/janus-cloud](https://hub.docker.com/r/saverops/janus-cloud)
- [saverops/janus-gateway](https://hub.docker.com/r/saverops/janus-gateway)

![package-diagram](./package-diagram.svg)

### Sub Chart

- [savercorp/coturn-helm-chart](https://github.com/savercorp/coturn-helm-chart)

## Prerequisites

- [Helm](https://helm.sh) is installed
- ingress-controller is installed

If you are using Docker Desktop, you can install ingress-nginx as ingress-controller by following [quick start](https://kubernetes.github.io/ingress-nginx/deploy/#quick-start).

```bash
helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx --create-namespace
```

## Installation

You can install it by one line:

```bash
helm upgrade --install janus-cloud janus-cloud \
  --repo https://savercorp.github.io/helm-charts
```

Or step by step:

```bash
helm repo add saver https://savercorp.github.io/helm-charts
helm install janus-cloud saver/janus-cloud
```

## Contributing

Please read through our [contributing guidelines](/CONTRIBUTING.md).
