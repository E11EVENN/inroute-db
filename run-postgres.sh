CONTAINER_NAME=inroute-db
EXTERNAL_PORT=5432
POSTGRES_PASSWORD=postgres
FILE_SQLGZ=init-db.sql.gz
PATH_SCRIPTS=./Scripts/$FILE_SQLGZ

docker run --name $CONTAINER_NAME \
    -p $EXTERNAL_PORT:5432 \
    -e POSTGRES_PASSWORD=$POSTGRES_PASSWORD \
    -d -v $PATH_SCRIPTS:/docker-entrypoint-initdb.d/$FILE_SQLGZ \
    postgres