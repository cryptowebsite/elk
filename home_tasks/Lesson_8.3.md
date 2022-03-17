# Lesson 8.3
Данный [playbook](https://github.com/cryptowebsite/devops-netology-ansible/blob/master/site.yml) служит для создания стека мониторинга из `Elasticsearch`, `Kibana` и `Filebeat`, и имеет `3 play` со соответственными названиями и тегами.

## 1. `Install Elasticsearch` имеет `3 tasks`
### 1.1 Download Elasticsearch's rpm
Скачиваем `rpm` пакет

### 1.2 `Install Elasticsearch`
Устанавливаем скачанный пакет

### 1.3 `Configure Elasticsearch`
Создаём конфиг с помощью шаблонизатора, перемещаем его на хост, и перезапускаем приложение с помощью хэндлера `restart Elasticsearch`.

## 2. `Install Kibana` имеет `3 tasks` и имеет тот же логический смысл как и `Install Elasticsearch`.
Единственным выделяющимся отличием служит, получение переменной, в файле конфигурации, из фактов полученных при работе `Install Elasticsearch`

## 3. `Install Filebeat` имеет `5 tasks`

### 3.1-3 Первые три `tasks` и имеет тот же логический смысл, как и в предыдущих случаях.
Единственным выделяющимся отличием служит, получение переменных, в файле конфигурации, из фактов полученных при работе `Install Elasticsearch` и `Install Kibana`

### 3.4 `Set filebeat systemwork`
Запускаем модуль `filebeat`

### 3.5 `Load kibana dashboard`
Загружаем `dashboards` в `kibana`
