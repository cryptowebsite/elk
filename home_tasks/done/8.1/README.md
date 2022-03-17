# Самоконтроль выполненения задания

1. Где расположен файл с `some_fact` из второго пункта задания?
* Определение переменной `some_fact` находится в файлах по следующему пути `group_vars/<name_of_host_group>/examp.yaml`. 
* В случае отсутствия директории с именем группы хостов будет использоваться следующий путь `group_vars/all/examp.yaml`.

2. Какая команда нужна для запуска вашего `playbook` на окружении `test.yml`?
```shell
ansible-playbook -i inventory/test.yml site.yml.OLD
```

3. Какой командой можно зашифровать файл?
```shell
ansible-vault encrypt <some_file>
```

4. Какой командой можно расшифровать файл?
```shell
ansible-vault decrypt <some_file>
```

5. Можно ли посмотреть содержимое зашифрованного файла без команды расшифровки файла? Если можно, то как?
Да можно.
```shell
ansible-vault view <some_file>
```

6. Как выглядит команда запуска `playbook`, если переменные зашифрованы?
```shell
ansible-playbook -i inventory/test.yml --ask-vault-password site.yml.OLD
```

7. Как называется модуль подключения к host на windows?
`winrm`

8. Приведите полный текст команды для поиска информации в документации ansible для модуля подключений ssh
```shell
ansible-doc -t connection -l | grep ssh
```

9. Какой параметр из модуля подключения `ssh` необходим для того, чтобы определить пользователя, под которым необходимо совершать подключение?
`remote_user`
