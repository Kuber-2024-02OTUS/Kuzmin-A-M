# Выполнено ДЗ №5

 - [x] Основное ДЗ
 - [ ] Задание со *

## В процессе сделано:
 - В namespace homework создан service account monitoring с доступом к эндпоинту /metrics кластера
 - Манифест deployment из прошлых ДЗ изменен так, чтобы поды запускались под service account monitoring
 - В namespace homework создан service account с именем cd с ролью admin в рамках namespace homework
 - Создан kubeconfig для service account cd
 - Для service account cd сгенерирован и сохранен в файл token токен с временем действия 1 день

## Как запустить проект:
 - `minikube start --driver=docker`
 - `kubectl apply -f deployment.yaml -f sa-cd.yml -f sa-monitoring.yml`
 - `kubectl create token cd --duration 86400s > token`
 - `/bin/bash gen_kubcfg.sh > sa-cd-kubeconfig`


## Как проверить работоспособность:

 - `KUBECONFIG=sa-cd-kubecbnfig kubectl get ns` #Forbidden 
 - `KUBECONFIG=sa-cd-kubeconfig kubectl get po` #Success
 - `kubectl --token=$(cat token) get ns` #Success

## PR checklist:
 - [*] Выставлен label с темой домашнего задания

