/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     30/03/2024 4:08:19 p. m.                     */
/*==============================================================*/


DROP TABLE CIUDAD;

DROP TABLE CUPON;

DROP TABLE DEPTO;

DROP TABLE ENTRENAMIENTO;

DROP TABLE ENTRENAMIENTO_ACTIVIDAD;

DROP TABLE ENTRENAMIENTO_PLAN;

DROP TABLE ENTRENAMIENTO_SEGUIMIENTO;

DROP TABLE FACTURA;

DROP TABLE FACTURA_DETALLE;

DROP TABLE FACTURA_ESTADO;

DROP TABLE MEMBRESIA;

DROP TABLE MEMBRESIA_SERVICIOS;

DROP TABLE MONEDA;

DROP TABLE PAGO;

DROP TABLE PAGO_DETALLES;

DROP TABLE PAGO_ESTADO;

DROP TABLE PAGO_FACTURAS;

DROP TABLE PAIS;

DROP TABLE PERSONA;

DROP TABLE PERSONA_EMAILS;

DROP TABLE PERSONA_ROLES;

DROP TABLE PERSONA_TELEFONOS;

DROP TABLE PROCEDIMIENTO;

DROP TABLE PROCESO;

DROP TABLE PRODUCTO;

DROP TABLE PRODUCTO_COSTO;

DROP TABLE PUNTO_VENTA;

DROP TABLE RESOLUCION;

DROP TABLE RESOLUCION_SEC;

DROP TABLE ROL_PERSONA;

DROP TABLE SERVICIO;

DROP TABLE TIPO_ACTIVIDAD;

DROP TABLE TIPO_CUPON;

DROP TABLE TIPO_DOCUMENTO;

DROP TABLE TIPO_EMAIL;

DROP TABLE TIPO_ENTRENAMIENTO;

DROP TABLE TIPO_PAGO;

DROP TABLE TIPO_PRODUCTO;

DROP TABLE TIPO_PUNTO_VENTA;

DROP TABLE TIPO_SERVICIO;

DROP TABLE TIPO_TELEFONO;

DROP TABLE USUARIO;

DROP SEQUENCE ENTRENAMIENTO_ACTIVIDAD_SEQ;

DROP SEQUENCE ENTRENAMIENTO_PLAN_SEQ;

DROP SEQUENCE ENTRENAMIENTO_SEGUIMIENTO_SEQ;

DROP SEQUENCE FACTURA_DETALLE_SEQ;

DROP SEQUENCE FACTURA_SEQ;

DROP SEQUENCE MEMBRESIA_SERVICIOS_SEQ;

DROP SEQUENCE PAGO_DETALLES_SEQ;

DROP SEQUENCE PAGO_FACTURAS_SEQ;

DROP SEQUENCE PAGO_SEQ;

DROP SEQUENCE PERSONA_EMAILS_SEQ;

DROP SEQUENCE PERSONA_SEQ;

DROP SEQUENCE PERSONA_TELEFONOS_SEQ;

DROP SEQUENCE PRODUCTO_COSTO_SEQ;

DROP SEQUENCE RESOLUCION_SEC_SEQ;

DROP SEQUENCE RESOLUCION_SEQ;

CREATE SEQUENCE ENTRENAMIENTO_ACTIVIDAD_SEQ
INCREMENT 1
START 0;

CREATE SEQUENCE ENTRENAMIENTO_PLAN_SEQ
INCREMENT 1
START 0;

CREATE SEQUENCE ENTRENAMIENTO_SEGUIMIENTO_SEQ
INCREMENT 1
START 0;

CREATE SEQUENCE FACTURA_DETALLE_SEQ
INCREMENT 1
START 0;

CREATE SEQUENCE FACTURA_SEQ
INCREMENT 1
START 0;

CREATE SEQUENCE MEMBRESIA_SERVICIOS_SEQ
INCREMENT 1
START 0;

CREATE SEQUENCE PAGO_DETALLES_SEQ
INCREMENT 1
START 0;

CREATE SEQUENCE PAGO_FACTURAS_SEQ
INCREMENT 1
START 0;

CREATE SEQUENCE PAGO_SEQ
INCREMENT 1
START 0;

CREATE SEQUENCE PERSONA_EMAILS_SEQ
INCREMENT 1
START 0;

CREATE SEQUENCE PERSONA_SEQ
INCREMENT 1
START 0;

CREATE SEQUENCE PERSONA_TELEFONOS_SEQ
INCREMENT 1
START 0;

CREATE SEQUENCE PRODUCTO_COSTO_SEQ
INCREMENT 1
START 0;

CREATE SEQUENCE RESOLUCION_SEC_SEQ
INCREMENT 1
START 0;

CREATE SEQUENCE RESOLUCION_SEQ
INCREMENT 1
START 0;

/*==============================================================*/
/* Table: CIUDAD                                                */
/*==============================================================*/
CREATE TABLE CIUDAD (
   ID                   VARCHAR(3)           NOT NULL,
   NOMBRE               VARCHAR(30)          NOT NULL,
   DEPTO_ID             VARCHAR(2)           NOT NULL,
   ESTADO               NUMERIC(1)           NULL DEFAULT 1,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
   USUARIO_ID           VARCHAR(10)          NULL,
   IP_ADDRESS           VARCHAR(15)          NULL,
   CONSTRAINT PK_CIUDAD PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: CUPON                                                 */
/*==============================================================*/
CREATE TABLE CUPON (
   ID                   VARCHAR(5)           NOT NULL,
   TIPO_CUPON_ID        VARCHAR(2)           NOT NULL,
   NOMBRE               VARCHAR(20)          NOT NULL,
   DESCUENTO_PORCENTAJE NUMERIC(5,2)         NULL DEFAULT 0
      CONSTRAINT CKC_DESCUENTO_PORCENT_CUPON CHECK (DESCUENTO_PORCENTAJE IS NULL OR (DESCUENTO_PORCENTAJE BETWEEN 0 AND 100)),
   MONEDA_ID            VARCHAR(3)           NOT NULL,
   VALOR                NUMERIC(15,2)        NULL DEFAULT 0,
   VALOR_TOPE           NUMERIC(15,2)        NULL DEFAULT 0,
   APLICA_TOPE          NUMERIC(1)           NULL DEFAULT 0
      CONSTRAINT CKC_APLICA_TOPE_CUPON CHECK (APLICA_TOPE IS NULL OR (APLICA_TOPE BETWEEN 0 AND 1)),
   VIGENTE_DESDE        DATE                 NULL DEFAULT CURRENT_DATE,
   VIGENTE_HASTA        DATE                 NULL DEFAULT CURRENT_DATE,
   ESTADO               NUMERIC(1)           NULL DEFAULT 1,
   CONSTRAINT PK_CUPON PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: DEPTO                                                 */
/*==============================================================*/
CREATE TABLE DEPTO (
   ID                   VARCHAR(2)           NOT NULL,
   NOMBRE               VARCHAR(30)          NOT NULL,
   PAIS_ID              VARCHAR(3)           NOT NULL,
   ESTADO               NUMERIC(1)           NULL DEFAULT 1,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
   USUARIO_ID           VARCHAR(10)          NULL,
   IP_ADDRESS           VARCHAR(15)          NULL,
   CONSTRAINT PK_DEPTO PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: ENTRENAMIENTO                                         */
/*==============================================================*/
CREATE TABLE ENTRENAMIENTO (
   ID                   VARCHAR(5)           NOT NULL,
   NOMBRE               VARCHAR(25)          NOT NULL,
   PROCEDIMIENTO_ID     VARCHAR(5)           NOT NULL,
   TIPO_ENTRENAMIENTO_ID VARCHAR(2)           NOT NULL,
   DESCRIPCION          VARCHAR(100)         NULL,
   URL_VIDEO            VARCHAR(200)         NULL,
   ESTADO               NUMERIC(1)           NULL DEFAULT 1,
   CONSTRAINT PK_ENTRENAMIENTO PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: ENTRENAMIENTO_ACTIVIDAD                               */
/*==============================================================*/
CREATE TABLE ENTRENAMIENTO_ACTIVIDAD (
   ID                   NUMERIC(4)           NOT NULL DEFAULT NEXTVAL('entrenamiento_actividad_seq'),
   ENTRENAMIENTO_ID     VARCHAR(5)           NOT NULL,
   TIPO_ACTIVIDAD_ID    VARCHAR(2)           NOT NULL,
   NOMBRE               VARCHAR(25)          NOT NULL,
   DESCRIPCION          VARCHAR(100)         NULL,
   URL_VIDEO            VARCHAR(200)         NULL,
   SERIES               NUMERIC(10)          NULL,
   CANTIDAD             NUMERIC(10)          NULL,
   MIN_DESCANSO         TIME                 NULL,
   TIEMPO_ESTIMADO      TIME                 NULL,
   TIEMPO_MARCA         TIME                 NULL,
   ORDEN                NUMERIC(2)           NULL,
   UBICACION            NUMERIC(1)           NULL DEFAULT 1,
   ESTADO               NUMERIC(1)           NULL DEFAULT 1,
   CONSTRAINT PK_ENTRENAMIENTO_ACTIVIDAD PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: ENTRENAMIENTO_PLAN                                    */
/*==============================================================*/
CREATE TABLE ENTRENAMIENTO_PLAN (
   ID                   NUMERIC(15)          NOT NULL DEFAULT NEXTVAL('entrenamiento_plan_seq'),
   ENTRENAMIENTO_ID     VARCHAR(5)           NOT NULL,
   ENTRENADOR_ID        NUMERIC(10)          NOT NULL,
   ATLETA_ID            NUMERIC(10)          NOT NULL,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
   ESTADO               NUMERIC(1)           NULL DEFAULT 1,
   USUARIO_ID           VARCHAR(10)          NULL,
   IP_ADDRESS           VARCHAR(15)          NULL,
   CONSTRAINT PK_ENTRENAMIENTO_PLAN PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: ENTRENAMIENTO_SEGUIMIENTO                             */
/*==============================================================*/
CREATE TABLE ENTRENAMIENTO_SEGUIMIENTO (
   ID                   NUMERIC(20)          NOT NULL DEFAULT NEXTVAL('entrenamiento_seguimiento_seq'),
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
   ENTRENAMIENTO_PLAN_ID NUMERIC(15)          NOT NULL DEFAULT NEXTVAL('entrenamiento_plan_seq'),
   ENTRENAMIENTO_ACTIVIDAD_ID NUMERIC(4)           NOT NULL,
   LATITUD              DECIMAL              NULL,
   LONGITUD             DECIMAL              NULL,
   RESPUESTA            VARCHAR(100)         NULL,
   USUARIO_ID           VARCHAR(10)          NULL,
   IP_ADDRESS           VARCHAR(15)          NULL,
   CONSTRAINT PK_ENTRENAMIENTO_SEGUIMIENTO PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
CREATE TABLE FACTURA (
   ID                   NUMERIC(15)          NOT NULL DEFAULT NEXTVAL('factura_seq'),
   FECHA                DATE                 NOT NULL DEFAULT CURRENT_DATE,
   RESOLUCION_SEC_ID    NUMERIC(5)           NOT NULL,
   PUNTO_VENTA_ID       VARCHAR(5)           NOT NULL,
   CLIENTE_PERSONA_ID   NUMERIC(10)          NOT NULL,
   MONEDA_ID            VARCHAR(3)           NOT NULL,
   VALOR_TOTAL          NUMERIC(15,2)        NOT NULL DEFAULT 0,
   FACTURA_ESTADO_ID    VARCHAR(5)           NULL,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
   USUARIO_ID           VARCHAR(10)          NULL,
   IP_ADDRESS           VARCHAR(15)          NULL,
   CONSTRAINT PK_FACTURA PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: FACTURA_DETALLE                                       */
/*==============================================================*/
CREATE TABLE FACTURA_DETALLE (
   ID                   NUMERIC(20)          NOT NULL DEFAULT NEXTVAL('factura_detalle_seq'),
   FACTURA_ID           NUMERIC(15)          NOT NULL,
   PRODUCTO_SERVICIO_ID VARCHAR(6)           NOT NULL,
   DESCUENTO_PORCENTAJE NUMERIC(5,2)         NULL DEFAULT 0
      CONSTRAINT CKC_DESCUENTO_PORCENT_FACTURA_ CHECK (DESCUENTO_PORCENTAJE IS NULL OR (DESCUENTO_PORCENTAJE BETWEEN 0 AND 100)),
   VALOR_NETO           NUMERIC(15,2)        NOT NULL DEFAULT 0,
   VALOR_TOTAL          NUMERIC(15,2)        NOT NULL DEFAULT 0,
   ESTADO               NUMERIC(1)           NULL DEFAULT 1,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
   USUARIO_ID           VARCHAR(10)          NULL,
   IP_ADDRESS           VARCHAR(15)          NULL,
   CONSTRAINT PK_FACTURA_DETALLE PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: FACTURA_ESTADO                                        */
/*==============================================================*/
CREATE TABLE FACTURA_ESTADO (
   ID                   VARCHAR(5)           NOT NULL,
   SIGUIENTE            VARCHAR(5)           NULL,
   PREVIO               VARCHAR(5)           NULL,
   INICIAL              NUMERIC(1)           NULL DEFAULT 0
      CONSTRAINT CKC_INICIAL_FACTURA_ CHECK (INICIAL IS NULL OR (INICIAL BETWEEN 0 AND 1)),
   FINAL                NUMERIC(1)           NULL DEFAULT 0
      CONSTRAINT CKC_FINAL_FACTURA_ CHECK (FINAL IS NULL OR (FINAL BETWEEN 0 AND 1)),
   CONSTRAINT PK_FACTURA_ESTADO PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: MEMBRESIA                                             */
/*==============================================================*/
CREATE TABLE MEMBRESIA (
   ID                   VARCHAR(3)           NOT NULL,
   NOMBRE               VARCHAR(20)          NOT NULL,
   DESCRIPCION          VARCHAR(100)         NOT NULL,
   VIGENTE_DESDE        DATE                 NOT NULL,
   VIGENTE_HASTA        DATE                 NULL,
   CONSTRAINT PK_MEMBRESIA PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: MEMBRESIA_SERVICIOS                                   */
/*==============================================================*/
CREATE TABLE MEMBRESIA_SERVICIOS (
   ID                   NUMERIC(5)           NOT NULL DEFAULT NEXTVAL('membresia_servicios_seq'),
   MEMBRESIA_ID         VARCHAR(3)           NOT NULL,
   SERVICIO_ID          VARCHAR(3)           NOT NULL,
   ESTADO               NUMERIC(1)           NULL DEFAULT 1,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
   USUARIO_ID           VARCHAR(10)          NULL,
   IP_ADDRESS           VARCHAR(15)          NULL,
   CONSTRAINT PK_MEMBRESIA_SERVICIOS PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: MONEDA                                                */
/*==============================================================*/
CREATE TABLE MONEDA (
   ID                   VARCHAR(3)           NOT NULL,
   NOMBRE               VARCHAR(20)          NOT NULL,
   SIMBOLO              VARCHAR(3)           NOT NULL,
   PAIS_ID              VARCHAR(3)           NOT NULL,
   CONSTRAINT PK_MONEDA PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: PAGO                                                  */
/*==============================================================*/
CREATE TABLE PAGO (
   ID                   NUMERIC(15)          NOT NULL DEFAULT NEXTVAL('pago_seq'),
   FECHA                DATE                 NOT NULL,
   PUNTO_VENTA_ID       VARCHAR(5)           NOT NULL,
   PAGO_ESTADO_ID       VARCHAR(5)           NULL,
   TOTAL_FACTURAS       NUMERIC(15,2)        NOT NULL DEFAULT 0,
   TOTAL_PAGOS          NUMERIC(15,2)        NOT NULL DEFAULT 0,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
   USUARIO_ID           VARCHAR(10)          NULL,
   IP_ADDRESS           VARCHAR(15)          NULL,
   CONSTRAINT PK_PAGO PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: PAGO_DETALLES                                         */
/*==============================================================*/
CREATE TABLE PAGO_DETALLES (
   ID                   NUMERIC(20)          NOT NULL DEFAULT NEXTVAL('pago_detalles_seq'),
   PAGO_ID              NUMERIC(15)          NOT NULL,
   TIPO_PAGO_ID         VARCHAR(2)           NOT NULL,
   CUPO_ID              VARCHAR(5)           NULL,
   MONEDA_ID            VARCHAR(3)           NOT NULL,
   VALOR                NUMERIC(15,2)        NOT NULL DEFAULT 0,
   AUTORIZACION_FRANQUICIA VARCHAR(20)          NULL,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
   USUARIO_ID           VARCHAR(10)          NULL,
   IP_ADDRESS           VARCHAR(15)          NULL,
   CONSTRAINT PK_PAGO_DETALLES PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: PAGO_ESTADO                                           */
/*==============================================================*/
CREATE TABLE PAGO_ESTADO (
   ID                   VARCHAR(5)           NOT NULL,
   SIGUIENTE            VARCHAR(5)           NULL,
   PREVIO               VARCHAR(5)           NULL,
   INICIAL              NUMERIC(1)           NULL DEFAULT 0
      CONSTRAINT CKC_INICIAL_PAGO_EST CHECK (INICIAL IS NULL OR (INICIAL BETWEEN 0 AND 1)),
   FINAL                NUMERIC(1)           NULL DEFAULT 0
      CONSTRAINT CKC_FINAL_PAGO_EST CHECK (FINAL IS NULL OR (FINAL BETWEEN 0 AND 1)),
   CONSTRAINT PK_PAGO_ESTADO PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: PAGO_FACTURAS                                         */
/*==============================================================*/
CREATE TABLE PAGO_FACTURAS (
   ID                   NUMERIC(20)          NOT NULL DEFAULT NEXTVAL('pago_facturas_seq'),
   PAGO_ID              NUMERIC(15)          NOT NULL,
   FACTURA_ID           NUMERIC(15)          NOT NULL,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
   CONSTRAINT PK_PAGO_FACTURAS PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: PAIS                                                  */
/*==============================================================*/
CREATE TABLE PAIS (
   ID                   VARCHAR(3)           NOT NULL,
   NOMBRE               VARCHAR(40)          NOT NULL,
   INDICATIVO_TELEFONICO NUMERIC(4)           NOT NULL,
   ESTADO               NUMERIC(1)           NULL DEFAULT 1,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
   USUARIO_ID           VARCHAR(10)          NULL,
   IP_ADDRESS           VARCHAR(15)          NULL,
   CONSTRAINT PK_PAIS PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: PERSONA                                               */
/*==============================================================*/
CREATE TABLE PERSONA (
   ID                   NUMERIC(10)          NOT NULL DEFAULT NEXTVAL('persona_seq'),
   NOMBRE               VARCHAR(20)          NOT NULL,
   NOMBRE_SEC           VARCHAR(20)          NULL,
   APELLIDO             VARCHAR(40)          NOT NULL,
   APELLIDO_SEC         VARCHAR(40)          NULL,
   TIPO_DOCUMENTO_ID    VARCHAR(2)           NOT NULL,
   DOCUMENTO            VARCHAR(20)          NOT NULL,
   FECHA_NACIMIENTO     DATE                 NOT NULL,
   NACIONALIDAD_PAIS_ID VARCHAR(3)           NOT NULL,
   LUGAR_NACIMIENTO_CIUDAD_ID VARCHAR(3)           NOT NULL,
   ESTADO               NUMERIC(1)           NULL DEFAULT 1,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
   USUARIO_ID           VARCHAR(10)          NULL,
   IP_ADDRESS           VARCHAR(15)          NULL,
   CONSTRAINT PK_PERSONA PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: PERSONA_EMAILS                                        */
/*==============================================================*/
CREATE TABLE PERSONA_EMAILS (
   ID                   NUMERIC(10)          NOT NULL DEFAULT NEXTVAL('persona_emails_seq'),
   PERSONA_ID           NUMERIC(10)          NOT NULL,
   TIPO_EMAIL_ID        VARCHAR(3)           NOT NULL,
   EMAIL                VARCHAR(50)          NOT NULL,
   ESTADO               NUMERIC(1)           NULL DEFAULT 1,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
   USUARIO_ID           VARCHAR(10)          NULL,
   IP_ADDRESS           VARCHAR(15)          NULL,
   CONSTRAINT PK_PERSONA_EMAILS PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: PERSONA_ROLES                                         */
/*==============================================================*/
CREATE TABLE PERSONA_ROLES (
   PERSONA_ID           NUMERIC(10)          NOT NULL,
   ROL_PERSONA_ID       VARCHAR(3)           NOT NULL,
   PERSONA_TELEFONOS_ID NUMERIC(5)           NULL,
   ESTADO               NUMERIC(1)           NULL DEFAULT 1,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
   USUARIO_ID           VARCHAR(10)          NULL,
   IP_ADDRESS           VARCHAR(15)          NULL,
   CONSTRAINT PK_PERSONA_ROLES PRIMARY KEY (PERSONA_ID, ROL_PERSONA_ID)
);

/*==============================================================*/
/* Table: PERSONA_TELEFONOS                                     */
/*==============================================================*/
CREATE TABLE PERSONA_TELEFONOS (
   ID                   NUMERIC(5)           NOT NULL DEFAULT NEXTVAL('persona_telefonos_seq'),
   TIPO_TELEFONO_ID     VARCHAR(3)           NOT NULL,
   PERSONA_ID           NUMERIC(10)          NOT NULL,
   NUMERO               NUMERIC(15)          NOT NULL,
   WHATSAPP             BOOL                 NULL DEFAULT FALSE,
   ESTADO               NUMERIC(1)           NULL DEFAULT 1,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
   USUARIO_ID           VARCHAR(10)          NULL,
   IP_ADDRESS           VARCHAR(15)          NULL,
   CONSTRAINT PK_PERSONA_TELEFONOS PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: PROCEDIMIENTO                                         */
/*==============================================================*/
CREATE TABLE PROCEDIMIENTO (
   ID                   VARCHAR(5)           NOT NULL,
   PROCESO_ID           VARCHAR(2)           NOT NULL,
   SERVICIO_ID          VARCHAR(3)           NULL,
   NOMBRE               VARCHAR(30)          NOT NULL,
   DESCRIPCION          VARCHAR(100)         NULL,
   CONSTRAINT PK_PROCEDIMIENTO PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: PROCESO                                               */
/*==============================================================*/
CREATE TABLE PROCESO (
   ID                   VARCHAR(2)           NOT NULL,
   NOMBRE               VARCHAR(25)          NOT NULL,
   DESCRIPCION          VARCHAR(100)         NULL,
   CONSTRAINT PK_PROCESO PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
CREATE TABLE PRODUCTO (
   ID                   VARCHAR(6)           NOT NULL,
   NOMBRE               VARCHAR(50)          NOT NULL,
   DESCRIPCION          VARCHAR(100)         NULL,
   MEMBRESIA_ID         VARCHAR(3)           NULL,
   TIPO_PRODUCTO_ID     VARCHAR(2)           NOT NULL,
   VIGENTE_DESDE        DATE                 NULL DEFAULT CURRENT_DATE,
   ESTADO               NUMERIC(1)           NULL DEFAULT 1,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
   USUARIO_ID           VARCHAR(10)          NULL,
   IP_ADDRESS           VARCHAR(15)          NULL,
   CONSTRAINT PK_PRODUCTO PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: PRODUCTO_COSTO                                        */
/*==============================================================*/
CREATE TABLE PRODUCTO_COSTO (
   ID                   NUMERIC(5)           NOT NULL DEFAULT NEXTVAL('producto_costo_seq'),
   PRODUCTO_ID          VARCHAR(6)           NOT NULL,
   VALOR                NUMERIC(15,2)        NOT NULL DEFAULT 0,
   VIGENTE_DESDE        DATE                 NULL DEFAULT CURRENT_DATE,
   VIGENTE_HASTA        DATE                 NULL DEFAULT CURRENT_DATE,
   ESTADO               NUMERIC(1)           NULL DEFAULT 1,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
   USUARIO_ID           VARCHAR(10)          NULL,
   IP_ADDRESS           VARCHAR(15)          NULL,
   CONSTRAINT PK_PRODUCTO_COSTO PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: PUNTO_VENTA                                           */
/*==============================================================*/
CREATE TABLE PUNTO_VENTA (
   ID                   VARCHAR(5)           NOT NULL,
   TIPO_PUNTO_VENTA_ID  VARCHAR(2)           NOT NULL,
   CIUDAD_ID            VARCHAR(3)           NOT NULL,
   NOMBRE               VARCHAR(30)          NOT NULL,
   ESTADO               NUMERIC(1)           NULL DEFAULT 1,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
   USUARIO_ID           VARCHAR(10)          NULL,
   IP_ADDRESS           VARCHAR(15)          NULL,
   CONSTRAINT PK_PUNTO_VENTA PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: RESOLUCION                                            */
/*==============================================================*/
CREATE TABLE RESOLUCION (
   ID                   NUMERIC(3)           NOT NULL DEFAULT NEXTVAL('resolucion_seq'),
   CODIGO_DIAN          VARCHAR(20)          NOT NULL,
   DESCRIPCION          VARCHAR(100)         NOT NULL,
   FECHA                DATE                 NOT NULL,
   ESTADO               NUMERIC(1)           NULL DEFAULT 1,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
   USUARIO_ID           VARCHAR(10)          NULL,
   IP_ADDRESS           VARCHAR(15)          NULL,
   CONSTRAINT PK_RESOLUCION PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: RESOLUCION_SEC                                        */
/*==============================================================*/
CREATE TABLE RESOLUCION_SEC (
   ID                   NUMERIC(5)           NOT NULL DEFAULT NEXTVAL('resolucion_sec_seq'),
   RESOLUCION_ID        NUMERIC(3)           NOT NULL,
   FECHA                DATE                 NOT NULL DEFAULT CURRENT_DATE,
   PREFIJO              VARCHAR(3)           NOT NULL,
   SECUENCIA_INICIO     NUMERIC(10)          NOT NULL,
   SECUENCIA_FIN        NUMERIC(10)          NOT NULL,
   SECUENCIA_ACTUAL     NUMERIC(10)          NOT NULL,
   ESTADO               NUMERIC(1)           NULL DEFAULT 1,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
   USUARIO_ID           VARCHAR(10)          NULL,
   IP_ADDRESS           VARCHAR(15)          NULL,
   CONSTRAINT PK_RESOLUCION_SEC PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: ROL_PERSONA                                           */
/*==============================================================*/
CREATE TABLE ROL_PERSONA (
   ID                   VARCHAR(3)           NOT NULL,
   NOMBRE               VARCHAR(25)          NOT NULL,
   CONSTRAINT PK_ROL_PERSONA PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: SERVICIO                                              */
/*==============================================================*/
CREATE TABLE SERVICIO (
   ID                   VARCHAR(3)           NOT NULL,
   NOMBRE               VARCHAR(30)          NOT NULL,
   TIPO_SERVICIO_ID     VARCHAR(2)           NULL,
   CONSTRAINT PK_SERVICIO PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: TIPO_ACTIVIDAD                                        */
/*==============================================================*/
CREATE TABLE TIPO_ACTIVIDAD (
   ID                   VARCHAR(2)           NOT NULL,
   NOMBRE               VARCHAR(25)          NOT NULL,
   CONSTRAINT PK_TIPO_ACTIVIDAD PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: TIPO_CUPON                                            */
/*==============================================================*/
CREATE TABLE TIPO_CUPON (
   ID                   VARCHAR(2)           NOT NULL,
   NOMBRE               VARCHAR(25)          NOT NULL,
   CONSTRAINT PK_TIPO_CUPON PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: TIPO_DOCUMENTO                                        */
/*==============================================================*/
CREATE TABLE TIPO_DOCUMENTO (
   ID                   VARCHAR(2)           NOT NULL,
   NOMBRE               VARCHAR(25)          NOT NULL,
   CONSTRAINT PK_TIPO_DOCUMENTO PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: TIPO_EMAIL                                            */
/*==============================================================*/
CREATE TABLE TIPO_EMAIL (
   ID                   VARCHAR(3)           NOT NULL,
   NOMBRE               VARCHAR(25)          NOT NULL,
   CONSTRAINT PK_TIPO_EMAIL PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: TIPO_ENTRENAMIENTO                                    */
/*==============================================================*/
CREATE TABLE TIPO_ENTRENAMIENTO (
   ID                   VARCHAR(2)           NOT NULL,
   NOMBRE               VARCHAR(25)          NOT NULL,
   CONSTRAINT PK_TIPO_ENTRENAMIENTO PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: TIPO_PAGO                                             */
/*==============================================================*/
CREATE TABLE TIPO_PAGO (
   ID                   VARCHAR(2)           NOT NULL,
   NOMBRE               VARCHAR(25)          NOT NULL,
   CONSTRAINT PK_TIPO_PAGO PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: TIPO_PRODUCTO                                         */
/*==============================================================*/
CREATE TABLE TIPO_PRODUCTO (
   ID                   VARCHAR(2)           NOT NULL,
   NOMBRE               VARCHAR(25)          NOT NULL,
   CONSTRAINT PK_TIPO_PRODUCTO PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: TIPO_PUNTO_VENTA                                      */
/*==============================================================*/
CREATE TABLE TIPO_PUNTO_VENTA (
   ID                   VARCHAR(2)           NOT NULL,
   NOMBRE               VARCHAR(25)          NOT NULL,
   CONSTRAINT PK_TIPO_PUNTO_VENTA PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: TIPO_SERVICIO                                         */
/*==============================================================*/
CREATE TABLE TIPO_SERVICIO (
   ID                   VARCHAR(2)           NOT NULL,
   NOMBRE               VARCHAR(25)          NOT NULL,
   CONSTRAINT PK_TIPO_SERVICIO PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: TIPO_TELEFONO                                         */
/*==============================================================*/
CREATE TABLE TIPO_TELEFONO (
   ID                   VARCHAR(3)           NOT NULL,
   NOMBRE               VARCHAR(25)          NOT NULL,
   CONSTRAINT PK_TIPO_TELEFONO PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
CREATE TABLE USUARIO (
   ID                   VARCHAR(10)          NOT NULL,
   NOMBRE               VARCHAR(50)          NOT NULL,
   EMAIL                VARCHAR(50)          NOT NULL,
   PASSWORD             VARCHAR(50)          NOT NULL,
   ESTADO               NUMERIC(1)           NULL DEFAULT 1,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
   USUARIO_ID           VARCHAR(10)          NULL,
   IP_ADDRESS           VARCHAR(15)          NULL,
   CONSTRAINT PK_USUARIO PRIMARY KEY (ID)
);

ALTER TABLE CIUDAD
   ADD CONSTRAINT FK_CIUDAD_REF_DEPTO FOREIGN KEY (DEPTO_ID)
      REFERENCES DEPTO (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE CUPON
   ADD CONSTRAINT FK_CUPON_REF_MONEDA FOREIGN KEY (MONEDA_ID)
      REFERENCES MONEDA (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE CUPON
   ADD CONSTRAINT FK_CUPON_REF_TIPO_CUPON FOREIGN KEY (TIPO_CUPON_ID)
      REFERENCES TIPO_CUPON (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DEPTO
   ADD CONSTRAINT FK_DEPTO_REF_PAIS FOREIGN KEY (PAIS_ID)
      REFERENCES PAIS (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE ENTRENAMIENTO
   ADD CONSTRAINT FK_ENTRENAM_REF_PRO_PRO FOREIGN KEY (PROCEDIMIENTO_ID)
      REFERENCES PROCEDIMIENTO (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE ENTRENAMIENTO
   ADD CONSTRAINT FK_ENTRENAM_REF_TIPO_ENTRE FOREIGN KEY (TIPO_ENTRENAMIENTO_ID)
      REFERENCES TIPO_ENTRENAMIENTO (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE ENTRENAMIENTO_ACTIVIDAD
   ADD CONSTRAINT FK_ENTR_REF_TIPO_ACT FOREIGN KEY (TIPO_ACTIVIDAD_ID)
      REFERENCES TIPO_ACTIVIDAD (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE ENTRENAMIENTO_ACTIVIDAD
   ADD CONSTRAINT FK_ENT_REF_ENT_ACT FOREIGN KEY (ENTRENAMIENTO_ID)
      REFERENCES ENTRENAMIENTO (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE ENTRENAMIENTO_PLAN
   ADD CONSTRAINT FK_ENTR_PLAN_REF_ENTR FOREIGN KEY (ENTRENAMIENTO_ID)
      REFERENCES ENTRENAMIENTO (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE ENTRENAMIENTO_PLAN
   ADD CONSTRAINT FK_ENT_PLAN_REF_PER_ATLETA FOREIGN KEY (ATLETA_ID)
      REFERENCES PERSONA (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE ENTRENAMIENTO_PLAN
   ADD CONSTRAINT FK_ENT_PLAN_REF_PER_ENTRE FOREIGN KEY (ENTRENADOR_ID)
      REFERENCES PERSONA (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE ENTRENAMIENTO_SEGUIMIENTO
   ADD CONSTRAINT FK_ENT_SEG_REF_ENT_ACT FOREIGN KEY (ENTRENAMIENTO_ACTIVIDAD_ID)
      REFERENCES ENTRENAMIENTO_ACTIVIDAD (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE ENTRENAMIENTO_SEGUIMIENTO
   ADD CONSTRAINT FK_ENT_SEG_REF_ENT_PLAN FOREIGN KEY (ENTRENAMIENTO_PLAN_ID)
      REFERENCES ENTRENAMIENTO_PLAN (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE FACTURA
   ADD CONSTRAINT FK_FACTURA_REF_FACT_EST FOREIGN KEY (FACTURA_ESTADO_ID)
      REFERENCES FACTURA_ESTADO (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE FACTURA
   ADD CONSTRAINT FK_FACTURA_REF_MONEDA FOREIGN KEY (MONEDA_ID)
      REFERENCES MONEDA (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE FACTURA
   ADD CONSTRAINT FK_FACTURA_REF_PERSONA FOREIGN KEY (CLIENTE_PERSONA_ID)
      REFERENCES PERSONA (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE FACTURA
   ADD CONSTRAINT FK_FACTURA_REF_PUNTO_VEN FOREIGN KEY (PUNTO_VENTA_ID)
      REFERENCES PUNTO_VENTA (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE FACTURA
   ADD CONSTRAINT FK_FACTURA_REF_RESOL_SEC FOREIGN KEY (RESOLUCION_SEC_ID)
      REFERENCES RESOLUCION_SEC (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE FACTURA_DETALLE
   ADD CONSTRAINT FK_FACTURA_DET_REF_PROD FOREIGN KEY (PRODUCTO_SERVICIO_ID)
      REFERENCES PRODUCTO (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE FACTURA_DETALLE
   ADD CONSTRAINT FK_FAC_DET_REF_FACTURA FOREIGN KEY (FACTURA_ID)
      REFERENCES FACTURA (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE MEMBRESIA_SERVICIOS
   ADD CONSTRAINT FK_MEMB_REF_MEMB_SER FOREIGN KEY (MEMBRESIA_ID)
      REFERENCES MEMBRESIA (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE MEMBRESIA_SERVICIOS
   ADD CONSTRAINT FK_MEMB_REF_SERVICIO FOREIGN KEY (SERVICIO_ID)
      REFERENCES SERVICIO (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE MONEDA
   ADD CONSTRAINT FK_MONEDA_REF_PAIS FOREIGN KEY (PAIS_ID)
      REFERENCES PAIS (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PAGO
   ADD CONSTRAINT FK_PAGO_REF_PAGO_EST FOREIGN KEY (PAGO_ESTADO_ID)
      REFERENCES PAGO_ESTADO (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PAGO
   ADD CONSTRAINT FK_PAGO_REF_PUNTO_VEN FOREIGN KEY (PUNTO_VENTA_ID)
      REFERENCES PUNTO_VENTA (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PAGO_DETALLES
   ADD CONSTRAINT FK_PAGO_DET_REF_CUPON FOREIGN KEY (CUPO_ID)
      REFERENCES CUPON (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PAGO_DETALLES
   ADD CONSTRAINT FK_PAGO_DET_REF_MONEDA FOREIGN KEY (MONEDA_ID)
      REFERENCES MONEDA (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PAGO_DETALLES
   ADD CONSTRAINT FK_PAGO_DET_REF_PAGO FOREIGN KEY (PAGO_ID)
      REFERENCES PAGO (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PAGO_DETALLES
   ADD CONSTRAINT FK_PAGO_DET_REF_TIPO_PAGO FOREIGN KEY (TIPO_PAGO_ID)
      REFERENCES TIPO_PAGO (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PAGO_FACTURAS
   ADD CONSTRAINT FK_PAGO_FAC_REF_FACTURA FOREIGN KEY (FACTURA_ID)
      REFERENCES FACTURA (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PAGO_FACTURAS
   ADD CONSTRAINT FK_PAGO_FAC_REF_PAGO FOREIGN KEY (PAGO_ID)
      REFERENCES PAGO (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PERSONA
   ADD CONSTRAINT FK_PERSONA_REF_CIUDAD FOREIGN KEY (LUGAR_NACIMIENTO_CIUDAD_ID)
      REFERENCES CIUDAD (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PERSONA
   ADD CONSTRAINT FK_PERSONA_REF_PAIS FOREIGN KEY (NACIONALIDAD_PAIS_ID)
      REFERENCES PAIS (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PERSONA
   ADD CONSTRAINT FK_PERSONA_REF_TIPO_DOC FOREIGN KEY (TIPO_DOCUMENTO_ID)
      REFERENCES TIPO_DOCUMENTO (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PERSONA_EMAILS
   ADD CONSTRAINT FK_PERSONA_EMAIL_REF_PERSONA FOREIGN KEY (PERSONA_ID)
      REFERENCES PERSONA (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PERSONA_EMAILS
   ADD CONSTRAINT FK_PERSONA_EMAIL_REF_TIPO_EMAIL FOREIGN KEY (TIPO_EMAIL_ID)
      REFERENCES TIPO_EMAIL (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PERSONA_ROLES
   ADD CONSTRAINT FK_PERSONA_ROLES_REF_PERSONA FOREIGN KEY (PERSONA_ID)
      REFERENCES PERSONA (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PERSONA_ROLES
   ADD CONSTRAINT FK_PERSONA_ROLES_REF_TIPO_PER FOREIGN KEY (ROL_PERSONA_ID)
      REFERENCES ROL_PERSONA (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PERSONA_ROLES
   ADD CONSTRAINT FK_PER_ROLES_REF_PER_TEL FOREIGN KEY (PERSONA_TELEFONOS_ID)
      REFERENCES PERSONA_TELEFONOS (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PERSONA_TELEFONOS
   ADD CONSTRAINT FK_PERSONA_TELS_REF_PERSONA FOREIGN KEY (PERSONA_ID)
      REFERENCES PERSONA (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PERSONA_TELEFONOS
   ADD CONSTRAINT FK_PERSONA_TELS_REF_TIPO_TEL FOREIGN KEY (TIPO_TELEFONO_ID)
      REFERENCES TIPO_TELEFONO (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PROCEDIMIENTO
   ADD CONSTRAINT FK_PROCEDIMIENTO_REF_PROCESO FOREIGN KEY (PROCESO_ID)
      REFERENCES PROCESO (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PROCEDIMIENTO
   ADD CONSTRAINT FK_PRO_PRO_REF_SERVICIO FOREIGN KEY (SERVICIO_ID)
      REFERENCES SERVICIO (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PRODUCTO
   ADD CONSTRAINT FK_PROD_SER_REF_TIPO_PRO FOREIGN KEY (TIPO_PRODUCTO_ID)
      REFERENCES TIPO_PRODUCTO (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PRODUCTO
   ADD CONSTRAINT FK_PRO_SER_REF_MEMBRESIA FOREIGN KEY (MEMBRESIA_ID)
      REFERENCES MEMBRESIA (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PRODUCTO_COSTO
   ADD CONSTRAINT FK_PROD_COS_REF_PRODUCTO FOREIGN KEY (PRODUCTO_ID)
      REFERENCES PRODUCTO (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PUNTO_VENTA
   ADD CONSTRAINT FK_PUNTO_VE_REF_CIUDAD FOREIGN KEY (CIUDAD_ID)
      REFERENCES CIUDAD (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PUNTO_VENTA
   ADD CONSTRAINT FK_PUNTO_VE_REF_TIPO_PUN_VEN FOREIGN KEY (TIPO_PUNTO_VENTA_ID)
      REFERENCES TIPO_PUNTO_VENTA (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE RESOLUCION_SEC
   ADD CONSTRAINT FK_RESOL_REF_RESOLUCION FOREIGN KEY (RESOLUCION_ID)
      REFERENCES RESOLUCION (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE SERVICIO
   ADD CONSTRAINT FK_SERVICIO_REF_TIPO_SERVICIO FOREIGN KEY (TIPO_SERVICIO_ID)
      REFERENCES TIPO_SERVICIO (ID)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

