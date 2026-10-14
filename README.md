# t-learn

## Локальный запуск в Windows

```bat
run.bat example.env
run.bat "C:\path with spaces\app.env"
```

Путь к файлу окружения обязателен. Относительный путь считается от текущей
директории. Скрипт загружает строки `KEY=value` и запускает `gradlew.bat bootRun`
из директории проекта. Пустые строки и комментарии, начинающиеся с `#`, пропускаются.
Значения указываются без обрамляющих кавычек. Переменные действуют только во время
запуска скрипта и переопределяют одноимённые переменные текущего окружения.

## Docker

Сборка образа:

```sh
docker build -t t-learn .
```

Запуск с PostgreSQL на компьютере с Docker Desktop:

```sh
docker run --rm -p 9090:9090 --env-file example.env -e PROFILE=prod -e DB_URL=jdbc:postgresql://host.docker.internal:5432/postgres t-learn
```

Укажите актуальные `DB_USERNAME` и `DB_PASSWORD` в файле окружения.
Для PostgreSQL на другом сервере замените `DB_URL` на его адрес.
Профиль `prod` использует настройки БД из переменных окружения;
профиль `dev` задаёт их в `application-dev.yaml`.

Приложение доступно по адресу <http://localhost:9090/hello>.
