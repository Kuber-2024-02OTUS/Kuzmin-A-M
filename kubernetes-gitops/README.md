# Выполнено ДЗ №10

 - [x] Основное ДЗ
 - [ ] Задание со *

## В процессе сделано:
 - Средствами minikube создан кластер с тремя воркер-нодами.
 - Инфраструктурной ноде minikube-m02 назначены taint "node-role=infra:NoSchedule" и лейбл "infraNode=true" (вывод с подтверждением приложен)
 - С помощью helm-чарта от Yandex в кластер установлен ArgoCD 2.8.4 (все компоненты привязаны к инфра-ноде)
 - В ArgoCD создан проект 'otus'. Его манифест взят из пода argocd/argocd-hw10-server-6c698696c4-579nd.
 - Для придания прав сервисному аккаунту была соответствующим образом отредактирована роль argocd-hw10-server
 - В проекте 'otus' созданы два приложения в соответствии с ДЗ

## Как запустить проект:
  - Выставить taint и label на инфра-ноду
  `kubectl label nodes minikube-m02 infraNode=true`
  `kubectl taint nodes minikube-m02 node-role=infra:NoSchedule`
 - Скачать чарт, взять из него values.yaml, отредактировать и установить с кастомными настройками
  `helm pull oci://cr.yandex/yc-marketplace/yandex-cloud/argo/chart/argo-cd --version 5.46.8-6 --untar`
  `helm upgrade --install --create-namespace -n argocd -f argocd-values.yaml argocd-hw10 ./argo-cd/`
 - Обеспечить доступ к веб-интерфейсу ArgoCD
   `kubectl port-forward service/argocd-hw10-server -n argocd 8443:443`
 - Выдернуть сгенерированный при установке пароль админа
   `kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d`
 - Открыть в браузере URL http://127.0.0.1:8443/ и произвести манипуляции по созданию проекта 'otus' и двух приложений согласно ДЗ
 - Выставить label на какую-либо ноду для запуска подов из kubernetes-networks
  `kubectl label nodes minikube-m03 homework=true`

## Как проверить работоспособность:
 - Убедиться, что в неймспейсах homework и homeworkhelm создались поды и прочие ресурсы из kubernetes-networks и kubernetes-templating


## PR checklist:
 - [*] Выставлен label с темой домашнего задания

