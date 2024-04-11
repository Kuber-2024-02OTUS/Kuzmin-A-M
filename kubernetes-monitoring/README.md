# Выполнено ДЗ №8

 - [x] Основное ДЗ
 - [ ] Задание со *

## В процессе сделано:
 - Создан кастомный образ nginx, отдающий свои метрики по uri /metrics
 - Установлен Prometheus-operator через helm-чарт bitnami
 - Создан deployment, запускающий кастомный nginx образ и service для него
 - Настроен  запуск nginx prometheus exporter в составе пода с nginx
 - Создан манифест serviceMonitor (svcmon.yaml), описывающий сбор метрик с пода nginx-custom

## Как запустить проект:
Сборка докер-имиджа nginx-custom:v0.2
 - `cd nginx-custom && docker build -t almkuzmin/nginx-custom:v0.2 . && cd ..`
Применение манифестов
 - `kubectl apply -f .`
Установка Prometheus-operator через helm-чарт
 - `helm install -n homework kube-prom oci://registry-1.docker.io/bitnamicharts/kube-prometheus`

## Как проверить работоспособность:
  - Открыть в браузере URL http://homework.otus/

## PR checklist:
 - [*] Выставлен label с темой домашнего задания

