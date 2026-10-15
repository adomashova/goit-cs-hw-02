# goit-cs-hw-02

Домашнє завдання до модуля «Основи операційних систем».

## Структура

```
goit-cs-hw-02/
├── README.md
├── .gitignore
├── screenshots/               скріншоти результатів
├── task1/
│   └── check_sites.sh         Завдання 1: Bash-скрипт перевірки сайтів
└── task2/                     Завдання 2: FastAPI + PostgreSQL у Docker
    ├── Dockerfile
    ├── docker-compose.yaml
    ├── requirements.txt
    ├── main.py
    ├── conf/db.py
    ├── static/
    └── templates/
```

## Завдання 1. Перевірка вебсайтів

```bash
cd task1
chmod +x check_sites.sh
./check_sites.sh
cat website_status.log
```

Скрипт обходить масив сайтів у циклі `for`, надсилає GET-запит через `curl` (з підтримкою переадресацій `-L`), вважає сайт доступним лише при фінальному коді HTTP 200 і записує результат у `website_status.log`:

```
<https://google.com> is UP
<https://facebook.com> is UP
<https://twitter.com> is UP
```

Після завершення виводиться повідомлення з назвою файлу логів.

## Завдання 2. FastAPI + PostgreSQL у Docker Compose

Застосунок клоновано з https://github.com/GoIT-Python-Web/Computer-Systems-hw02.

Зміни відносно оригіналу:
- `conf/db.py`: у `SQLALCHEMY_DATABASE_URL` замість `localhost` вказано ім'я сервісу `postgres` з `docker-compose.yaml`;
- `requirements.txt`: перекодовано з UTF-16 в UTF-8 (інакше `pip` не може його прочитати);
- додано `Dockerfile`, `docker-compose.yaml`, `.dockerignore`.

### Запуск

```bash
cd task2
docker-compose up --build
```

У новіших версіях Docker та сама команда пишеться з пробілом: `docker compose up --build`.

Дочекайтесь у логах рядків `database system is ready to accept connections` та `Uvicorn running on http://0.0.0.0:8000`.

### Перевірка

1. Відкрийте http://localhost:8000: сторінка «Домашня робота: Введення в Docker та контейнеризацію».
2. Натисніть **Перевірити БД**: має з'явитися `Welcome to FastAPI!`.
3. Те саме з терміналу: `curl http://localhost:8000/healthchecker` повертає `{"message":"Welcome to FastAPI!"}`.

### Зупинка

```bash
docker-compose down        # зупинити контейнери
docker-compose down -v     # зупинити та видалити дані БД
```
