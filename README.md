# InRoute-DB

Estructura Repositorio

## Data
Informacion para cargar en la base de datos, ver aqui [Data](./Data)

## Diagramas
Modelos entidad relacion de cada uno de los dominios de la base de datos del proyecto InRoute, ver aqui [Diagrams](./Diagrams)

| Dominio        | Diagrama                                                          |
| -------------- | ----------------------------------------------------------------- |
| Persona        | ![modelo-persona.svg](./Diagrams/modelo-persona.svg)              |
| Chat           | ![modelo-chat.svg](./Diagrams/modelo-chat.svg)                    |
| Entrenamiento  | ![modelo-entrenamiento.svg](./Diagrams/modelo-entrenamiento.svg)  |
| Facturacion    | ![modelo-facturacion.svg](./Diagrams/modelo-facturacion.svg)      |
| Membresia      | ![modelo-membresia.svg](./Diagrams/modelo-membresia.svg)          |
| Geografico     | ![modelo-geografico.svg](./Diagrams/modelo-geografico.svg)        |


## Scripts
Scripts para crear la base de datos y cargar informacion, ver aqui [Scripts](./Scripts)

Para hidratar el modelo de datos, es necesario generar el archivo init-db.sql.gz y posteriormente lanzar la base de datos, para lo cual se debe ejecutar lo siguiente:
```sh:
./run-createdata.sh
./run-postgres.sh
```
