DROP TABLE DEPTO;

/*==============================================================*/
/* Table: DEPTO                                                 */
/*==============================================================*/
CREATE TABLE DEPTO (
   ID                   VARCHAR(2)           NOT NULL,
   NOMBRE               VARCHAR(30)          NOT NULL,
   PAIS_ID              VARCHAR(3)           NOT NULL,
   ESTADO               NUMERIC(1)           NOT NULL,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE NOT NULL,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE NOT NULL,
   USUARIO_ID           VARCHAR(10)          NULL,
   IP_ADDRESS           VARCHAR(15)          NULL,
   CONSTRAINT PK_DEPTO PRIMARY KEY (ID)
);

ALTER TABLE DEPTO
   ADD CONSTRAINT FK_DEPTO_REF_PAIS FOREIGN KEY (PAIS_ID)
      REFERENCES PAIS (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;
