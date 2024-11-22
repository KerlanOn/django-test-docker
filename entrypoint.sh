#!/bin/bash

echo "Ожидание базы данных..."
while ! nc -z $DB_HOST $DB_PORT; do
  sleep 0.1
done
echo "База данных готова!"

echo "Применение миграций..."
python /app/my_test_project/manage.py migrate

echo "Запуск сервера..."
python /app/my_test_project/manage.py runserver 0.0.0.0:8000
