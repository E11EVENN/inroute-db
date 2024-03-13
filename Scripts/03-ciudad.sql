DROP TABLE CIUDAD;

/*==============================================================*/
/* Table: CIUDAD                                                */
/*==============================================================*/
CREATE TABLE CIUDAD (
   ID                   VARCHAR(3)           NOT NULL,
   NOMBRE               VARCHAR(30)          NOT NULL,
   DEPTO_ID             VARCHAR(2)           NOT NULL,
   ESTADO               NUMERIC(1)           NOT NULL,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE NOT NULL,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE NOT NULL,
   USUARIO_ID           VARCHAR(10)          NULL,
   IP_ADDRESS           VARCHAR(15)          NULL,
   CONSTRAINT PK_CIUDAD PRIMARY KEY (ID)
);

ALTER TABLE CIUDAD
   ADD CONSTRAINT FK_CIUDAD_REF_DEPTO FOREIGN KEY (DEPTO_ID)
      REFERENCES DEPTO (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;
