# Выполнено ДЗ №9

 - [x] Основное ДЗ
 - [ ] Задание со *

## В процессе сделано:
 - В Yandex cloud развернут managed Kubernetes cluster с двумя воркер-нодами.
 - Инфраструктурной ноде назначены taint "node-role=infra:NoSchedule" и лейбл "infraNode=true" (вывод с подтверждением приложен)
 - В YC создан бакет s3 для хранения логов
 - В кластер установлен loki-distributed (ReplicaSet), все компоненты которого запущены на infra-ноде
 - В кластер установлен promtail (DaemonSet), агенты которого расположены на всех нодах
 - В кластер установлена grafana (ReplicaSet), реплика которой расположена только на infra-node
 - В графану добавлен датасорс loki: http://loki-hw9-loki-distributed-gateway.monitoring.svc.cluster.local/
 - Приложен скриншот экрана с эксплорером датасорса loki

## Как запустить проект:
  `kubectl label nodes cl1it49h7jdgofpmt8vu-yxex infraNode=true`
  `kubectl taint nodes cl1it49h7jdgofpmt8vu-yxex node-role=infra:NoSchedule`

  `export HELM_EXPERIMENTAL_OCI=1 && \
    helm pull oci://cr.yandex/yc-marketplace/yandex-cloud/grafana/loki/chart/loki --version 1.1.2 --untar`
  `helm install \
    -f loki-values.yaml \
    --namespace monitoring \
    --create-namespace \
    --set loki-distributed.loki.storageConfig.aws.bucketnames=otus-logging \
    --set loki-distributed.serviceaccountawskeyvalue_generated.accessKeyID=YCAJE \
    --set loki-distributed.serviceaccountawskeyvalue_generated.secretAccessKey=YCPFsI \
    loki-hw9 ./loki/`

  `helm repo add grafana https://grafana.github.io/helm-charts`
  `helm upgrade --install --namespace monitoring --create-namespace -f grafana-values.yaml grafana-hw9 grafana/grafana`


## Как проверить работоспособность:
 - Обеспечить доступ к веб-интерфейсу графаны
   `kubectl --namespace monitoring port-forward service/grafana-hw9 3000:80`
 - Открыть в браузере URL http://127.0.0.1:3000/

## PR checklist:
 - [*] Выставлен label с темой домашнего задания

