# Запуск мониторинга

Сборка образа:
docker build -t my-script .

Запуск через Compose:
mkdir -p runtime
touch runtime/monitor.log
docker compose up -d --build

Проверка:
docker compose ps
cat runtime/monitor.log

Остановка:
docker compose down

Учебное хранилище:
RAID 1 из двух loop-устройств смонтирован в /mnt/raid.
LVM-том vg_data/lv_logs смонтирован в /mnt/logs.
Файлы-диски расположены в /mnt/raid-lab.
