# Домашнее задание к занятию «Введение в Terraform» - Старцев Данила Антонович

### Цели задания

1. Установить и настроить Terrafrom.
2. Научиться использовать готовый код.

------

### Чек-лист готовности к домашнему заданию

1. Скачайте и установите **Terraform** версии >=1.12.0 . Приложите скриншот вывода команды ```terraform --version```.
2. Скачайте на свой ПК этот git-репозиторий. Исходный код для выполнения задания расположен в директории **01/src**.
3. Убедитесь, что в вашей ОС установлен docker.

------

### Инструменты и дополнительные материалы, которые пригодятся для выполнения задания

1. Репозиторий с ссылкой на зеркало для установки и настройки Terraform: [ссылка](https://github.com/netology-code/devops-materials).
2. Установка docker: [ссылка](https://docs.docker.com/engine/install/ubuntu/). 

![подготовка](https://github.com/MindMaze74/terraform_dz1/blob/main/img/1.png)
------
### Внимание!! Обязательно предоставляем на проверку получившийся код в виде ссылки на ваш github-репозиторий!
------

### Задание 1

1. Перейдите в каталог [**src**](https://github.com/netology-code/ter-homeworks/tree/main/01/src). Скачайте все необходимые зависимости, использованные в проекте.
Ответ:

>![задание 1](https://github.com/MindMaze74/terraform_dz1/blob/main/img/2.png)

2. Изучите файл **.gitignore**. В каком terraform-файле, согласно этому .gitignore, допустимо сохранить личную, секретную информацию?(логины,пароли,ключи,токены итд)
Ответ:
> допустимо в файле personal.auto.tfvars

3. Выполните код проекта. Найдите  в state-файле секретное содержимое созданного ресурса **random_password**, пришлите в качестве ответа конкретный ключ и его значение.
Ответ:
>![задание 3](https://github.com/MindMaze74/terraform_dz1/blob/main/img/3.png)

4. Раскомментируйте блок кода, примерно расположенный на строчках 29–42 файла **main.tf**.
Выполните команду ```terraform validate```. Объясните, в чём заключаются намеренно допущенные ошибки. Исправьте их.
Ответ:
>![задание 4](https://github.com/MindMaze74/terraform_dz1/blob/main/img/4.png)

>![задание 4](https://github.com/MindMaze74/terraform_dz1/blob/main/img/5.png)

>![задание 4](https://github.com/MindMaze74/terraform_dz1/blob/main/img/6.png)

>![задание 4](https://github.com/MindMaze74/terraform_dz1/blob/main/img/7.png)

5. Выполните код. В качестве ответа приложите: исправленный фрагмент кода и вывод команды ```docker ps```.
Ответ:
>![задание 5](https://github.com/MindMaze74/terraform_dz1/blob/main/img/8.png)

6. Замените имя docker-контейнера в блоке кода на ```hello_world```. Не перепутайте имя контейнера и имя образа. Мы всё ещё продолжаем использовать name = "nginx:latest". Выполните команду ```terraform apply -auto-approve```.
Объясните своими словами, в чём может быть опасность применения ключа  ```-auto-approve```. Догадайтесь или нагуглите зачем может пригодиться данный ключ? В качестве ответа дополнительно приложите вывод команды ```docker ps```.
Ответ:
> -auto-approve просто соглашается на все изменения без вопроса Enter a value. Это удобно для автоматизации, но опасно, потому что можно случайно удалить или сломать важные ресурсы, если не заметить ошибку в плане. В проде лучше так не делать, но в CI/CD и тестах самое оно.

>![задание 6](https://github.com/MindMaze74/terraform_dz1/blob/main/img/9.png)

7. Уничтожьте созданные ресурсы с помощью **terraform**. Убедитесь, что все ресурсы удалены. Приложите содержимое файла **terraform.tfstate**. 
Ответ:

>![задание 7](https://github.com/MindMaze74/terraform_dz1/blob/main/img/10.png)

8. Объясните, почему при этом не был удалён docker-образ **nginx:latest**. Ответ **ОБЯЗАТЕЛЬНО НАЙДИТЕ В ПРЕДОСТАВЛЕННОМ КОДЕ**, а затем **ОБЯЗАТЕЛЬНО ПОДКРЕПИТЕ** строчкой из документации [**terraform провайдера docker**](https://library.tf/providers/kreuzwerker/docker/latest).  (ищите в классификаторе resource docker_image )
Ответ:
Параметр keep_locally = true явно указывает Terraform не удалять образ при выполнении terraform destroy
текст из документации 
keep_locally (Boolean) If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation.

>![задание 8](https://github.com/MindMaze74/terraform_dz1/blob/main/img/11.png)

------

## Дополнительное задание (со звёздочкой*)

**Настоятельно рекомендуем выполнять все задания со звёздочкой.** Они помогут глубже разобраться в материале.   
Задания со звёздочкой дополнительные, не обязательные к выполнению и никак не повлияют на получение вами зачёта по этому домашнему заданию. 

### Задание 2*

1. Создайте в облаке ВМ. Сделайте это через web-консоль, чтобы не слить по незнанию токен от облака в github(это тема следующей лекции). Если хотите - попробуйте сделать это через terraform, прочитав документацию yandex cloud. Используйте файл ```personal.auto.tfvars``` и гитигнор или иной, безопасный способ передачи токена!
2. Подключитесь к ВМ по ssh и установите стек docker.
3. Найдите в документации docker provider способ настроить подключение terraform на вашей рабочей станции к remote docker context вашей ВМ через ssh.
4. Используя terraform и  remote docker context, скачайте и запустите на вашей ВМ контейнер ```mysql:8``` на порту ```127.0.0.1:3306```, передайте ENV-переменные. Сгенерируйте разные пароли через random_password и передайте их в контейнер, используя интерполяцию из примера с nginx.(```name  = "example_${random_password.random_string.result}"```  , двойные кавычки и фигурные скобки обязательны!) 
```
    environment:
      - "MYSQL_ROOT_PASSWORD=${...}"
      - MYSQL_DATABASE=wordpress
      - MYSQL_USER=wordpress
      - "MYSQL_PASSWORD=${...}"
      - MYSQL_ROOT_HOST="%"
```

6. Зайдите на вашу ВМ , подключитесь к контейнеру и проверьте наличие секретных env-переменных с помощью команды ```env```. Запишите ваш финальный код в репозиторий.

>Ответ:
<details>
  <summary>Нажмите, чтобы увидеть резульаты по Задаче 2</summary>

>![задание 2*](https://github.com/MindMaze74/terraform_dz1/blob/main/img/12.png)

> Листинг всех команд по всей практической работе и результат
```bash
user@ubuntu24:~/git/terraform_dz1/src$ cat terraform.tfstate | grep random_password
      "type": "random_password",
user@ubuntu24:~/git/terraform_dz1/src$ cat terraform.tfstate | grep result
            "result": "UhgYpekl9tTaFjhZ",
                "value": "result"
  "check_results": null
user@ubuntu24:~/git/terraform_dz1/src$ terraform validate
╷
│ Error: Missing name for resource
│ 
│   on main.tf line 23, in resource "docker_image":
│   23: resource "docker_image" {
│ 
│ All resource blocks must have 2 labels (type, name).
╵
╷
│ Error: Invalid resource name
│ 
│   on main.tf line 28, in resource "docker_container" "1nginx":
│   28: resource "docker_container" "1nginx" {
│ 
│ A name must start with a letter or underscore and may contain only letters, digits, underscores, and dashes.
╵
user@ubuntu24:~/git/terraform_dz1/src$ terraform validate
Success! The configuration is valid.

user@ubuntu24:~/git/terraform_dz1/src$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
user@ubuntu24:~/git/terraform_dz1/src$ terraform apply
random_password.random_string: Refreshing state... [id=none]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # docker_container.nginx will be created
  + resource "docker_container" "nginx" {
      + attach                                      = false
      + bridge                                      = (known after apply)
      + command                                     = (known after apply)
      + container_logs                              = (known after apply)
      + container_read_refresh_timeout_milliseconds = 15000
      + entrypoint                                  = (known after apply)
      + env                                         = (known after apply)
      + exit_code                                   = (known after apply)
      + hostname                                    = (known after apply)
      + id                                          = (known after apply)
      + image                                       = (known after apply)
      + init                                        = (known after apply)
      + ipc_mode                                    = (known after apply)
      + log_driver                                  = (known after apply)
      + logs                                        = false
      + memory_reservation                          = 0
      + must_run                                    = true
      + name                                        = (sensitive value)
      + network_data                                = (known after apply)
      + network_mode                                = "bridge"
      + platform                                    = (known after apply)
      + read_only                                   = false
      + remove_volumes                              = true
      + restart                                     = "no"
      + rm                                          = false
      + runtime                                     = (known after apply)
      + security_opts                               = (known after apply)
      + shm_size                                    = (known after apply)
      + start                                       = true
      + stdin_open                                  = false
      + stop_signal                                 = (known after apply)
      + stop_timeout                                = (known after apply)
      + tty                                         = false
      + wait                                        = false
      + wait_timeout                                = 60

      + healthcheck (known after apply)

      + labels (known after apply)

      + ports {
          + external = 9090
          + internal = 80
          + ip       = "0.0.0.0"
          + protocol = "tcp"
        }
    }

  # docker_image.nginx will be created
  + resource "docker_image" "nginx" {
      + id           = (known after apply)
      + image_id     = (known after apply)
      + keep_locally = true
      + name         = "nginx:latest"
      + repo_digest  = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

docker_image.nginx: Creating...
docker_image.nginx: Creation complete after 8s [id=sha256:05b8cb60c354a44ab824ea6e7dc69b46d50762cdbe728a347a5b656e6fb3d7c4nginx:latest]
docker_container.nginx: Creating...
docker_container.nginx: Creation complete after 2s [id=5dfcfdf0b19e25505969b476f87cfb2e8d6a91d97471b8e7bf26822cbb5f18ac]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
user@ubuntu24:~/git/terraform_dz1/src$ docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS                  NAMES
5dfcfdf0b19e   05b8cb60c354   "/docker-entrypoint.…"   5 seconds ago   Up 4 seconds   0.0.0.0:9090->80/tcp   example_UhgYpekl9tTaFjhZ
user@ubuntu24:~/git/terraform_dz1/src$ docker rename example_UhgYpekl9tTaFjhZ hello_world
user@ubuntu24:~/git/terraform_dz1/src$ docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS                  NAMES
5dfcfdf0b19e   05b8cb60c354   "/docker-entrypoint.…"   3 minutes ago   Up 3 minutes   0.0.0.0:9090->80/tcp   hello_world
user@ubuntu24:~/git/terraform_dz1/src$ terraform apply -auto-approve
docker_image.nginx: Refreshing state... [id=sha256:05b8cb60c354a44ab824ea6e7dc69b46d50762cdbe728a347a5b656e6fb3d7c4nginx:latest]
random_password.random_string: Refreshing state... [id=none]
docker_container.nginx: Refreshing state... [id=5dfcfdf0b19e25505969b476f87cfb2e8d6a91d97471b8e7bf26822cbb5f18ac]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # docker_container.nginx must be replaced
-/+ resource "docker_container" "nginx" {
      + bridge                                      = (known after apply)
      ~ command                                     = [
          - "nginx",
          - "-g",
          - "daemon off;",
        ] -> (known after apply)
      + container_logs                              = (known after apply)
      - cpu_shares                                  = 0 -> null
      - device_cgroup_rules                         = [] -> null
      - dns                                         = [] -> null
      - dns_opts                                    = [] -> null
      - dns_search                                  = [] -> null
      ~ entrypoint                                  = [
          - "/docker-entrypoint.sh",
        ] -> (known after apply)
      ~ env                                         = [] -> (known after apply)
      + exit_code                                   = (known after apply)
      - group_add                                   = [] -> null
      ~ hostname                                    = "5dfcfdf0b19e" -> (known after apply)
      ~ id                                          = "5dfcfdf0b19e25505969b476f87cfb2e8d6a91d97471b8e7bf26822cbb5f18ac" -> (known after apply)
      ~ init                                        = false -> (known after apply)
      ~ ipc_mode                                    = "private" -> (known after apply)
      ~ log_driver                                  = "json-file" -> (known after apply)
      - log_opts                                    = {} -> null
      - max_retry_count                             = 0 -> null
      - memory                                      = 0 -> null
      - memory_swap                                 = 0 -> null
      ~ name                                        = (sensitive value) # forces replacement
      ~ network_data                                = [
          - {
              - gateway                   = "172.17.0.1"
              - global_ipv6_prefix_length = 0
              - ip_address                = "172.17.0.2"
              - ip_prefix_length          = 16
              - mac_address               = "ba:00:c6:3d:4e:b3"
              - network_name              = "bridge"
                # (2 unchanged attributes hidden)
            },
        ] -> (known after apply)
      ~ platform                                    = "linux" -> (known after apply)
      - privileged                                  = false -> null
      - publish_all_ports                           = false -> null
      ~ runtime                                     = "runc" -> (known after apply)
      ~ security_opts                               = [] -> (known after apply)
      ~ shm_size                                    = 64 -> (known after apply)
      ~ stop_signal                                 = "SIGQUIT" -> (known after apply)
      ~ stop_timeout                                = 0 -> (known after apply)
      - storage_opts                                = {} -> null
      - sysctls                                     = {} -> null
      - tmpfs                                       = {} -> null
        # (21 unchanged attributes hidden)

      ~ healthcheck (known after apply)

      ~ labels (known after apply)

        # (1 unchanged block hidden)
    }

Plan: 1 to add, 0 to change, 1 to destroy.
docker_container.nginx: Destroying... [id=5dfcfdf0b19e25505969b476f87cfb2e8d6a91d97471b8e7bf26822cbb5f18ac]
docker_container.nginx: Still destroying... [id=5dfcfdf0b19e25505969b476f87cfb2e8d6a91d97471b8e7bf26822cbb5f18ac, 00m10s elapsed]
╷
│ Error: Error stopping container 5dfcfdf0b19e25505969b476f87cfb2e8d6a91d97471b8e7bf26822cbb5f18ac: Error response from daemon: cannot stop container: 5dfcfdf0b19e25505969b476f87cfb2e8d6a91d97471b8e7bf26822cbb5f18ac: permission denied
│ 
│ 
╵
user@ubuntu24:~/git/terraform_dz1/src$ terraform destroy -auto-approve
docker_image.nginx: Refreshing state... [id=sha256:05b8cb60c354a44ab824ea6e7dc69b46d50762cdbe728a347a5b656e6fb3d7c4nginx:latest]
random_password.random_string: Refreshing state... [id=none]
docker_container.nginx: Refreshing state... [id=5dfcfdf0b19e25505969b476f87cfb2e8d6a91d97471b8e7bf26822cbb5f18ac]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # docker_container.nginx will be destroyed
  - resource "docker_container" "nginx" {
      - attach                                      = false -> null
      - command                                     = [
          - "nginx",
          - "-g",
          - "daemon off;",
        ] -> null
      - container_read_refresh_timeout_milliseconds = 15000 -> null
      - cpu_shares                                  = 0 -> null
      - device_cgroup_rules                         = [] -> null
      - dns                                         = [] -> null
      - dns_opts                                    = [] -> null
      - dns_search                                  = [] -> null
      - entrypoint                                  = [
          - "/docker-entrypoint.sh",
        ] -> null
      - env                                         = [] -> null
      - group_add                                   = [] -> null
      - hostname                                    = "5dfcfdf0b19e" -> null
      - id                                          = "5dfcfdf0b19e25505969b476f87cfb2e8d6a91d97471b8e7bf26822cbb5f18ac" -> null
      - image                                       = "sha256:05b8cb60c354a44ab824ea6e7dc69b46d50762cdbe728a347a5b656e6fb3d7c4" -> null
      - init                                        = false -> null
      - ipc_mode                                    = "private" -> null
      - log_driver                                  = "json-file" -> null
      - log_opts                                    = {} -> null
      - logs                                        = false -> null
      - max_retry_count                             = 0 -> null
      - memory                                      = 0 -> null
      - memory_reservation                          = 0 -> null
      - memory_swap                                 = 0 -> null
      - must_run                                    = true -> null
      - name                                        = (sensitive value) -> null
      - network_data                                = [
          - {
              - gateway                   = "172.17.0.1"
              - global_ipv6_prefix_length = 0
              - ip_address                = "172.17.0.2"
              - ip_prefix_length          = 16
              - mac_address               = "ba:00:c6:3d:4e:b3"
              - network_name              = "bridge"
                # (2 unchanged attributes hidden)
            },
        ] -> null
      - network_mode                                = "bridge" -> null
      - platform                                    = "linux" -> null
      - privileged                                  = false -> null
      - publish_all_ports                           = false -> null
      - read_only                                   = false -> null
      - remove_volumes                              = true -> null
      - restart                                     = "no" -> null
      - rm                                          = false -> null
      - runtime                                     = "runc" -> null
      - security_opts                               = [] -> null
      - shm_size                                    = 64 -> null
      - start                                       = true -> null
      - stdin_open                                  = false -> null
      - stop_signal                                 = "SIGQUIT" -> null
      - stop_timeout                                = 0 -> null
      - storage_opts                                = {} -> null
      - sysctls                                     = {} -> null
      - tmpfs                                       = {} -> null
      - tty                                         = false -> null
      - wait                                        = false -> null
      - wait_timeout                                = 60 -> null
        # (6 unchanged attributes hidden)

      - ports {
          - external = 9090 -> null
          - internal = 80 -> null
          - ip       = "0.0.0.0" -> null
          - protocol = "tcp" -> null
        }
    }

  # docker_image.nginx will be destroyed
  - resource "docker_image" "nginx" {
      - id           = "sha256:05b8cb60c354a44ab824ea6e7dc69b46d50762cdbe728a347a5b656e6fb3d7c4nginx:latest" -> null
      - image_id     = "sha256:05b8cb60c354a44ab824ea6e7dc69b46d50762cdbe728a347a5b656e6fb3d7c4" -> null
      - keep_locally = true -> null
      - name         = "nginx:latest" -> null
      - repo_digest  = "nginx@sha256:05b8cb60c354a44ab824ea6e7dc69b46d50762cdbe728a347a5b656e6fb3d7c4" -> null
    }

  # random_password.random_string will be destroyed
  - resource "random_password" "random_string" {
      - bcrypt_hash = (sensitive value) -> null
      - id          = "none" -> null
      - length      = 16 -> null
      - lower       = true -> null
      - min_lower   = 1 -> null
      - min_numeric = 1 -> null
      - min_special = 0 -> null
      - min_upper   = 1 -> null
      - number      = true -> null
      - numeric     = true -> null
      - result      = (sensitive value) -> null
      - special     = false -> null
      - upper       = true -> null
    }

Plan: 0 to add, 0 to change, 3 to destroy.
docker_container.nginx: Destroying... [id=5dfcfdf0b19e25505969b476f87cfb2e8d6a91d97471b8e7bf26822cbb5f18ac]
docker_container.nginx: Still destroying... [id=5dfcfdf0b19e25505969b476f87cfb2e8d6a91d97471b8e7bf26822cbb5f18ac, 00m10s elapsed]
╷
│ Error: Error stopping container 5dfcfdf0b19e25505969b476f87cfb2e8d6a91d97471b8e7bf26822cbb5f18ac: Error response from daemon: cannot stop container: 5dfcfdf0b19e25505969b476f87cfb2e8d6a91d97471b8e7bf26822cbb5f18ac: permission denied
│ 
│ 
╵
user@ubuntu24:~/git/terraform_dz1/src$ sudo usermod -aG docker $USER
[sudo] password for user: 
user@ubuntu24:~/git/terraform_dz1/src$ terraform destroy -auto-approve
docker_image.nginx: Refreshing state... [id=sha256:05b8cb60c354a44ab824ea6e7dc69b46d50762cdbe728a347a5b656e6fb3d7c4nginx:latest]
random_password.random_string: Refreshing state... [id=none]
docker_container.nginx: Refreshing state... [id=5dfcfdf0b19e25505969b476f87cfb2e8d6a91d97471b8e7bf26822cbb5f18ac]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # docker_container.nginx will be destroyed
  - resource "docker_container" "nginx" {
      - attach                                      = false -> null
      - command                                     = [
          - "nginx",
          - "-g",
          - "daemon off;",
        ] -> null
      - container_read_refresh_timeout_milliseconds = 15000 -> null
      - cpu_shares                                  = 0 -> null
      - device_cgroup_rules                         = [] -> null
      - dns                                         = [] -> null
      - dns_opts                                    = [] -> null
      - dns_search                                  = [] -> null
      - entrypoint                                  = [
          - "/docker-entrypoint.sh",
        ] -> null
      - env                                         = [] -> null
      - group_add                                   = [] -> null
      - hostname                                    = "5dfcfdf0b19e" -> null
      - id                                          = "5dfcfdf0b19e25505969b476f87cfb2e8d6a91d97471b8e7bf26822cbb5f18ac" -> null
      - image                                       = "sha256:05b8cb60c354a44ab824ea6e7dc69b46d50762cdbe728a347a5b656e6fb3d7c4" -> null
      - init                                        = false -> null
      - ipc_mode                                    = "private" -> null
      - log_driver                                  = "json-file" -> null
      - log_opts                                    = {} -> null
      - logs                                        = false -> null
      - max_retry_count                             = 0 -> null
      - memory                                      = 0 -> null
      - memory_reservation                          = 0 -> null
      - memory_swap                                 = 0 -> null
      - must_run                                    = true -> null
      - name                                        = (sensitive value) -> null
      - network_data                                = [
          - {
              - gateway                   = "172.17.0.1"
              - global_ipv6_prefix_length = 0
              - ip_address                = "172.17.0.2"
              - ip_prefix_length          = 16
              - mac_address               = "ba:00:c6:3d:4e:b3"
              - network_name              = "bridge"
                # (2 unchanged attributes hidden)
            },
        ] -> null
      - network_mode                                = "bridge" -> null
      - platform                                    = "linux" -> null
      - privileged                                  = false -> null
      - publish_all_ports                           = false -> null
      - read_only                                   = false -> null
      - remove_volumes                              = true -> null
      - restart                                     = "no" -> null
      - rm                                          = false -> null
      - runtime                                     = "runc" -> null
      - security_opts                               = [] -> null
      - shm_size                                    = 64 -> null
      - start                                       = true -> null
      - stdin_open                                  = false -> null
      - stop_signal                                 = "SIGQUIT" -> null
      - stop_timeout                                = 0 -> null
      - storage_opts                                = {} -> null
      - sysctls                                     = {} -> null
      - tmpfs                                       = {} -> null
      - tty                                         = false -> null
      - wait                                        = false -> null
      - wait_timeout                                = 60 -> null
        # (6 unchanged attributes hidden)

      - ports {
          - external = 9090 -> null
          - internal = 80 -> null
          - ip       = "0.0.0.0" -> null
          - protocol = "tcp" -> null
        }
    }

  # docker_image.nginx will be destroyed
  - resource "docker_image" "nginx" {
      - id           = "sha256:05b8cb60c354a44ab824ea6e7dc69b46d50762cdbe728a347a5b656e6fb3d7c4nginx:latest" -> null
      - image_id     = "sha256:05b8cb60c354a44ab824ea6e7dc69b46d50762cdbe728a347a5b656e6fb3d7c4" -> null
      - keep_locally = true -> null
      - name         = "nginx:latest" -> null
      - repo_digest  = "nginx@sha256:05b8cb60c354a44ab824ea6e7dc69b46d50762cdbe728a347a5b656e6fb3d7c4" -> null
    }

  # random_password.random_string will be destroyed
  - resource "random_password" "random_string" {
      - bcrypt_hash = (sensitive value) -> null
      - id          = "none" -> null
      - length      = 16 -> null
      - lower       = true -> null
      - min_lower   = 1 -> null
      - min_numeric = 1 -> null
      - min_special = 0 -> null
      - min_upper   = 1 -> null
      - number      = true -> null
      - numeric     = true -> null
      - result      = (sensitive value) -> null
      - special     = false -> null
      - upper       = true -> null
    }

Plan: 0 to add, 0 to change, 3 to destroy.
docker_container.nginx: Destroying... [id=5dfcfdf0b19e25505969b476f87cfb2e8d6a91d97471b8e7bf26822cbb5f18ac]
docker_container.nginx: Still destroying... [id=5dfcfdf0b19e25505969b476f87cfb2e8d6a91d97471b8e7bf26822cbb5f18ac, 00m10s elapsed]
╷
│ Error: Error stopping container 5dfcfdf0b19e25505969b476f87cfb2e8d6a91d97471b8e7bf26822cbb5f18ac: Error response from daemon: cannot stop container: 5dfcfdf0b19e25505969b476f87cfb2e8d6a91d97471b8e7bf26822cbb5f18ac: permission denied
│ 
│ 
╵
user@ubuntu24:~/git/terraform_dz1/src$ sudo terraform destroy -auto-approve
docker_image.nginx: Refreshing state... [id=sha256:05b8cb60c354a44ab824ea6e7dc69b46d50762cdbe728a347a5b656e6fb3d7c4nginx:latest]
random_password.random_string: Refreshing state... [id=none]
docker_container.nginx: Refreshing state... [id=5dfcfdf0b19e25505969b476f87cfb2e8d6a91d97471b8e7bf26822cbb5f18ac]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # docker_container.nginx will be destroyed
  - resource "docker_container" "nginx" {
      - attach                                      = false -> null
      - command                                     = [
          - "nginx",
          - "-g",
          - "daemon off;",
        ] -> null
      - container_read_refresh_timeout_milliseconds = 15000 -> null
      - cpu_shares                                  = 0 -> null
      - device_cgroup_rules                         = [] -> null
      - dns                                         = [] -> null
      - dns_opts                                    = [] -> null
      - dns_search                                  = [] -> null
      - entrypoint                                  = [
          - "/docker-entrypoint.sh",
        ] -> null
      - env                                         = [] -> null
      - group_add                                   = [] -> null
      - hostname                                    = "5dfcfdf0b19e" -> null
      - id                                          = "5dfcfdf0b19e25505969b476f87cfb2e8d6a91d97471b8e7bf26822cbb5f18ac" -> null
      - image                                       = "sha256:05b8cb60c354a44ab824ea6e7dc69b46d50762cdbe728a347a5b656e6fb3d7c4" -> null
      - init                                        = false -> null
      - ipc_mode                                    = "private" -> null
      - log_driver                                  = "json-file" -> null
      - log_opts                                    = {} -> null
      - logs                                        = false -> null
      - max_retry_count                             = 0 -> null
      - memory                                      = 0 -> null
      - memory_reservation                          = 0 -> null
      - memory_swap                                 = 0 -> null
      - must_run                                    = true -> null
      - name                                        = (sensitive value) -> null
      - network_data                                = [
          - {
              - gateway                   = "172.17.0.1"
              - global_ipv6_prefix_length = 0
              - ip_address                = "172.17.0.2"
              - ip_prefix_length          = 16
              - mac_address               = "ba:00:c6:3d:4e:b3"
              - network_name              = "bridge"
                # (2 unchanged attributes hidden)
            },
        ] -> null
      - network_mode                                = "bridge" -> null
      - platform                                    = "linux" -> null
      - privileged                                  = false -> null
      - publish_all_ports                           = false -> null
      - read_only                                   = false -> null
      - remove_volumes                              = true -> null
      - restart                                     = "no" -> null
      - rm                                          = false -> null
      - runtime                                     = "runc" -> null
      - security_opts                               = [] -> null
      - shm_size                                    = 64 -> null
      - start                                       = true -> null
      - stdin_open                                  = false -> null
      - stop_signal                                 = "SIGQUIT" -> null
      - stop_timeout                                = 0 -> null
      - storage_opts                                = {} -> null
      - sysctls                                     = {} -> null
      - tmpfs                                       = {} -> null
      - tty                                         = false -> null
      - wait                                        = false -> null
      - wait_timeout                                = 60 -> null
        # (6 unchanged attributes hidden)

      - ports {
          - external = 9090 -> null
          - internal = 80 -> null
          - ip       = "0.0.0.0" -> null
          - protocol = "tcp" -> null
        }
    }

  # docker_image.nginx will be destroyed
  - resource "docker_image" "nginx" {
      - id           = "sha256:05b8cb60c354a44ab824ea6e7dc69b46d50762cdbe728a347a5b656e6fb3d7c4nginx:latest" -> null
      - image_id     = "sha256:05b8cb60c354a44ab824ea6e7dc69b46d50762cdbe728a347a5b656e6fb3d7c4" -> null
      - keep_locally = true -> null
      - name         = "nginx:latest" -> null
      - repo_digest  = "nginx@sha256:05b8cb60c354a44ab824ea6e7dc69b46d50762cdbe728a347a5b656e6fb3d7c4" -> null
    }

  # random_password.random_string will be destroyed
  - resource "random_password" "random_string" {
      - bcrypt_hash = (sensitive value) -> null
      - id          = "none" -> null
      - length      = 16 -> null
      - lower       = true -> null
      - min_lower   = 1 -> null
      - min_numeric = 1 -> null
      - min_special = 0 -> null
      - min_upper   = 1 -> null
      - number      = true -> null
      - numeric     = true -> null
      - result      = (sensitive value) -> null
      - special     = false -> null
      - upper       = true -> null
    }

Plan: 0 to add, 0 to change, 3 to destroy.
docker_container.nginx: Destroying... [id=5dfcfdf0b19e25505969b476f87cfb2e8d6a91d97471b8e7bf26822cbb5f18ac]
docker_container.nginx: Still destroying... [id=5dfcfdf0b19e25505969b476f87cfb2e8d6a91d97471b8e7bf26822cbb5f18ac, 00m10s elapsed]
╷
│ Error: Error stopping container 5dfcfdf0b19e25505969b476f87cfb2e8d6a91d97471b8e7bf26822cbb5f18ac: Error response from daemon: cannot stop container: 5dfcfdf0b19e25505969b476f87cfb2e8d6a91d97471b8e7bf26822cbb5f18ac: permission denied
│ 
│ 
╵
user@ubuntu24:~/git/terraform_dz1/src$ sudo docker stop hello_world
Error response from daemon: cannot stop container: hello_world: permission denied
user@ubuntu24:~/git/terraform_dz1/src$ sudo docker ps -a | grep hello_world
5dfcfdf0b19e   05b8cb60c354   "/docker-entrypoint.…"   11 minutes ago   Up 11 minutes   0.0.0.0:9090->80/tcp   hello_world
user@ubuntu24:~/git/terraform_dz1/src$ sudo docker rm -f hello_world
Error response from daemon: cannot remove container "hello_world": could not kill container: permission denied
user@ubuntu24:~/git/terraform_dz1/src$ terraform state rm docker_container.nginx
Removed docker_container.nginx
Successfully removed 1 resource instance(s).
user@ubuntu24:~/git/terraform_dz1/src$ terraform destroy -auto-approve
docker_image.nginx: Refreshing state... [id=sha256:05b8cb60c354a44ab824ea6e7dc69b46d50762cdbe728a347a5b656e6fb3d7c4nginx:latest]
random_password.random_string: Refreshing state... [id=none]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # docker_image.nginx will be destroyed
  - resource "docker_image" "nginx" {
      - id           = "sha256:05b8cb60c354a44ab824ea6e7dc69b46d50762cdbe728a347a5b656e6fb3d7c4nginx:latest" -> null
      - image_id     = "sha256:05b8cb60c354a44ab824ea6e7dc69b46d50762cdbe728a347a5b656e6fb3d7c4" -> null
      - keep_locally = true -> null
      - name         = "nginx:latest" -> null
      - repo_digest  = "nginx@sha256:05b8cb60c354a44ab824ea6e7dc69b46d50762cdbe728a347a5b656e6fb3d7c4" -> null
    }

  # random_password.random_string will be destroyed
  - resource "random_password" "random_string" {
      - bcrypt_hash = (sensitive value) -> null
      - id          = "none" -> null
      - length      = 16 -> null
      - lower       = true -> null
      - min_lower   = 1 -> null
      - min_numeric = 1 -> null
      - min_special = 0 -> null
      - min_upper   = 1 -> null
      - number      = true -> null
      - numeric     = true -> null
      - result      = (sensitive value) -> null
      - special     = false -> null
      - upper       = true -> null
    }

Plan: 0 to add, 0 to change, 2 to destroy.
docker_image.nginx: Destroying... [id=sha256:05b8cb60c354a44ab824ea6e7dc69b46d50762cdbe728a347a5b656e6fb3d7c4nginx:latest]
random_password.random_string: Destroying... [id=none]
random_password.random_string: Destruction complete after 0s
docker_image.nginx: Destruction complete after 0s

Destroy complete! Resources: 2 destroyed.
user@ubuntu24:~/git/terraform_dz1/src$ cat terraform.tfstate
{
  "version": 4,
  "terraform_version": "1.12.2",
  "serial": 10,
  "lineage": "90f88751-e6d0-58aa-a222-8f83d8224b1a",
  "outputs": {},
  "resources": [],
  "check_results": null
}
user@ubuntu24:~/git/terraform_dz1/src$ ssh adminom@51.250.30.26
Welcome to Ubuntu 24.04.4 LTS (GNU/Linux 6.8.0-138-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro
user@ubuntu24:~/git/terraform_dz1/src$ ssh adminom@51.250.30.26
Welcome to Ubuntu 24.04.4 LTS (GNU/Linux 6.8.0-138-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Sat Sep  5 14:23:12 UTC 2026

  System load:  0.3                Processes:             109
  Usage of /:   11.1% of 18.72GB   Users logged in:       0
  Memory usage: 10%                IPv4 address for eth0: 10.129.0.32
  Swap usage:   0%


Expanded Security Maintenance for Applications is not enabled.

2 updates can be applied immediately.
To see these additional updates run: apt list --upgradable

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status


The list of available updates is more than a week old.
To check for new updates run: sudo apt update

adminom@compute-vm-2-2-20-hdd-1788617917155:~$ sudo apt update
Hit:1 http://mirror.yandex.ru/ubuntu noble InRelease
Get:2 http://mirror.yandex.ru/ubuntu noble-updates InRelease [126 kB]      
Get:3 http://mirror.yandex.ru/ubuntu noble-backports InRelease [126 kB]    
Get:4 http://mirror.yandex.ru/ubuntu noble-updates/main amd64 Packages [1260 kB]
Get:5 http://mirror.yandex.ru/ubuntu noble-updates/main Translation-en [292 kB]
Get:6 http://mirror.yandex.ru/ubuntu noble-updates/main amd64 Components [180 kB]
Get:7 http://mirror.yandex.ru/ubuntu noble-updates/universe amd64 Packages [1690 kB]  
Get:8 http://mirror.yandex.ru/ubuntu noble-updates/universe Translation-en [339 kB]
Get:9 http://mirror.yandex.ru/ubuntu noble-updates/universe amd64 Components [388 kB]
Get:10 http://mirror.yandex.ru/ubuntu noble-updates/restricted amd64 Packages [1536 kB]
Get:11 http://mirror.yandex.ru/ubuntu noble-updates/restricted Translation-en [352 kB]
Get:12 http://mirror.yandex.ru/ubuntu noble-updates/multiverse amd64 Components [940 B]
Get:13 http://mirror.yandex.ru/ubuntu noble-backports/main amd64 Components [5740 B] 
Get:14 http://mirror.yandex.ru/ubuntu noble-backports/universe amd64 Components [12.6 kB]
Get:15 http://security.ubuntu.com/ubuntu noble-security InRelease [126 kB]              
Get:16 http://security.ubuntu.com/ubuntu noble-security/main amd64 Packages [1002 kB]
Get:17 http://security.ubuntu.com/ubuntu noble-security/main Translation-en [212 kB]                                                                                                    
Get:18 http://security.ubuntu.com/ubuntu noble-security/main amd64 Components [46.4 kB]                                                                                                 
Get:19 http://security.ubuntu.com/ubuntu noble-security/universe amd64 Packages [1206 kB]                                                                                               
Get:20 http://security.ubuntu.com/ubuntu noble-security/universe Translation-en [241 kB]                                                                                                
Get:21 http://security.ubuntu.com/ubuntu noble-security/universe amd64 Components [76.3 kB]                                                                                             
Get:22 http://security.ubuntu.com/ubuntu noble-security/restricted amd64 Packages [1437 kB]                                                                                             
Get:23 http://security.ubuntu.com/ubuntu noble-security/restricted Translation-en [334 kB]                                                                                              
Fetched 11.0 MB in 32s (339 kB/s)                                                                                                                                                       
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
56 packages can be upgraded. Run 'apt list --upgradable' to see them.
adminom@compute-vm-2-2-20-hdd-1788617917155:~$ sudo apt install ca-certificates curl gnupg lsb-release -y

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

sudo usermod -aG docker $USER

newgrp docker

docker --version
docker compose version
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
ca-certificates is already the newest version (20260601~24.04.1).
ca-certificates set to manually installed.
curl is already the newest version (8.5.0-2ubuntu10.13).
curl set to manually installed.
lsb-release is already the newest version (12.0-2).
lsb-release set to manually installed.
The following additional packages will be installed:
  dirmngr gnupg-l10n gnupg-utils gpg gpg-agent gpg-wks-client gpgconf gpgsm gpgv keyboxd
Suggested packages:
  pinentry-gnome3 tor parcimonie xloadimage gpg-wks-server scdaemon
The following packages will be upgraded:
  dirmngr gnupg gnupg-l10n gnupg-utils gpg gpg-agent gpg-wks-client gpgconf gpgsm gpgv keyboxd
11 upgraded, 0 newly installed, 0 to remove and 45 not upgraded.
Need to get 2293 kB of archives.
After this operation, 0 B of additional disk space will be used.
Get:1 http://mirror.yandex.ru/ubuntu noble-updates/main amd64 gpg-wks-client amd64 2.4.4-2ubuntu17.6 [70.9 kB]
Get:2 http://mirror.yandex.ru/ubuntu noble-updates/main amd64 dirmngr amd64 2.4.4-2ubuntu17.6 [323 kB]
Get:3 http://mirror.yandex.ru/ubuntu noble-updates/main amd64 gpgsm amd64 2.4.4-2ubuntu17.6 [232 kB]
Get:4 http://mirror.yandex.ru/ubuntu noble-updates/main amd64 gnupg-utils amd64 2.4.4-2ubuntu17.6 [109 kB]
Get:5 http://mirror.yandex.ru/ubuntu noble-updates/main amd64 gpg-agent amd64 2.4.4-2ubuntu17.6 [227 kB]
Get:6 http://mirror.yandex.ru/ubuntu noble-updates/main amd64 gpg amd64 2.4.4-2ubuntu17.6 [565 kB]
Get:7 http://mirror.yandex.ru/ubuntu noble-updates/main amd64 gpgconf amd64 2.4.4-2ubuntu17.6 [104 kB]
Get:8 http://mirror.yandex.ru/ubuntu noble-updates/main amd64 gnupg all 2.4.4-2ubuntu17.6 [359 kB]
Get:9 http://mirror.yandex.ru/ubuntu noble-updates/main amd64 keyboxd amd64 2.4.4-2ubuntu17.6 [78.3 kB]
Get:10 http://mirror.yandex.ru/ubuntu noble-updates/main amd64 gpgv amd64 2.4.4-2ubuntu17.6 [158 kB]
Get:11 http://mirror.yandex.ru/ubuntu noble-updates/main amd64 gnupg-l10n all 2.4.4-2ubuntu17.6 [66.5 kB]
Fetched 2293 kB in 0s (70.9 MB/s)      
(Reading database ... 106575 files and directories currently installed.)
Preparing to unpack .../0-gpg-wks-client_2.4.4-2ubuntu17.6_amd64.deb ...
Unpacking gpg-wks-client (2.4.4-2ubuntu17.6) over (2.4.4-2ubuntu17.4) ...
Preparing to unpack .../1-dirmngr_2.4.4-2ubuntu17.6_amd64.deb ...
Unpacking dirmngr (2.4.4-2ubuntu17.6) over (2.4.4-2ubuntu17.4) ...
Preparing to unpack .../2-gpgsm_2.4.4-2ubuntu17.6_amd64.deb ...
Unpacking gpgsm (2.4.4-2ubuntu17.6) over (2.4.4-2ubuntu17.4) ...
Preparing to unpack .../3-gnupg-utils_2.4.4-2ubuntu17.6_amd64.deb ...
Unpacking gnupg-utils (2.4.4-2ubuntu17.6) over (2.4.4-2ubuntu17.4) ...
Preparing to unpack .../4-gpg-agent_2.4.4-2ubuntu17.6_amd64.deb ...
Unpacking gpg-agent (2.4.4-2ubuntu17.6) over (2.4.4-2ubuntu17.4) ...
Preparing to unpack .../5-gpg_2.4.4-2ubuntu17.6_amd64.deb ...
Unpacking gpg (2.4.4-2ubuntu17.6) over (2.4.4-2ubuntu17.4) ...
Preparing to unpack .../6-gpgconf_2.4.4-2ubuntu17.6_amd64.deb ...
Unpacking gpgconf (2.4.4-2ubuntu17.6) over (2.4.4-2ubuntu17.4) ...
Preparing to unpack .../7-gnupg_2.4.4-2ubuntu17.6_all.deb ...
Unpacking gnupg (2.4.4-2ubuntu17.6) over (2.4.4-2ubuntu17.4) ...
Preparing to unpack .../8-keyboxd_2.4.4-2ubuntu17.6_amd64.deb ...
Unpacking keyboxd (2.4.4-2ubuntu17.6) over (2.4.4-2ubuntu17.4) ...
Preparing to unpack .../9-gpgv_2.4.4-2ubuntu17.6_amd64.deb ...
Unpacking gpgv (2.4.4-2ubuntu17.6) over (2.4.4-2ubuntu17.4) ...
Setting up gpgv (2.4.4-2ubuntu17.6) ...
(Reading database ... 106575 files and directories currently installed.)
Preparing to unpack .../gnupg-l10n_2.4.4-2ubuntu17.6_all.deb ...
Unpacking gnupg-l10n (2.4.4-2ubuntu17.6) over (2.4.4-2ubuntu17.4) ...
Setting up gnupg-l10n (2.4.4-2ubuntu17.6) ...
Setting up gpgconf (2.4.4-2ubuntu17.6) ...
Setting up gpg (2.4.4-2ubuntu17.6) ...
Setting up gnupg-utils (2.4.4-2ubuntu17.6) ...
Setting up gpg-agent (2.4.4-2ubuntu17.6) ...
Setting up gpgsm (2.4.4-2ubuntu17.6) ...
Setting up dirmngr (2.4.4-2ubuntu17.6) ...
Setting up keyboxd (2.4.4-2ubuntu17.6) ...
Setting up gnupg (2.4.4-2ubuntu17.6) ...
Setting up gpg-wks-client (2.4.4-2ubuntu17.6) ...
Processing triggers for install-info (7.1-3build2) ...
Processing triggers for man-db (2.12.0-4build2) ...
Scanning processes...                                                                                                                                                                    
Scanning linux images...                                                                                                                                                                 

Running kernel seems to be up-to-date.

No services need to be restarted.

No containers need to be restarted.

No user sessions are running outdated binaries.

No VM guests are running outdated hypervisor (qemu) binaries on this host.
Hit:1 http://mirror.yandex.ru/ubuntu noble InRelease
Hit:2 http://mirror.yandex.ru/ubuntu noble-updates InRelease                                                    
Hit:3 http://mirror.yandex.ru/ubuntu noble-backports InRelease                                                  
Get:4 https://download.docker.com/linux/ubuntu noble InRelease [48.5 kB]                                        
Hit:5 http://security.ubuntu.com/ubuntu noble-security InRelease
Get:6 https://download.docker.com/linux/ubuntu noble/stable amd64 Packages [65.2 kB]
Fetched 114 kB in 1s (218 kB/s)     
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
45 packages can be upgraded. Run 'apt list --upgradable' to see them.
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  docker-buildx-plugin docker-ce-rootless-extras pigz
Suggested packages:
  cgroupfs-mount | cgroup-lite docker-model-plugin
The following NEW packages will be installed:
  containerd.io docker-buildx-plugin docker-ce docker-ce-cli docker-ce-rootless-extras docker-compose-plugin pigz
0 upgraded, 7 newly installed, 0 to remove and 45 not upgraded.
Need to get 99.8 MB of archives.
After this operation, 382 MB of additional disk space will be used.
Get:1 http://mirror.yandex.ru/ubuntu noble/universe amd64 pigz amd64 2.8-1 [65.6 kB]
Get:2 https://download.docker.com/linux/ubuntu noble/stable amd64 containerd.io amd64 2.3.4-2~ubuntu.24.04~noble [22.4 MB]
Get:3 https://download.docker.com/linux/ubuntu noble/stable amd64 docker-ce-cli amd64 5:29.8.0-1~ubuntu.24.04~noble [17.6 MB]
Get:4 https://download.docker.com/linux/ubuntu noble/stable amd64 docker-ce amd64 5:29.8.0-1~ubuntu.24.04~noble [24.3 MB]
Get:5 https://download.docker.com/linux/ubuntu noble/stable amd64 docker-buildx-plugin amd64 0.37.0-1~ubuntu.24.04~noble [17.3 MB]
Get:6 https://download.docker.com/linux/ubuntu noble/stable amd64 docker-ce-rootless-extras amd64 5:29.8.0-1~ubuntu.24.04~noble [10.2 MB]
Get:7 https://download.docker.com/linux/ubuntu noble/stable amd64 docker-compose-plugin amd64 5.5.1-1~ubuntu.24.04~noble [8012 kB]
Fetched 99.8 MB in 2s (66.4 MB/s)               
Selecting previously unselected package containerd.io.
(Reading database ... 106575 files and directories currently installed.)
Preparing to unpack .../0-containerd.io_2.3.4-2~ubuntu.24.04~noble_amd64.deb ...
Unpacking containerd.io (2.3.4-2~ubuntu.24.04~noble) ...
Selecting previously unselected package docker-ce-cli.
Preparing to unpack .../1-docker-ce-cli_5%3a29.8.0-1~ubuntu.24.04~noble_amd64.deb ...
Unpacking docker-ce-cli (5:29.8.0-1~ubuntu.24.04~noble) ...
Selecting previously unselected package docker-ce.
Preparing to unpack .../2-docker-ce_5%3a29.8.0-1~ubuntu.24.04~noble_amd64.deb ...
Unpacking docker-ce (5:29.8.0-1~ubuntu.24.04~noble) ...
Selecting previously unselected package pigz.
Preparing to unpack .../3-pigz_2.8-1_amd64.deb ...
Unpacking pigz (2.8-1) ...
Selecting previously unselected package docker-buildx-plugin.
Preparing to unpack .../4-docker-buildx-plugin_0.37.0-1~ubuntu.24.04~noble_amd64.deb ...
Unpacking docker-buildx-plugin (0.37.0-1~ubuntu.24.04~noble) ...
Selecting previously unselected package docker-ce-rootless-extras.
Preparing to unpack .../5-docker-ce-rootless-extras_5%3a29.8.0-1~ubuntu.24.04~noble_amd64.deb ...
Unpacking docker-ce-rootless-extras (5:29.8.0-1~ubuntu.24.04~noble) ...
Selecting previously unselected package docker-compose-plugin.
Preparing to unpack .../6-docker-compose-plugin_5.5.1-1~ubuntu.24.04~noble_amd64.deb ...
Unpacking docker-compose-plugin (5.5.1-1~ubuntu.24.04~noble) ...
Setting up docker-buildx-plugin (0.37.0-1~ubuntu.24.04~noble) ...
Setting up containerd.io (2.3.4-2~ubuntu.24.04~noble) ...
Created symlink /etc/systemd/system/multi-user.target.wants/containerd.service → /usr/lib/systemd/system/containerd.service.
Setting up docker-compose-plugin (5.5.1-1~ubuntu.24.04~noble) ...
Setting up docker-ce-cli (5:29.8.0-1~ubuntu.24.04~noble) ...
Setting up pigz (2.8-1) ...
Setting up docker-ce-rootless-extras (5:29.8.0-1~ubuntu.24.04~noble) ...
Setting up docker-ce (5:29.8.0-1~ubuntu.24.04~noble) ...
Created symlink /etc/systemd/system/multi-user.target.wants/docker.service → /usr/lib/systemd/system/docker.service.
Created symlink /etc/systemd/system/sockets.target.wants/docker.socket → /usr/lib/systemd/system/docker.socket.
Processing triggers for man-db (2.12.0-4build2) ...
Scanning processes...                                                                                                                                                                    
Scanning linux images...                                                                                                                                                                 

Running kernel seems to be up-to-date.

No services need to be restarted.

No containers need to be restarted.

No user sessions are running outdated binaries.

No VM guests are running outdated hypervisor (qemu) binaries on this host.
user@ubuntu24:~/git/terraform_dz1/src$ terraform apply
random_password.mysql_password: Refreshing state... [id=none]
random_password.mysql_root: Refreshing state... [id=none]
random_password.random_string: Refreshing state... [id=none]
docker_image.nginx: Refreshing state... [id=sha256:05b8cb60c354a44ab824ea6e7dc69b46d50762cdbe728a347a5b656e6fb3d7c4nginx:latest]
docker_image.mysql: Refreshing state... [id=sha256:b3b90af2a6552ae30c266fdb7d5dd55f3afb72404bb78d37fe8a23eb857fd3fbmysql:8]
docker_container.nginx: Refreshing state... [id=1af5711c17cbbdbfa12510a0588ecc5a534ba0810f4b12ea0808b94fd5b21cd6]
docker_container.mysql: Refreshing state... [id=fb42c930c5eee6a9f71c78648a31df3a44d7ca197af59b5418dceb3720dc835d]

Note: Objects have changed outside of Terraform

Terraform detected the following changes made outside of Terraform since the last "terraform apply" which may have affected this plan:

  # docker_image.mysql has been deleted
  - resource "docker_image" "mysql" {
        id           = "sha256:b3b90af2a6552ae30c266fdb7d5dd55f3afb72404bb78d37fe8a23eb857fd3fbmysql:8"
      - image_id     = "sha256:b3b90af2a6552ae30c266fdb7d5dd55f3afb72404bb78d37fe8a23eb857fd3fb" -> null
        name         = "mysql:8"
        # (2 unchanged attributes hidden)
    }

  # docker_image.nginx has been deleted
  - resource "docker_image" "nginx" {
        id           = "sha256:05b8cb60c354a44ab824ea6e7dc69b46d50762cdbe728a347a5b656e6fb3d7c4nginx:latest"
      - image_id     = "sha256:05b8cb60c354a44ab824ea6e7dc69b46d50762cdbe728a347a5b656e6fb3d7c4" -> null
        name         = "nginx:latest"
        # (2 unchanged attributes hidden)
    }


Unless you have made equivalent changes to your configuration, or ignored the relevant attributes using ignore_changes, the following plan may include actions to undo or respond to these changes.

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # docker_container.mysql will be created
  + resource "docker_container" "mysql" {
      + attach                                      = false
      + bridge                                      = (known after apply)
      + command                                     = (known after apply)
      + container_logs                              = (known after apply)
      + container_read_refresh_timeout_milliseconds = 15000
      + entrypoint                                  = (known after apply)
      + env                                         = (sensitive value)
      + exit_code                                   = (known after apply)
      + hostname                                    = (known after apply)
      + id                                          = (known after apply)
      + image                                       = (known after apply)
      + init                                        = (known after apply)
      + ipc_mode                                    = (known after apply)
      + log_driver                                  = (known after apply)
      + logs                                        = false
      + memory_reservation                          = 0
      + must_run                                    = true
      + name                                        = (sensitive value)
      + network_data                                = (known after apply)
      + network_mode                                = "bridge"
      + platform                                    = (known after apply)
      + read_only                                   = false
      + remove_volumes                              = true
      + restart                                     = "no"
      + rm                                          = false
      + runtime                                     = (known after apply)
      + security_opts                               = (known after apply)
      + shm_size                                    = (known after apply)
      + start                                       = true
      + stdin_open                                  = false
      + stop_signal                                 = (known after apply)
      + stop_timeout                                = (known after apply)
      + tty                                         = false
      + wait                                        = false
      + wait_timeout                                = 60

      + healthcheck (known after apply)

      + labels (known after apply)

      + ports {
          + external = 3306
          + internal = 3306
          + ip       = "0.0.0.0"
          + protocol = "tcp"
        }
    }

  # docker_container.nginx will be created
  + resource "docker_container" "nginx" {
      + attach                                      = false
      + bridge                                      = (known after apply)
      + command                                     = (known after apply)
      + container_logs                              = (known after apply)
      + container_read_refresh_timeout_milliseconds = 15000
      + entrypoint                                  = (known after apply)
      + env                                         = (known after apply)
      + exit_code                                   = (known after apply)
      + hostname                                    = (known after apply)
      + id                                          = (known after apply)
      + image                                       = (known after apply)
      + init                                        = (known after apply)
      + ipc_mode                                    = (known after apply)
      + log_driver                                  = (known after apply)
      + logs                                        = false
      + memory_reservation                          = 0
      + must_run                                    = true
      + name                                        = (sensitive value)
      + network_data                                = (known after apply)
      + network_mode                                = "bridge"
      + platform                                    = (known after apply)
      + read_only                                   = false
      + remove_volumes                              = true
      + restart                                     = "no"
      + rm                                          = false
      + runtime                                     = (known after apply)
      + security_opts                               = (known after apply)
      + shm_size                                    = (known after apply)
      + start                                       = true
      + stdin_open                                  = false
      + stop_signal                                 = (known after apply)
      + stop_timeout                                = (known after apply)
      + tty                                         = false
      + wait                                        = false
      + wait_timeout                                = 60

      + healthcheck (known after apply)

      + labels (known after apply)

      + ports {
          + external = 9090
          + internal = 80
          + ip       = "0.0.0.0"
          + protocol = "tcp"
        }
    }

  # docker_image.mysql will be created
  + resource "docker_image" "mysql" {
      + id           = (known after apply)
      + image_id     = (known after apply)
      + keep_locally = false
      + name         = "mysql:8"
      + repo_digest  = (known after apply)
    }

  # docker_image.nginx will be created
  + resource "docker_image" "nginx" {
      + id           = (known after apply)
      + image_id     = (known after apply)
      + keep_locally = true
      + name         = "nginx:latest"
      + repo_digest  = (known after apply)
    }

Plan: 4 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

docker_image.mysql: Creating...
docker_image.nginx: Creating...
docker_image.mysql: Still creating... [00m10s elapsed]
docker_image.nginx: Still creating... [00m10s elapsed]
docker_image.nginx: Creation complete after 12s [id=sha256:05b8cb60c354a44ab824ea6e7dc69b46d50762cdbe728a347a5b656e6fb3d7c4nginx:latest]
docker_container.nginx: Creating...
docker_image.mysql: Still creating... [00m20s elapsed]
docker_container.nginx: Still creating... [00m10s elapsed]
docker_image.mysql: Creation complete after 26s [id=sha256:b3b90af2a6552ae30c266fdb7d5dd55f3afb72404bb78d37fe8a23eb857fd3fbmysql:8]
docker_container.mysql: Creating...
docker_container.nginx: Creation complete after 16s [id=c262db78f0c3c8caf27b5f8dea8b1293d74d7c8193c437a4122a43347a3bba14]
docker_container.mysql: Creation complete after 3s [id=de876ccedbaa8037f279a17238d5ed1cde7c1845cb959ed7e5c59107515806ca]

Apply complete! Resources: 4 added, 0 changed, 0 destroyed.
user@ubuntu24:~/git/terraform_dz1/src$ 
user@ubuntu24:~/git/terraform_dz1/src$ ssh adminom@51.250.30.26
Welcome to Ubuntu 24.04.4 LTS (GNU/Linux 6.8.0-138-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Sat Sep  5 14:31:43 UTC 2026

  System load:  1.16               Processes:             116
  Usage of /:   13.0% of 18.72GB   Users logged in:       0
  Memory usage: 18%                IPv4 address for eth0: 10.129.0.32
  Swap usage:   0%


Expanded Security Maintenance for Applications is not enabled.

2 updates can be applied immediately.
To see these additional updates run: apt list --upgradable

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status


*** System restart required ***
Last login: Sat Sep  5 14:23:41 2026 from 77.222.116.215
adminom@compute-vm-2-2-20-hdd-1788617917155:~$ docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS          PORTS                               NAMES
de876ccedbaa   b3b90af2a655   "docker-entrypoint.s…"   40 seconds ago   Up 37 seconds   0.0.0.0:3306->3306/tcp, 33060/tcp   mysql_wHdzPJ0ayIOCkmsm
c262db78f0c3   05b8cb60c354   "/docker-entrypoint.…"   53 seconds ago   Up 40 seconds   0.0.0.0:9090->80/tcp                example_WLqMoINVX6ppyPZF
adminom@compute-vm-2-2-20-hdd-1788617917155:~$ docker exec -it de876ccedbaa env | grep MYSQL
MYSQL_ROOT_HOST=%
MYSQL_PASSWORD=Dxb3RwSM3co3GjkR
MYSQL_DATABASE=wordpress
MYSQL_ROOT_PASSWORD=wHdzPJ0ayIOCkmsm
MYSQL_USER=wordpress
MYSQL_MAJOR=8.4
MYSQL_VERSION=8.4.11-1.el9
MYSQL_SHELL_VERSION=8.4.10-1.el9
adminom@compute-vm-2-2-20-hdd-1788617917155:~$ exit
logout
Connection to 51.250.30.26 closed.
```
</details>

### Правила приёма работы

Домашняя работа оформляется в отдельном GitHub-репозитории в файле README.md.   
Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.

### Критерии оценки

Зачёт ставится, если:

* выполнены все задания,
* ответы даны в развёрнутой форме,
* приложены соответствующие скриншоты и файлы проекта,
* в выполненных заданиях нет противоречий и нарушения логики.

На доработку работу отправят, если:

* задание выполнено частично или не выполнено вообще,
* в логике выполнения заданий есть противоречия и существенные недостатки. 