# Lesson 8.4

## [playbook](https://github.com/cryptowebsite/devops-netology-ansible/blob/master/site.yml) для настройки стека `ELK`

### 1 `filebeat` [filebeat](https://github.com/cryptowebsite/filebeat-role)
* `filebeat_version` - версия `filebeat`
### 2 `kibana` [kibana](https://github.com/cryptowebsite/kibana-role)
* `kibana_version` - версия `kibana`
### 3 `logstash` [logstash](https://github.com/cryptowebsite/logstash-role)
* `logstash_version` - версия `logstash`

Данные роли работают по одно принципу, а именно, сначала скачивается дистрибутив на `control node`, затем копируется и устанавливается на `managed node`. После чего, с помощью шаблонизатора, создаются и перемещаются конфигурационные файлы. Далее перезапускается сервис. Для сервиса `logstash` создал `init` файл. В связи с отсутствием времени (т.к. время работы `terraform` и  `ansible` составляет около 40 минут), не удалось реализовать до конца механизм обновления, хотя безусловно продвижение в этом вопросе было =)
