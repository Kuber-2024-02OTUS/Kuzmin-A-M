# Выполнено ДЗ №7

 - [x] Основное ДЗ
 - [ ] Задание со *

## В процессе сделано:
 - Создан манифест CustomResourceDefinition (crd.yaml)
 - Созданы манифесты ServiceAccount, ClusterRole и ClusterRoleBinding (sa-cr-crb.yaml)
 - Создан манифест deployement для оператора (operator.yaml)
 - Создан манифест CustomResource kind: MySQL (cr.yaml)
 - Приложен вывод команды `kubectl get pvc,pv,svc,deploy,pods,mysqls,sa > resources.txt`

## Как запустить проект:
  `kubectl apply -f crd.yaml -f sa-cr-crb.yaml -f operator.yaml`
  `kubectl apply -f cr.yaml`

## Как проверить работоспособность:
 - Обеспечить доступ к развернутому MySQL
   `kubectl --namespace monitoring port-forward service/mysql-cr-hw7 3306:3306`
 - Попытаться подключиться при помощи консольного клиента и убедиться, что подключение отбито с ошибкой "ERROR 1045 (28000): Access denied"
   `mysql -h 127.1`

## PR checklist:
 - [*] Выставлен label с темой домашнего задания

