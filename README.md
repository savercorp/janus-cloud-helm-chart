# janus-cloud-helm

Janus Cloud Helm Charts

## Add repository

```bash
helm repo add --username <USER_NAME> --password <TOKEN> saver https://gitlab.saver.jp/api/v4/projects/257/packages/helm/stable
```

## Install helm chart

```bash
helm install -n <NAMESPACE> -f values.yaml --generate-name saver/janus-cloud
```

## Publish package

```bash
helm package . --version <VERSION>
helm cm-push janus-cloud-<VERSION>.tgz janus-cloud
```

