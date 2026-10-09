#!/usr/bin/env bash
set -euo pipefail

INTERVAL=10
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
LOG_FILE="${LOG_FILE:-$SCRIPT_DIR/monitor.log}"

if ! touch "$LOG_FILE"; then
    printf 'Ошибка: невозможно записывать в %s\n' "$LOG_FILE" >&2
    exit 1
fi

trap 'printf "\nМониторинг остановлен.\n"; exit 0' INT TERM

printf 'Мониторинг каждые %s секунд. Лог: %s\n' "$INTERVAL" "$LOG_FILE"
printf 'Для остановки нажми Ctrl+C.\n'

while true; do
    {
        printf -- '--- %s ---\n' "$(date '+%Y-%m-%d %H:%M:%S')"
        free -h
        df -h
        uptime
        printf '\n'
    } >> "$LOG_FILE"

    sleep "$INTERVAL"
done
