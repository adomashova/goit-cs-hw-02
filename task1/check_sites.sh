#!/bin/bash

# Скрипт перевіряє доступність вебсайтів за допомогою curl
# і записує результати у файл логів.

# Список сайтів для перевірки
websites=(
    "https://google.com"
    "https://facebook.com"
    "https://twitter.com"
)

# Файл логів (поруч зі скриптом, незалежно від поточної директорії)
log_file="$(dirname "$0")/website_status.log"

# Очищаємо файл логів перед новою перевіркою
: > "$log_file"

for site in "${websites[@]}"; do
    # -s: без прогрес-бару, -L: йти за переадресаціями (301/302),
    # -o /dev/null: не виводити тіло відповіді,
    # -w "%{http_code}": вивести лише фінальний HTTP-код,
    # --max-time: не чекати довше 10 секунд
    status_code=$(curl -s -L -o /dev/null -w "%{http_code}" --max-time 10 "$site")

    if [ "$status_code" -eq 200 ]; then
        echo "<$site> is UP" >> "$log_file"
    else
        echo "<$site> is DOWN" >> "$log_file"
    fi
done

echo "Результати перевірки записано у файл $log_file"
