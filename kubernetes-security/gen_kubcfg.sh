#!/bin/bash

SA=cd
NS=homework

cacrt=$(kubectl -n ${NS} get secret/${SA}-token -o json | jq '.data."ca.crt"')
token=$(kubectl -n ${NS} get secret/${SA}-token -o json | jq '.data.token | @base64d')
apiurl=https://$(minikube ip):8443

cat <<EOF
apiVersion: v1
kind: Config
clusters:
- name: minikube
  cluster:
    certificate-authority-data: ${cacrt}
    server: ${apiurl}
contexts:
- name: minikube
  context:
    cluster: minikube
    namespace: ${NS}
    user: ${SA}-user
current-context: minikube
users:
- name: ${SA}-user
  user:
    token: ${token}
EOF
