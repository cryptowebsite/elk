# Lesson 8.2
Данный [playbook](https://github.com/cryptowebsite/devops-netology-ansible/blob/master/site.yml) служит для создания стека ELK и имеет `4 play`.
## 1. `Install Java`. Имеет `5 task` с тегами `java`.
### 1.1 `Set facts for Java 11 vars`
Задаём значение переменной `java_home`
### 1.2 `Upload .tar.gz file containing binaries from local storage`
Копируем архив с дистрибутивом JDK с `control node` на `managed node`
### 1.3 `Ensure installation dir exists`
Создаём директорию для дистрибутива
### 1.4 `Extract java in the installation directory`
Распаковываем архив с дистрибутивом в подготовленную директорию
### 1.5 `Export environment variables`
С помощью шаблонизатора создаем скрипт для настройки `environment`

## 2. `Install Elasticsearch`. Имеет `4 task` с тегами `elasticsearch`.
### 2.1 `Upload tar.gz Elasticsearch from remote URL`
Скачиваем дистрибутив с официального репозитория
### 2.2 `Create directrory for Elasticsearch`
Создаём директорию для дистрибутива
### 2.3 `Extract Elasticsearch in the installation directory`
Распаковываем архив с дистрибутивом в подготовленную директорию
### 2.4 `Set environment Elastic`
С помощью шаблонизатора создаем скрипт для настройки `environment`

## 3-4. `Install Kibana` и `Install Logstash` 
Имеют одинаковые по логике `4 tasks`, с тегами `kibana` и `logstash` соответственною, как в случае с `Install Elasticsearch`. За исключением того, что в `Install Elasticsearch` добавлен ещё один `task` `Set config Logstash`, в котором мы с помощью шаблонизатора и переменной с именем хоста `elastic_host` создали сонфиг `logstash.conf` и переместили его на сервер.


