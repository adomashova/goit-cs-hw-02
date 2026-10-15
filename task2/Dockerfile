# Базовий образ Python (залежності застосунку підтримують Python 3.10+)
FROM python:3.11-slim

# Не створювати .pyc та одразу виводити логи в консоль
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Системні бібліотеки для збірки psycopg2 (драйвер PostgreSQL)
RUN apt-get update \
    && apt-get install -y --no-install-recommends gcc libc6-dev libpq-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Спочатку залежності, щоб Docker кешував цей шар
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Код застосунку
COPY . .

EXPOSE 8000

# 0.0.0.0, щоб застосунок був доступний ззовні контейнера
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]