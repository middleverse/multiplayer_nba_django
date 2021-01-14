DB_CONTAINER=pgdb
DB_NAME=docker
DB_USER=postgres
LOCAL_DUMP_PATH="pg_data/docker_db_dump.sql"

docker-compose up -d "${DB_CONTAINER}"
docker exec -i "${DB_CONTAINER}" psql -U "${DB_USER}" "${DB_NAME}" < "${LOCAL_DUMP_PATH}"
docker-compose stop "${DB_CONTAINER}"
