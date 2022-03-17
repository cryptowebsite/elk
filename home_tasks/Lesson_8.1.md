# 1. Попробуйте запустить playbook на окружении из `test.yml`, зафиксируйте какое значение имеет факт `some_fact` для указанного хоста при выполнении playbook'a.
````shell
ansible-playbook -i inventory/test.yml site.yml.OLD

# ....
ok: [localhost] => {
    "msg": "Linux Mint"
}
# ....
ok: [localhost] => {
    "msg": 12
}
# ....
````

# 2. Найдите файл с переменными (group_vars) в котором задаётся найденное в первом пункте значение и поменяйте его на 'all default fact'.
```shell
sed -i "s/some_fact: 12/some_fact: 'all default fact'/g" group_vars/all/examp.yml
```

# 3. Воспользуйтесь подготовленным (используется `docker`) или создайте собственное окружение для проведения дальнейших испытаний.
```shell
docker run --name ubuntu -d pycontribs/ubuntu tail -f /dev/null
docker run --name fedora -d pycontribs/fedora tail -f /dev/null
docker run --name centos7 -d centos:centos7 tail -f /dev/null
```

# 4. Проведите запуск playbook на окружении из `prod.yml`. Зафиксируйте полученные значения `some_fact` для каждого из `managed host`.
```shell
ansible-playbook -i inventory/prod.yml site.yml.OLD

# ...
ok: [centos7] => {
    "msg": "CentOS"
}
ok: [ubuntu] => {
    "msg": "Ubuntu"
}
# ...
ok: [centos7] => {
    "msg": "el"
}
ok: [ubuntu] => {
    "msg": "deb"
}
# ...
```

# 5. Добавьте факты в `group_vars` каждой из групп хостов так, чтобы для some_fact получились следующие значения: для `deb` - 'deb default fact', для `el` - 'el default fact'.
```shell
sed -i 's/some_fact: "deb"/some_fact: "deb default fact"/g' group_vars/deb/examp.yml
sed -i 's/some_fact: "el"/some_fact: "el default fact"/g' group_vars/el/examp.yml
```

# 6. Повторите запуск playbook на окружении `prod.yml`. Убедитесь, что выдаются корректные значения для всех хостов.
```shell
ansible-playbook -i inventory/prod.yml site.yml.OLD

# ...
ok: [centos7] => {
    "msg": "CentOS"
}
ok: [ubuntu] => {
    "msg": "Ubuntu"
}
# ...
ok: [centos7] => {
    "msg": "el default fact"
}
ok: [ubuntu] => {
    "msg": "deb default fact"
}
# ...
```

# 7. При помощи `ansible-vault` зашифруйте факты в `group_vars/deb` и `group_vars/el` с паролем `netology`.
```shell
ansible-vault encrypt group_vars/deb/examp.yml
ansible-vault encrypt group_vars/el/examp.yml 
```

# 8. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь в работоспособности.
```shell
ansible-playbook -i inventory/prod.yml --ask-vault-password site.yml.OLD

Vault password: 
#...
ok: [centos7] => {
    "msg": "CentOS"
}
ok: [ubuntu] => {
    "msg": "Ubuntu"
}
#...
ok: [centos7] => {
    "msg": "el default fact"
}
ok: [ubuntu] => {
    "msg": "deb default fact"
}
# ...
```

# 9. Посмотрите при помощи `ansible-doc` список плагинов для подключения. Выберите подходящий для работы на `control node`.
```shell
ansible-doc -t connection -l | grep 'connect via ssh'
```

# 10. В `prod.yml` добавьте новую группу хостов с именем `local`, в ней разместите localhost с необходимым типом подключения.
```yaml
---
  el:
    hosts:
      centos7:
        ansible_connection: docker
  deb:
    hosts:
      ubuntu:
        ansible_connection: docker
  local:
    hosts:
      ws001:
        ansible_connection: local
```

# 11. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь что факты `some_fact` для каждого из хостов определены из верных `group_vars`.
```shell
ansible-playbook -i inventory/prod.yml --ask-vault-password site.yml.OLD

Vault password: 
# ...
ok: [ws001] => {
    "msg": "Linux Mint"
}
ok: [centos7] => {
    "msg": "CentOS"
}
ok: [ubuntu] => {
    "msg": "Ubuntu"
}
# ...
ok: [ws001] => {
    "msg": "all default fact"
}
ok: [centos7] => {
    "msg": "el default fact"
}
ok: [ubuntu] => {
    "msg": "deb default fact"
}
# ...
```

# 12. Заполните `README.md` ответами на вопросы. Сделайте `git push` в ветку `master`. В ответе отправьте ссылку на ваш открытый репозиторий с изменённым playbook и заполненным README.md.
## Самоконтроль выполненения задания
https://github.com/cryptowebsite/devops-netology-ansible/blob/master/README.md

____________________________________________________________________________________________

# 1. При помощи ansible-vault расшифруйте все зашифрованные файлы с переменными.
```shell
ansible-vault decrypt group_vars/deb/examp.yml
ansible-vault decrypt group_vars/el/examp.yml
```

# 2. Зашифруйте отдельное значение `PaSSw0rd` для переменной `some_fact` паролем `netology`. Добавьте полученное значение в group_vars/all/exmp.yml.
```shell
ansible-vault encrypt_string
```

# 3. Запустите `playbook`, убедитесь, что для нужных хостов применился новый `fact`.
```shell
ansible-playbook -i inventory/prod.yml --ask-vault-password site.yml.OLD

Vault password: 
# ...
ok: [ws001] => {
    "msg": "Linux Mint"
}
ok: [centos7] => {
    "msg": "CentOS"
}
ok: [ubuntu] => {
    "msg": "Ubuntu"
}
# ...
ok: [ws001] => {
    "msg": "PaSSw0rd"
}
ok: [centos7] => {
    "msg": "el default fact"
}
ok: [ubuntu] => {
    "msg": "deb default fact"
}
```

# 4. Добавьте новую группу хостов `fedora`, самостоятельно придумайте для неё переменную.
```yaml
---
  el:
    hosts:
      centos7:
        ansible_connection: docker
  deb:
    hosts:
      ubuntu:
        ansible_connection: docker
  local:
    hosts:
      ws001:
        ansible_connection: local
  fedora:
    hosts:
      fedora-vm:
        ansible_connection: docker
```

# 5. Напишите скрипт на bash: автоматизируйте поднятие необходимых контейнеров, запуск ansible-playbook и остановку контейнеров.
```shell
#!/usr/bin/bash

declare -A containers=( ["ubuntu"]="pycontribs/ubuntu" ["centos7"]="centos:centos7" ["fedora"]="pycontribs/fedora" )

for container in "${!containers[@]}";
do
  docker run --name "$container" -d "${containers[$container]}" tail -f /dev/null
done

ansible-playbook -i inventory/prod.yml --ask-vault-password site.yml.OLD

for container in "${!containers[@]}";
do
  docker stop "$container"
  docker rm "$container"
done
```

P.S. можно было бы и не спрашивать пароль, используя `--vault-password-file`, но хранить секретные данные на файловой системе, в открытом виде, так себе идея, а как передать это дело через `env` я не нашел в документации. И еще одна вещь, предложенный образ в ДЗ `pycontribs/fedora` не удалось подружить с `ansible`. Получаю известную ошибку о нехватки прав для создания временной директории для `ansible`, хотя прав вполне достаточно. Перебрав еще несколько официальных образов дистрибутива проблема не решилась.
