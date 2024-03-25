# Выполнено ДЗ №2

 - [x] Основное ДЗ
 - [x] Задание со *

## В процессе сделано:
 - Cоздан манифест namespace.yaml для namespace с именем homework
 - Cоздан манифест deployment.yaml, описывающий deployment, создаваемый в неймспейсе homework, запускающий три реплики, имеющий readiness пробу и стратегию обновления RollingUpdate
- Манифесты последовательно применены и результат проверен с помощью соответствующих команд

## Как запустить проект:
 - `minikube start --driver=docker`
 - `kubectl apply -f namespace.yaml`
 - `kubectl label nodes  minikube homework=true`
 - `kubectl apply -f deployment.yaml`

## Как проверить работоспособность:
 - `kubectl config set-context --current --namespace=homework`
 - `kubectl expose pod homework --port=8000 --name=nginx-frontend --type=NodePort`
 - `kubectl get pod -owide`
 - `kubectl get pod $(kubectl get pod -owide | awk '$1 ~ /^homework-/ { print $1 }' | tail -n1) -o jsonpath='{.status.containerStatuses[0].ready}'`
 - `curl $(minikube ip):$(kubectl describe svc | grep ^NodePort | awk '{ print $3 }' | cut -d/ -f1)`

## PR checklist:
 - [x] Выставлен label с темой домашнего задания

