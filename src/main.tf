terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
    }
  }
  required_version = "~>1.12.0" /*Многострочный комментарий.
 Требуемая версия terraform */
}

# Провайдер Docker подключается к удалённой ВМ через SSH
provider "docker" {
  # Адрес SSH-подключения к ВМ
  host = "ssh://adminom@51.250.30.26:22"
  # Отключаем проверку ключа хоста для упрощения
  ssh_opts = ["-o", "StrictHostKeyChecking=no"]
}
#====================Ресурсы для MySQL========================

# Генерация пароля для root пользователя MySQL
resource "random_password" "mysql_root" {
  length  = 16
  special = false
}

# Генерация пароля для пользователя wordpress
resource "random_password" "mysql_password" {
  length  = 16
  special = false
}

# Образ mysql:8 – keep_locally = false, поэтому при destroy образ будет удалён
resource "docker_image" "mysql" {
  name         = "mysql:8"
  keep_locally = false
}

# Контейнер MySQL, запускаемый на удалённой ВМ через SSH
resource "docker_container" "mysql" {
  image = docker_image.mysql.image_id
  # Имя контейнера формируется (как в примере с nginx)
  name = "mysql_${random_password.mysql_root.result}"
  # Проброс порта: внутренний 3306 на внешний 3306
  ports {
    internal = 3306
    external = 3306
  }

  # Переменные окружения для MySQL пароли подставляются из random_password
  env = [
    "MYSQL_ROOT_PASSWORD=${random_password.mysql_root.result}",
    "MYSQL_DATABASE=wordpress",
    "MYSQL_USER=wordpress",
    "MYSQL_PASSWORD=${random_password.mysql_password.result}",
    "MYSQL_ROOT_HOST=%"
  ]
}
#однострочный комментарий
#=================Ресурсы для Nginx (старый код из основного зададания)==============
resource "random_password" "random_string" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}


resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true  # именно эта настройка оставляет образ после destroy
}

# Контейнер nginx, имя которого формируется с помощью random_password
resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "example_${random_password.random_string.result}"

  ports {
    internal = 80
    external = 9090
  }
}

