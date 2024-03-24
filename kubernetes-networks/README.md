# Выполнено ДЗ №3

 - [x] Основное ДЗ
 - [ ] Задание со *

## В процессе сделано:
 - Изменена readiness-проба в манифесте deployment.yaml из прошлого ДЗ на httpGet, вызывающую URL /index.html
 - Создан манифест service.yaml, описывающий сервис типа ClusterIP, который направляет трафик на поды, управляемые deployment
 - Установлен ingress-контроллер nginx
 - Создан манифест ingress.yaml, в котором описан объект типа ingress, направляющий все http запросы к хосту homework.otus на ранее созданный сервис.

## Как запустить проект:
 - `minikube start --driver=docker`
 - `minikube addons enable ingress`
 - `kubectl apply -f namespace.yaml`
 - `kubectl label nodes minikube homework=true`
 - `kubectl apply -f deployment.yaml`
 - `kubectl apply -f service.yaml`
 - `kubectl apply -f ingress.yaml`


## Как проверить работоспособность:
 - `echo "$(minikube ip) homework.otus" >> /etc/hosts`
 - `curl http://homework.otus/index.html`

## PR checklist:
 - [*] Выставлен label с темой домашнего задания

