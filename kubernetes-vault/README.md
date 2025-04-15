# Выполнено ДЗ №11

 - [*] Основное ДЗ
 - Проект развернут в on-premise RKE2 кластере.

## В процессе сделано:
 - В namespace longhorn из helm-чарта longhorn/longhorn установлено хранилище данных Longhorn. Перед этим воркер-ноды были помечены лейблом node-role.kubernetes.io/worker=true.
 - В namespace consul установлен consul из helm-чарта https://github.com/hashicorp/consul-k8s.git с параметрами 3 реплики для сервера, сохранен файл с переменными (values-consul.yaml).
 - В namespace vault установлен vault из helm-чарта https://github.com/hashicorp/vault-helm.git с включенными ui и режимом ha, сохранен файл с переменными (values-vault.yaml).
 - Выполнена инициализиция и распечатывание волта.
 - Создано хранилище секретов otus.
 - В namespace vault создан serviceAccount с именем vault-auth и ClusterRoleBinding для него с ролью system:auth-delegator (serviceAccount.yml).
 - В Vault включена авторизация auth/kubernetes с токеном от vault-auth.
 - Создана и применена политика otus-policy для секретов /otus/cred (otus-policy.hcl).
 - В vault создана роль auth/kubernetes/role/otus с использованием sa vault-auth (namespace vault) и политикой otus-policy.
 - В namespace vault установлен External secrets operator из helm-чарта external-secrets/external-secrets.
 - Создан и применен манифест crd объекта SecretStore (externalSecrets.yml).
 - Создан и применен манифест crd объекта ExternalSecret (externalSecrets.yml).


## Как запустить проект:
 - `helm pull --untar longhorn/longhorn`
 - `helm upgrade --install -n longhorn --create-namespace longhorn longhorn/ -f values-longhorn.yaml`

 - `git clone https://github.com/hashicorp/consul-k8s.git`
 - `helm upgrade --install -n consul --create-namespace consul consul-k8s/charts/consul/ -f values-consul.yaml`

 - `git clone https://github.com/hashicorp/vault-helm.git`
 - `helm upgrade --install -n vault --create-namespace vault vault-helm/ -f values-vault.yaml`

 - `kubectl -n vault exec -it vault-0 -- vault operator init -key-shares 5 -key-threshold 2`
 - `kubectl -n vault exec -it vault-0 -- vault operator unseal`
 - `kubectl -n vault exec -it vault-0 -- vault operator unseal`
 - `kubectl -n vault exec -it vault-1 -- vault operator unseal`
 - `kubectl -n vault exec -it vault-1 -- vault operator unseal`
 - `kubectl -n vault exec -it vault-2 -- vault operator unseal`
 - `kubectl -n vault exec -it vault-2 -- vault operator unseal`

 - `kubectl -n vault port-forward svc/vault 8200:8200`

 - `kubectl -n vault exec -it vault-0 -- vault secrets enable -version=2 -path=otus kv`
 - `kubectl -n vault exec -it vault-0 -- vault kv put otus/cred username='otus' password='asajkjkahs'`

 - `kubectl apply -f serviceAccount.yml`

 - `kubectl -n vault exec -it vault-0 -- vault auth enable kubernetes`

 - `kubectl -n vault exec -it vault-0 -- vault policy write otus-policy - <<<$(cat otus-policy.hcl)`
 - `kubectl -n vault exec -it vault-0 -- vault write auth/kubernetes/role/otus bound_service_account_names=vault-auth bound_service_account_namespaces=vault policies=default,otus-policy ttl=24h`
 - `TOKEN=$(kubectl -n vault get secret vault-auth-secret -o jsonpath='{.data.token}' | base64 -d)`
 - `CA_CERT=$(kubectl config view --raw -o jsonpath='{.clusters[0].cluster.certificate-authority-data}' | base64 -d)`
 - `HOST=$(kubectl config view --raw --output='jsonpath={.clusters[0].cluster.server}')`
 - `kubectl -n vault exec -it vault-0 -- vault write auth/kubernetes/config token_reviewer_jwt=$TOKEN kubernetes_host=$HOST kubernetes_ca_cert="$CA_CERT" disable_local_ca_jwt="true"`

 - `helm repo add external-secrets https://charts.external-secrets.io`
 - `helm pull --untar external-secrets/external-secrets`
 - `helm upgrade --install external-secrets external-secrets/external-secrets --create-namespace -n vault`

 - `kubectl apply -f externalSecrets.yml`

## Как проверить работоспособность:
 - `kubectl -n vault get secret otus-cred`


## PR checklist:
 - [*] Выставлен label с темой домашнего задания

