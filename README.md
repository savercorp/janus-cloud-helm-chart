# janus-cloud-helm

Janus Cloud Helm Charts

## Add repository

```bash
helm repo add --username <USER_NAME> --password <TOKEN> saver https://gitlab.saver.jp/api/v4/projects/257/packages/helm/stable
```

## Export to manifest files

```bash
helm fetch saver/janus-cloud
helm template --output-dir <DIRECTORY> janus-cloud-<VERSION>.tgz
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

