# Django Микросервисы с Docker

Этот проект демонстрирует, как настроить архитектуру микросервисов на базе Django с использованием Docker. Проект состоит из следующих сервисов:

- **Django Web Service**: Основной веб-сервис, на котором работает Django-приложение.
- **PostgreSQL Database**: Сервис базы данных PostgreSQL для хранения данных.

## Требования

- Docker
- Docker Compose

## Начало работы

### 1. Клонирование репозитория

Сначала клонируйте репозиторий на вашу локальную машину:


### 2. Построение и запуск контейнеров

Для построения и запуска сервисов используйте Docker Compose. Из корневой директории проекта выполните команду:

```bash
docker-compose up --build
```

Эта команда:
- Построит образы для сервисов web и db.
- Запустит сервисы, определенные в `docker-compose.yml`.

После того как контейнеры запустятся, Docker настроит веб-сервер и базу данных.

### 3. Применение миграций

После того как сервисы будут запущены, автоматически применятся миграции для настройки схемы базы данных.


### 4. Доступ к приложению

- Веб-приложение Django будет доступно по адресу `http://localhost:8000`.
- Административная панель Django будет доступна по адресу `http://localhost:8000/admin` (по умолчанию нужно будет настроить учетные данные администратора).

### 5. Взаимодействие с API

Вы можете взаимодействовать с приложением через REST API, которое включает следующие конечные точки:

- `GET /users/`: Список всех пользователей.
- `POST /users/`: Создание нового пользователя.
- `GET /orders/`: Список всех заказов.
- `POST /orders/`: Создание нового заказа (необходимо указать ID пользователя).

### 6. Остановка контейнеров

Для остановки сервисов выполните команду:

```bash
docker-compose down
```

Это остановит и удалит контейнеры, сети и тома.

## Разработка

### 1. Установка зависимостей

Если вам нужно установить или обновить зависимости для проекта Django, выполните следующую команду внутри контейнера `web`:

```bash
docker-compose exec web pip install -r requirements.txt
```

### 2. Перестроение Docker-образов

Если вы вносили изменения в Dockerfile или файл `docker-compose.yml`, пересоберите образы с помощью:

```bash
docker-compose up --build
```

### 3. Запуск тестов

Для выполнения тестов в Django-приложении выполните:

```bash
docker-compose exec web python manage.py test
```

## Примечания

- База данных инициализируется с использованием PostgreSQL. Стандартные параметры подключения указаны в файле настроек Django (`DATABASES`).
- Веб-сервис автоматически перезагружается при изменении кода в процессе разработки (с помощью `StatReloader`).
