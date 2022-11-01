# API для проекта YaMDb
## Спринт 13 — yamdb_final

![Yamdb Workflow Status](https://github.com/anthonyhol/yamdb_final/actions/workflows/yamdb_workflow.yml/badge.svg?branch=master&event=push)

### Описание
Проект YaMDb собирает отзывы (Review) пользователей на произведения (Title). Произведения делятся на категории: «Книги», «Фильмы», «Музыка». Список категорий (Category) может быть расширен.

### Технологии
- Python 3.7
- Django 2.2.19
- Django Rest Framework 3.12.4
- SimpleJWT 4.8.0

### Запуск проекта в dev-режиме
```bash
git clone git@github.com:anthonyhol/yamdb_final.git
```
```bash
cd yamdb_final
```

### Создаем виртуальное окружение:
```bash
python3 -m venv venv
```

### Активируем виртуальное окружение:
```bash
source venv/bin/activate
```
### Обновим pip:
```bash
python -m pip install --upgrade pip 
```

### Устанавливаем зависимости из requirements.txt:
```bash
pip install -r api_yamdb/requirements.txt 
```

### Переходим в директорию с файлом docker-compose.yaml (должен быть установлен Docker):
```bash
cd infra
```

### Запускаем Docker:
```bash
sudo systemctl start docker
```

### Смотрим статус (выдаст статус, много букв):
```bash
sudo systemctl status docker
```

### В случае отсутствия PostgreSQL, установим его:
```bash
sudo apt install postgresql postgresql-contrib -y
```

### В директории infra создадим файл с переменными окружения:
```bash
touch .env
```
```bash
nano .env
```
```
DB_ENGINE=django.db.backends.postgresql
DB_NAME=test_base
POSTGRES_USER=test_user
POSTGRES_PASSWORD=test_pass
DB_HOST=127.0.0.1
DB_PORT=5432
```

### Настройка PostreSQL (установка русского языка ОС, создание пользователя и БД)
#### Устанавливаем локализацию системы как ru_RU.UTF-8:
```bash
sudo dpkg-reconfigure locales 
```

#### Проверка верности настройки локализации для PostgreSQL
```bash
sudo -u postgres psql
```

#### Создание БД
```sql
CREATE DATABASE test_base;
```

### Создание пользователя
```sql
CREATE USER test_user WITH ENCRYPTED PASSWORD 'test_pass';
```

#### Настройка прав пользователя
```sql
GRANT ALL PRIVILEGES ON DATABASE test_base TO test_user;
```

### В settings/secrets/actions для репозитория на GitHub необходимо определить значение следующих переменных:
- Логин и пароль от аккаунта на DockerHub:
```DOCKER_USERNAME```, ```DOCKER_PASSWORD```

- Адрес хоста, username пользователя и SSH-ключ для доступа к нему:
```HOST```, ```USER```, ```SSH_KEY```

- ID пользователя, кому отправлять уведомления и токен ТГ-бота:
```TELEGRAM_TO```, 
```TELEGRAM_TOKEN```, 


### Документация API YaMDb 
Документация доступна по эндпойнту: http://localhost:8000/redoc/

### Панель администратора API YaMDb 
Панель администратора доступна по эндпойнту: http://localhost:8000/admin/

Автор: [Холкин Антон](https://github.com/AnthonyHol/ "Холкин Антон")
