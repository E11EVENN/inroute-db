DROP TABLE PAIS;

/*==============================================================*/
/* Table: PAIS                                                  */
/*==============================================================*/
CREATE TABLE PAIS (
   ID                   VARCHAR(3)           NOT NULL,
   NOMBRE               VARCHAR(40)          NOT NULL,
   INDICATIVO_TELEFONICO NUMERIC(4)           NOT NULL,
   ESTADO               NUMERIC(1)           NOT NULL,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE NOT NULL,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE NOT NULL,
   USUARIO_ID           VARCHAR(10)          NULL,
   IP_ADDRESS           VARCHAR(15)           NULL,
   CONSTRAINT PK_PAIS PRIMARY KEY (ID)
);
