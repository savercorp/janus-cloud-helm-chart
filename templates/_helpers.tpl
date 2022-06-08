{{/*
Expand the name of the chart.
*/}}
{{- define "janus-proxy.name" -}}
{{- default .Chart.Name .Values.nameOverride.janusProxy | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "janus-gateway.name" -}}
{{- default .Chart.Name .Values.nameOverride.janusGateway | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "janus-proxy.fullname" -}}
{{- if .Values.fullnameOverride.janusProxy }}
{{- .Values.fullnameOverride.janusProxy | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride.janusProxy }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "janus-gateway.fullname" -}}
{{- if .Values.fullnameOverride.janusGateway }}
{{- .Values.fullnameOverride.janusGateway | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride.janusGateway }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "janus-cloud.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "janus-proxy.labels" -}}
helm.sh/chart: {{ include "janus-cloud.chart" . }}
{{ include "janus-proxy.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "janus-gateway.labels" -}}
helm.sh/chart: {{ include "janus-cloud.chart" . }}
{{ include "janus-gateway.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "janus-proxy.selectorLabels" -}}
app.kubernetes.io/name: {{ include "janus-proxy.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "janus-gateway.selectorLabels" -}}
app.kubernetes.io/name: {{ include "janus-gateway.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "janus-proxy.serviceAccountName" -}}
{{- if .Values.serviceAccount.janusProxy.create }}
{{- default (include "janus-proxy.fullname" .) .Values.serviceAccount.janusProxy.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.janusProxy.name }}
{{- end }}
{{- end }}

{{- define "janus-gateway.serviceAccountName" -}}
{{- if .Values.serviceAccount.janusGateway.create }}
{{- default (include "janus-gateway.fullname" .) .Values.serviceAccount.janusGateway.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.janusGateway.name }}
{{- end }}
{{- end }}

{{- define "magda.var_dump" -}}
{{- . | mustToPrettyJson | printf "\nThe JSON output of the dumped var is: \n%s" | fail }}
{{- end -}}

{{- $myVar := default (include "janus-proxy.serviceAccountName") }}
{{- template "magda.var_dump" $myVar }}
