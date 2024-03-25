# Выполнено ДЗ №1

 - [x] Основное ДЗ

## В процессе сделано:
 - создан манифест namespace.yaml для namespace с именем homework
 - создан манифест pod.yaml с описанием пода

## Как запустить проект:
 - minikube start --driver=docker
 - kubectl create -f namespace.yaml
 - kubectl apply -f pod.yaml

## Как проверить работоспособность:
 - kubectl config set-context --current --namespace=homework
 - kubectl get pod
 - kubectl expose pod homework --port=8000 --name=nginx-frontend --type=NodePort
 - curl $(minikube ip):$(kubectl describe svc | grep ^NodePort | awk '{ print $3 }' | cut -d/ -f1)
 

## PR checklist:
 - [x] Выставлен label с темой домашнего задания

