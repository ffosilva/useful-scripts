{{/*
Generate certificates
*/}}
{{- define "%%chart-name%%.gen-certs" -}}
{{- $altNames := list ( printf "%s.%s" (include "%%chart-name%%.name" .) .Release.Namespace ) ( printf "%s.%s.svc" (include "%%chart-name%%.name" .) .Release.Namespace ) -}}
{{- $ca := genCA "%%chart-name%%-ca" 365 -}}
{{- $cert := genSignedCert ( include "%%chart-name%%.name" . ) nil $altNames 365 $ca -}}
tls.crt: {{ $cert.Cert | b64enc }}
tls.key: {{ $cert.Key | b64enc }}
{{- end -}}
