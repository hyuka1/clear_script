#!/bin/bash

# Функция для сброса кеша страницы, буферов и кеша
clear_memory_cache() {
    echo "Сброс кеша страницы, буферов и кеша..."
    sync
    echo 3 > /proc/sys/vm/drop_caches
}

# Функция для завершения неиспользуемых процессов
kill_unused_processes() {
    echo "Завершение неиспользуемых процессов..."
    # Завершение процессов, потребляющих больше всего памяти (пример)
    ps aux --sort=-%mem | awk 'NR>10{print $2}' | xargs kill -9
}

# Функция для перезагрузки сервера
reboot_server() {
    echo "Перезагрузка сервера..."
    reboot
}

# Очистка памяти и перезагрузка сервера
clear_memory_and_reboot() {
    echo "Начало очистки памяти..."
    clear_memory_cache
    kill_unused_processes
    echo "Очистка памяти завершена."
    reboot_server
}

# Запуск очистки памяти и перезагрузки сервера
clear_memory_and_reboot
