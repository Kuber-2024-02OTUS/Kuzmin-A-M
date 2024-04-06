# Выполнено ДЗ №5

 - [x] Основное ДЗ
 - [ ] Задание со *

## В процессе сделано:
 - Создан helm-chart, деплоящий приложение по предыдущим ДЗ
 - В чарт добавлена зависимость от bitnami/redis
 - В ns prod установлен Apache kafka из чарта bitnami с указанием кастомных переменных в командной строке
 - В ns dev установлен Apache kafka из чарта bitnami с указанием кастомных переменных в командной строке
 - Созданы values-файлы для установки Apache-kafka из чарта bitnami

## Как запустить проект:
 - `helm repo add bitnami https://charts.bitnami.com/bitnami`
 ## Установка приложения из чарта
 - `helm upgrade --install hw6 hw6`
 ## Установка кафки в prod
 - `helm -n prod install kafkaprod bitnami/kafka --create-namespace --set controller.replicaCount=5,image.tag=3.5.2,listeners.client.protocol=SASL_PLAINTEXT,listeners.interbroker.protocol=SASL_PLAINTEXT`
 ## Установка кафки в dev
 - `helm -n dev install kafkadev bitnami/kafka --create-namespace --set controller.replicaCount=1,image.tag=latest,listeners.client.protocol=PLAINTEXT,listeners.interbroker.protocol=PLAINTEXT`
 ## Установка кафки в prod c values
 - `helm -n prod install kafkaprod bitnami/kafka --create-namespace -f kafka-prod-helmfile.yaml`
 ## Установка кафки в dev c values
 - `helm -n dev install kafkadev bitnami/kafka --create-namespace -f kafka-dev-helmfile.yaml`


## Как проверить работоспособность:

 - `kubectl -n homework get all`
 - `curl http://homework.otus`
 - `kubectl -n prod get all`
 - `kubectl -n dev get all`


## PR checklist:
 - [*] Выставлен label с темой домашнего задания

