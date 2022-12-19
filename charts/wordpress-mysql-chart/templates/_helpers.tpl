{{/*
Expand the name of the chart.
*/}}
{{- define "wordpress-mysql-chart.name" -}}
{{- default .Chart.Name .Values.name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "wordpress-mysql-chart.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.name }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" $name .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create a default fully qualified LoadBalancer name.
*/}}
{{- define "wordpress-mysql-chart.loadbalancerName" -}}
{{ include "wordpress-mysql-chart.fullname" . }}-lb
{{- end }}

{{/*
Create a default fully qualified wordpress PV Claim name.
*/}}
{{- define "wordpress-mysql-chart.wpPvclaimName" -}}
{{ include "wordpress-mysql-chart.fullname" . }}-wp-pvc
{{- end }}

{{/*
Create a default fully qualified wordpress autoscaler name.
*/}}
{{- define "wordpress-mysql-chart.wpHpaName" -}}
{{ include "wordpress-mysql-chart.fullname" . }}-wp-hpa
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "wordpress-mysql-chart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "wordpress-mysql-chart.labels" -}}
app: {{ default .Chart.Name .Values.name }}
chart: {{ include "wordpress-mysql-chart.chart" . }}
release: {{ .Release.Name }}
{{- end }}

{{/*
Wordpress frontend Selector labels
*/}}
{{- define "wordpress-mysql-chart.wpSelectorLabels" -}}
app: {{ default .Chart.Name .Values.name }}
tier: frontend
{{- end }}
