# CONTRIBUTING

## Install from local source

Clone the repository and execute in the repository.

```bash
helm install janus-cloud .
```

## Update dependencies

Rebuild the charts/ directory based on the Chart.lock file.

```bash
helm dependency build
```

## Test

Install from local source and test connection.

```bash
helm install janus-cloud .
helm test janus-cloud
```

## Versioning

Follow semantic versioning 2.

Edit `Chart.yaml`.

```yaml
...
version: 1.2.3 # Chart version
...
appVersion: "0.8.0" # Janus Cloud version
...
```

Create git tag.

```bash
git tag v1.2.3
git push origin v1.2.3
```
