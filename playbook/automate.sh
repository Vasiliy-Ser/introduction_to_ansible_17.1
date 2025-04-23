#!/bin/bash

# Функция для поднятия контейнеров
start_containers() {
  echo "Поднимаем контейнеры..."
  docker compose up -d
  if [ $? -ne 0 ]; then
    echo "Ошибка при поднятии контейнеров. Завершаю выполнение."
    exit 1
  fi
}

# Функция для запуска ansible playbook
run_ansible_playbook() {
  echo "Запускаем ansible-playbook..."
  ansible-playbook site.yml -i inventory/prod.yml --vault-password-file <(echo "123")
  if [ $? -ne 0 ]; then
    echo "Ошибка при запуске ansible-playbook. Завершаю выполнение."
    stop_containers
    exit 1
  fi
}

# Функция для остановки контейнеров
stop_containers() {
  echo "Останавливаем контейнеры..."
  docker compose down
  if [ $? -ne 0 ]; then
    echo "Ошибка при остановке контейнеров."
    exit 1
  fi
}

# Основная логика
main() {
  # Поднимаем контейнеры
  start_containers
  
  # Запускаем ansible-playbook
  run_ansible_playbook
  
  # Останавливаем контейнеры
  stop_containers

  echo "Все шаги завершены успешно."
}

# Запуск основной логики
main