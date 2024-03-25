# Выполнено ДЗ №4

 - [*] Основное ДЗ

## В процессе сделано:
 - Создан манифест pvc.yaml, описывающий PersistentVolumeClaim, запрашивающий хранилище с storageClass по-умолчанию
 - Создан манифест cm.yaml для объекта типа configMap
 - В манифесте deployment.yaml изменена спецификация volume типа emptyDir, который монтируется в init и основной контейнер, на pvc, созданный в предыдущем пункте
 - В манифесте deployment.yaml добавлено монтирование ранее созданного configMap как volume к основному контейнеру пода в директорию /homework/conf, так, чтобы его содержимое можно было получить, обратившись по url /conf/file


## Как запустить проект:
 - `minikube start --driver=docker`
 - `kubectl apply -f namespace.yaml`
 - `kubectl label nodes minikube homework=true`
 - `kubectl apply -f cm.yaml`
 - `kubectl apply -f pvc.yaml`
 - `kubectl apply -f deployment.yaml`
 - `kubectl apply -f service.yaml`
 - `kubectl apply -f ingress.yaml`

## Как проверить работоспособность:
 - `curl http://homework.otus/conf/file`
 - `curl http://homework.otus/`

## PR checklist:
 - [*] Выставлен label с темой домашнего задания

