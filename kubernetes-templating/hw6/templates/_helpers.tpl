{{/*
Expand the name of the chart.
*/}}
{{- define "hw6.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "hw6.selectorLabels" -}}
app: nginx
{{- end }}

{{/* configmap items */}}
{{- define "hw6.configmapItems" -}}
- key: file
  path: file
{{- end }}
