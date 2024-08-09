/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     9/08/2024 12:30:31 a. m.                     */
/*==============================================================*/


drop index IDX_PAIS_NUMERO;

create sequence CHAT_CONVERSACION_SEQ
increment 1
start 1;

create sequence CHAT_MENSAJE_MEDIA_SEQ
increment 1
start 1;

create sequence CHAT_MENSAJE_SEQ
increment 1
start 1;

create sequence CHAT_MULTIMEDIA_SEQ
increment 1
start 1;

create sequence CHAT_SEQ
increment 1
start 1;

create sequence ENTRENAMIENTO_ACTIVIDAD_SEQ
increment 1
start 1;

create sequence ENTRENAMIENTO_PLAN_SEQ
increment 1
start 1;

create sequence ENTRENAMIENTO_SEGUIMIENTO_SEQ
increment 1
start 1;

create sequence EVENTO_PARTICIPANTES_SEQ
increment 1
start 1;

create sequence EVENTO_SEQ
increment 1
start 1;

create sequence FACTURA_DETALLE_SEQ
increment 1
start 1;

create sequence FACTURA_SEQ
increment 1
start 1;

create sequence MEMBRESIA_SERVICIOS_SEQ
increment 1
start 1;

create sequence PAGO_DETALLES_SEQ
increment 1
start 1;

create sequence PAGO_FACTURAS_SEQ
increment 1
start 1;

create sequence PAGO_SEQ
increment 1
start 1;

create sequence PERSONA_EMAILS_SEQ
increment 1
start 1;

create sequence PERSONA_SEQ
increment 1
start 1;

create sequence PERSONA_TELEFONOS_SEQ
increment 1
start 1;

create sequence PRODUCTO_COSTO_SEQ
increment 1
start 1;

create sequence RESOLUCION_SEC_SEQ
increment 1
start 1;

create sequence RESOLUCION_SEQ
increment 1
start 1;

/*==============================================================*/
/* Table: CHAT_CONVERSACION                                     */
/*==============================================================*/
create table CHAT_CONVERSACION (
   ID                   NUMERIC(20)          not null default NEXTVAL('chat_seq'),
   PERSONA_TELEFONOS_ID NUMERIC(5)           not null default NEXTVAL('chat_seq'),
   CHAT_ESTADO_ID       VARCHAR(20)          not null,
   FECHA_HORA_INICIO    TIMESTAMP WITH TIME ZONE not null,
   FECHA_HORA_FIN       TIMESTAMP WITH TIME ZONE null,
   constraint PK_CHAT_CONVERSACION primary key (ID)
);

comment on table CHAT_CONVERSACION is
'chat_conversacion';

comment on column CHAT_CONVERSACION.ID is
'id';

comment on column CHAT_CONVERSACION.PERSONA_TELEFONOS_ID is
'persona_telefonos_id';

comment on column CHAT_CONVERSACION.CHAT_ESTADO_ID is
'chat_estado_id';

comment on column CHAT_CONVERSACION.FECHA_HORA_INICIO is
'fecha_hora_inicio';

comment on column CHAT_CONVERSACION.FECHA_HORA_FIN is
'fecha_hora_fin';

/*==============================================================*/
/* Table: CHAT_ENTRENAMIENTO_PLAN                               */
/*==============================================================*/
create table CHAT_ENTRENAMIENTO_PLAN (
   CHAT_CONVERSACION_ID NUMERIC(20)          not null default NEXTVAL('chat_mensaje_seq'),
   ENTRENAMIENTO_PLAN_ID NUMERIC(15)          not null default nextval('entrenamiento_plan_seq'),
   constraint PK_CHAT_ENTRENAMIENTO_PLAN primary key (CHAT_CONVERSACION_ID, ENTRENAMIENTO_PLAN_ID)
);

comment on table CHAT_ENTRENAMIENTO_PLAN is
'chat_entrenamiento_plan';

comment on column CHAT_ENTRENAMIENTO_PLAN.CHAT_CONVERSACION_ID is
'chat_conversacion_id';

comment on column CHAT_ENTRENAMIENTO_PLAN.ENTRENAMIENTO_PLAN_ID is
'entrenamiento_plan_id';

/*==============================================================*/
/* Table: CHAT_ESTADO                                           */
/*==============================================================*/
create table CHAT_ESTADO (
   ID                   VARCHAR(20)          not null,
   NOMBRE               VARCHAR(30)          not null,
   SIGUIENTE            VARCHAR(20)          not null,
   ANTERIOR             VARCHAR(20)          not null,
   SALIDA               VARCHAR(20)          not null,
   constraint PK_CHAT_ESTADO primary key (ID)
);

comment on table CHAT_ESTADO is
'chat_estado';

comment on column CHAT_ESTADO.ID is
'id';

comment on column CHAT_ESTADO.NOMBRE is
'nombre';

comment on column CHAT_ESTADO.SIGUIENTE is
'siguiente';

comment on column CHAT_ESTADO.ANTERIOR is
'anterior';

comment on column CHAT_ESTADO.SALIDA is
'salida';

/*==============================================================*/
/* Table: CHAT_MENSAJE                                          */
/*==============================================================*/
create table CHAT_MENSAJE (
   ID                   NUMERIC(20)          not null default NEXTVAL('chat_multimedia'),
   CHAT_CONVERSACION_ID NUMERIC(20)          not null,
   FECHA_HORA           TIMESTAMP WITH TIME ZONE not null,
   MENSAJE              VARCHAR(500)         not null,
   ORIENTACION          VARCHAR(7)           null default 'ENTRADA'
      constraint CKC_ORIENTACION_CHAT_MEN check (ORIENTACION is null or (ORIENTACION in ('ENTRADA','SALIDA') and ORIENTACION = upper(ORIENTACION))),
   constraint PK_CHAT_MENSAJE primary key (ID)
);

comment on table CHAT_MENSAJE is
'chat_mensaje';

comment on column CHAT_MENSAJE.ID is
'id';

comment on column CHAT_MENSAJE.CHAT_CONVERSACION_ID is
'chat_conversacion_id';

comment on column CHAT_MENSAJE.FECHA_HORA is
'fecha_hora';

comment on column CHAT_MENSAJE.MENSAJE is
'mensaje';

comment on column CHAT_MENSAJE.ORIENTACION is
'orientacion';

/*==============================================================*/
/* Table: CHAT_MENSAJE_MEDIA                                    */
/*==============================================================*/
create table CHAT_MENSAJE_MEDIA (
   ID                   NUMERIC(20)          not null default NEXTVAL('chat_multimedia'),
   CHAT_MENSAJE_ID      NUMERIC(20)          not null,
   FECHA_HORA           TIMESTAMP WITH TIME ZONE not null,
   NOMBRE               VARCHAR(100)         null,
   STORAGE_URL          VARCHAR(500)         null,
   STORAGE_PATH         VARCHAR(500)         null,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   ESTADO               NUMERIC(1)           null default 1,
   constraint PK_CHAT_MENSAJE_MEDIA primary key (ID)
);

comment on table CHAT_MENSAJE_MEDIA is
'chat_mensaje_media';

comment on column CHAT_MENSAJE_MEDIA.ID is
'id';

comment on column CHAT_MENSAJE_MEDIA.CHAT_MENSAJE_ID is
'chat_mensaje_id';

comment on column CHAT_MENSAJE_MEDIA.FECHA_HORA is
'fecha_hora';

comment on column CHAT_MENSAJE_MEDIA.NOMBRE is
'nombre';

comment on column CHAT_MENSAJE_MEDIA.STORAGE_URL is
'storage_url';

comment on column CHAT_MENSAJE_MEDIA.STORAGE_PATH is
'storage_path';

comment on column CHAT_MENSAJE_MEDIA.FECHA_REGISTRO is
'fecha_registro';

comment on column CHAT_MENSAJE_MEDIA.FECHA_ACTUALIZACION is
'fecha_actualizacion';

comment on column CHAT_MENSAJE_MEDIA.ESTADO is
'estado';

/*==============================================================*/
/* Table: CIUDAD                                                */
/*==============================================================*/
create table CIUDAD (
   ID                   VARCHAR(5)           not null,
   NOMBRE               VARCHAR(30)          not null,
   DEPTO_ID             VARCHAR(2)           not null,
   ESTADO               NUMERIC(1)           null default 1,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   USUARIO_ID           VARCHAR(10)          null,
   IP_ADDRESS           VARCHAR(15)          null,
   constraint PK_CIUDAD primary key (ID)
);

comment on table CIUDAD is
'ciudad';

comment on column CIUDAD.ID is
'id';

comment on column CIUDAD.NOMBRE is
'nombre';

comment on column CIUDAD.DEPTO_ID is
'depto_id';

comment on column CIUDAD.ESTADO is
'estado';

comment on column CIUDAD.FECHA_REGISTRO is
'fecha_registro';

comment on column CIUDAD.FECHA_ACTUALIZACION is
'fecha_actualizacion';

comment on column CIUDAD.USUARIO_ID is
'usuario_id';

comment on column CIUDAD.IP_ADDRESS is
'ip_address';

/*==============================================================*/
/* Table: CONTINENTE                                            */
/*==============================================================*/
create table CONTINENTE (
   ID                   VARCHAR(2)           not null,
   NOMBRE               VARCHAR(25)          not null,
   DESCRIPCION          VARCHAR(100)         null,
   constraint PK_CONTINENTE primary key (ID)
);

comment on table CONTINENTE is
'continente';

comment on column CONTINENTE.ID is
'id';

comment on column CONTINENTE.NOMBRE is
'nombre';

comment on column CONTINENTE.DESCRIPCION is
'descripcion';

/*==============================================================*/
/* Table: CUPON                                                 */
/*==============================================================*/
create table CUPON (
   ID                   VARCHAR(5)           not null,
   TIPO_CUPON_ID        VARCHAR(2)           not null,
   NOMBRE               VARCHAR(20)          not null,
   DESCUENTO_PORCENTAJE NUMERIC(5,2)         null default 0
      constraint CKC_DESCUENTO_PORCENT_CUPON check (DESCUENTO_PORCENTAJE is null or (DESCUENTO_PORCENTAJE between 0 and 100)),
   MONEDA_ID            VARCHAR(3)           not null,
   VALOR                NUMERIC(15,2)        null default 0,
   VALOR_TOPE           NUMERIC(15,2)        null default 0,
   APLICA_TOPE          NUMERIC(1)           null default 0
      constraint CKC_APLICA_TOPE_CUPON check (APLICA_TOPE is null or (APLICA_TOPE between 0 and 1)),
   VIGENTE_DESDE        DATE                 null default CURRENT_DATE,
   VIGENTE_HASTA        DATE                 null default CURRENT_DATE,
   ESTADO               NUMERIC(1)           null default 1,
   constraint PK_CUPON primary key (ID)
);

comment on table CUPON is
'cupon';

comment on column CUPON.ID is
'id';

comment on column CUPON.TIPO_CUPON_ID is
'tipo_cupon_id';

comment on column CUPON.NOMBRE is
'nombre';

comment on column CUPON.DESCUENTO_PORCENTAJE is
'descuento_porcentaje';

comment on column CUPON.MONEDA_ID is
'moneda_id';

comment on column CUPON.VALOR is
'valor';

comment on column CUPON.VALOR_TOPE is
'valor_tope';

comment on column CUPON.APLICA_TOPE is
'aplica_tope';

comment on column CUPON.VIGENTE_DESDE is
'vigente_desde';

comment on column CUPON.VIGENTE_HASTA is
'vigente_hasta';

comment on column CUPON.ESTADO is
'estado';

/*==============================================================*/
/* Table: DEPTO                                                 */
/*==============================================================*/
create table DEPTO (
   ID                   VARCHAR(2)           not null,
   NOMBRE               VARCHAR(30)          not null,
   PAIS_ID              VARCHAR(3)           not null,
   ESTADO               NUMERIC(1)           null default 1,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   USUARIO_ID           VARCHAR(10)          null,
   IP_ADDRESS           VARCHAR(15)          null,
   constraint PK_DEPTO primary key (ID)
);

comment on table DEPTO is
'depto';

comment on column DEPTO.ID is
'id';

comment on column DEPTO.NOMBRE is
'nombre';

comment on column DEPTO.PAIS_ID is
'pais_id';

comment on column DEPTO.ESTADO is
'estado';

comment on column DEPTO.FECHA_REGISTRO is
'fecha_registro';

comment on column DEPTO.FECHA_ACTUALIZACION is
'fecha_actualizacion';

comment on column DEPTO.USUARIO_ID is
'usuario_id';

comment on column DEPTO.IP_ADDRESS is
'ip_address';

/*==============================================================*/
/* Table: DIAGNOSTICO_CIE10                                     */
/*==============================================================*/
create table DIAGNOSTICO_CIE10 (
   ID                   VARCHAR(4)           not null,
   NOMBRE               VARCHAR(100)         not null,
   DESCRIPCION          VARCHAR(200)         null,
   constraint PK_DIAGNOSTICO_CIE10 primary key (ID)
);

comment on table DIAGNOSTICO_CIE10 is
'diagnostico_cie10';

comment on column DIAGNOSTICO_CIE10.ID is
'id';

comment on column DIAGNOSTICO_CIE10.NOMBRE is
'nombre';

comment on column DIAGNOSTICO_CIE10.DESCRIPCION is
'descripcion';

/*==============================================================*/
/* Table: ENTRENAMIENTO                                         */
/*==============================================================*/
create table ENTRENAMIENTO (
   ID                   VARCHAR(5)           not null,
   NOMBRE               VARCHAR(25)          not null,
   PROCEDIMIENTO_ID     VARCHAR(5)           not null,
   TIPO_ENTRENAMIENTO_ID VARCHAR(2)           not null,
   DESCRIPCION          VARCHAR(100)         null,
   URL_WIKI             VARCHAR(100)         null,
   URL_YOUTUBE          VARCHAR(100)         null,
   URL_ORGANIZACION     VARCHAR(100)         null,
   ESTADO               NUMERIC(1)           null default 1,
   constraint PK_ENTRENAMIENTO primary key (ID)
);

comment on table ENTRENAMIENTO is
'entrenamiento';

comment on column ENTRENAMIENTO.ID is
'id';

comment on column ENTRENAMIENTO.NOMBRE is
'nombre';

comment on column ENTRENAMIENTO.PROCEDIMIENTO_ID is
'procedimiento_id';

comment on column ENTRENAMIENTO.TIPO_ENTRENAMIENTO_ID is
'tipo_entrenamiento_id';

comment on column ENTRENAMIENTO.DESCRIPCION is
'descripcion';

comment on column ENTRENAMIENTO.URL_WIKI is
'url_wiki';

comment on column ENTRENAMIENTO.URL_YOUTUBE is
'url_youtube';

comment on column ENTRENAMIENTO.URL_ORGANIZACION is
'url_organizacion';

comment on column ENTRENAMIENTO.ESTADO is
'estado';

/*==============================================================*/
/* Table: ENTRENAMIENTO_ACTIVIDAD                               */
/*==============================================================*/
create table ENTRENAMIENTO_ACTIVIDAD (
   ID                   NUMERIC(4)           not null default NEXTVAL('entrenamiento_actividad_seq'),
   ENTRENAMIENTO_ID     VARCHAR(5)           not null,
   TIPO_ACTIVIDAD_ID    VARCHAR(2)           not null,
   NOMBRE               VARCHAR(25)          not null,
   DESCRIPCION          VARCHAR(100)         null,
   URL_VIDEO            VARCHAR(200)         null,
   SERIES               NUMERIC(10)          null,
   CANTIDAD             NUMERIC(10)          null,
   MIN_DESCANSO         TIME                 null,
   TIEMPO_ESTIMADO      TIME                 null,
   TIEMPO_MARCA         TIME                 null,
   ORDEN                NUMERIC(2)           null,
   UBICACION            NUMERIC(1)           null default 1,
   ESTADO               NUMERIC(1)           null default 1,
   constraint PK_ENTRENAMIENTO_ACTIVIDAD primary key (ID)
);

comment on table ENTRENAMIENTO_ACTIVIDAD is
'entrenamiento_actividad';

comment on column ENTRENAMIENTO_ACTIVIDAD.ID is
'id';

comment on column ENTRENAMIENTO_ACTIVIDAD.ENTRENAMIENTO_ID is
'entrenamiento_id';

comment on column ENTRENAMIENTO_ACTIVIDAD.TIPO_ACTIVIDAD_ID is
'tipo_actividad_id';

comment on column ENTRENAMIENTO_ACTIVIDAD.NOMBRE is
'nombre';

comment on column ENTRENAMIENTO_ACTIVIDAD.DESCRIPCION is
'descripcion';

comment on column ENTRENAMIENTO_ACTIVIDAD.URL_VIDEO is
'url_video';

comment on column ENTRENAMIENTO_ACTIVIDAD.SERIES is
'series';

comment on column ENTRENAMIENTO_ACTIVIDAD.CANTIDAD is
'cantidad';

comment on column ENTRENAMIENTO_ACTIVIDAD.MIN_DESCANSO is
'min_descanso';

comment on column ENTRENAMIENTO_ACTIVIDAD.TIEMPO_ESTIMADO is
'tiempo_estimado';

comment on column ENTRENAMIENTO_ACTIVIDAD.TIEMPO_MARCA is
'tiempo_marca';

comment on column ENTRENAMIENTO_ACTIVIDAD.ORDEN is
'orden';

comment on column ENTRENAMIENTO_ACTIVIDAD.UBICACION is
'ubicacion';

comment on column ENTRENAMIENTO_ACTIVIDAD.ESTADO is
'estado';

/*==============================================================*/
/* Table: ENTRENAMIENTO_PLAN                                    */
/*==============================================================*/
create table ENTRENAMIENTO_PLAN (
   ID                   NUMERIC(15)          not null default nextval('entrenamiento_plan_seq'),
   ENTRENAMIENTO_ID     VARCHAR(5)           not null,
   ENTRENADOR_ID        NUMERIC(10)          not null,
   ATLETA_ID            NUMERIC(10)          not null,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   ESTADO               NUMERIC(1)           null default 1,
   USUARIO_ID           VARCHAR(10)          null,
   IP_ADDRESS           VARCHAR(15)          null,
   constraint PK_ENTRENAMIENTO_PLAN primary key (ID)
);

comment on table ENTRENAMIENTO_PLAN is
'entrenamiento_plan';

comment on column ENTRENAMIENTO_PLAN.ID is
'id';

comment on column ENTRENAMIENTO_PLAN.ENTRENAMIENTO_ID is
'entrenamiento_id';

comment on column ENTRENAMIENTO_PLAN.ENTRENADOR_ID is
'entrenador_id';

comment on column ENTRENAMIENTO_PLAN.ATLETA_ID is
'atleta_id';

comment on column ENTRENAMIENTO_PLAN.FECHA_REGISTRO is
'fecha_registro';

comment on column ENTRENAMIENTO_PLAN.FECHA_ACTUALIZACION is
'fecha_actualizacion';

comment on column ENTRENAMIENTO_PLAN.ESTADO is
'estado';

comment on column ENTRENAMIENTO_PLAN.USUARIO_ID is
'usuario_id';

comment on column ENTRENAMIENTO_PLAN.IP_ADDRESS is
'ip_address';

/*==============================================================*/
/* Table: ENTRENAMIENTO_SEGUIMIENTO                             */
/*==============================================================*/
create table ENTRENAMIENTO_SEGUIMIENTO (
   ID                   NUMERIC(20)          not null default nextval('entrenamiento_seguimiento_seq'),
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   ENTRENAMIENTO_PLAN_ID NUMERIC(15)          not null,
   ENTRENAMIENTO_ACTIVIDAD_ID NUMERIC(4)           not null,
   LATITUD              DECIMAL              null,
   LONGITUD             DECIMAL              null,
   RESPUESTA            VARCHAR(100)         null,
   USUARIO_ID           VARCHAR(10)          null,
   IP_ADDRESS           VARCHAR(15)          null,
   constraint PK_ENTRENAMIENTO_SEGUIMIENTO primary key (ID)
);

comment on table ENTRENAMIENTO_SEGUIMIENTO is
'entrenamiento_seguimiento';

comment on column ENTRENAMIENTO_SEGUIMIENTO.ID is
'id';

comment on column ENTRENAMIENTO_SEGUIMIENTO.FECHA_REGISTRO is
'fecha_registro';

comment on column ENTRENAMIENTO_SEGUIMIENTO.ENTRENAMIENTO_PLAN_ID is
'entrenamiento_plan_id';

comment on column ENTRENAMIENTO_SEGUIMIENTO.ENTRENAMIENTO_ACTIVIDAD_ID is
'entrenamiento_actividad_id';

comment on column ENTRENAMIENTO_SEGUIMIENTO.LATITUD is
'latitud';

comment on column ENTRENAMIENTO_SEGUIMIENTO.LONGITUD is
'longitud';

comment on column ENTRENAMIENTO_SEGUIMIENTO.RESPUESTA is
'respuesta';

comment on column ENTRENAMIENTO_SEGUIMIENTO.USUARIO_ID is
'usuario_id';

comment on column ENTRENAMIENTO_SEGUIMIENTO.IP_ADDRESS is
'ip_address';

/*==============================================================*/
/* Table: EVENTO                                                */
/*==============================================================*/
create table EVENTO (
   ID                   NUMERIC(10)          not null default nextval('evento_seq'),
   TIPO_EVENTO_ID       VARCHAR(2)           not null,
   TIPO_ACCESO_ID       VARCHAR(2)           not null,
   FECHA_INICIO         TIMESTAMP WITH TIME ZONE not null,
   FECHA_FIN            TIMESTAMP WITH TIME ZONE not null,
   NOMBRE               VARCHAR(25)          not null,
   DESCRIPCION          VARCHAR(100)         null,
   CIUDAD_ID            VARCHAR(5)           not null,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   ESTADO               NUMERIC(1)           null default 1,
   USUARIO_ID           VARCHAR(10)          null,
   IP_ADDRESS           VARCHAR(15)          null,
   constraint PK_EVENTO primary key (ID)
);

comment on table EVENTO is
'evento';

comment on column EVENTO.ID is
'id';

comment on column EVENTO.TIPO_EVENTO_ID is
'tipo_evento_id';

comment on column EVENTO.TIPO_ACCESO_ID is
'tipo_acceso_id';

comment on column EVENTO.FECHA_INICIO is
'fecha_inicio';

comment on column EVENTO.FECHA_FIN is
'fecha_fin';

comment on column EVENTO.NOMBRE is
'nombre';

comment on column EVENTO.DESCRIPCION is
'descripcion';

comment on column EVENTO.CIUDAD_ID is
'ciudad_id';

comment on column EVENTO.FECHA_REGISTRO is
'fecha_registro';

comment on column EVENTO.FECHA_ACTUALIZACION is
'fecha_actualizacion';

comment on column EVENTO.ESTADO is
'estado';

comment on column EVENTO.USUARIO_ID is
'usuario_id';

comment on column EVENTO.IP_ADDRESS is
'ip_address';

/*==============================================================*/
/* Table: EVENTO_PARTICIPANTES                                  */
/*==============================================================*/
create table EVENTO_PARTICIPANTES (
   ID                   NUMERIC(10)          not null default nextval('evento_participantes_seq'),
   EVENTO_ID            NUMERIC(10)          not null,
   PERSONA_ID           NUMERIC(10)          not null default NEXTVAL('persona_seq'),
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   constraint PK_EVENTO_PARTICIPANTES primary key (ID)
);

comment on table EVENTO_PARTICIPANTES is
'evento_participantes';

comment on column EVENTO_PARTICIPANTES.ID is
'id';

comment on column EVENTO_PARTICIPANTES.EVENTO_ID is
'evento_id';

comment on column EVENTO_PARTICIPANTES.PERSONA_ID is
'persona_id';

comment on column EVENTO_PARTICIPANTES.FECHA_REGISTRO is
'fecha_asistencia';

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA (
   ID                   NUMERIC(15)          not null default NEXTVAL('factura_seq'),
   FECHA                DATE                 not null default CURRENT_DATE,
   RESOLUCION_SEC_ID    NUMERIC(5)           not null,
   PUNTO_VENTA_ID       VARCHAR(5)           not null,
   CLIENTE_PERSONA_ID   NUMERIC(10)          not null,
   MONEDA_ID            VARCHAR(3)           not null,
   VALOR_TOTAL          NUMERIC(15,2)        not null default 0,
   FACTURA_ESTADO_ID    VARCHAR(5)           null,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   USUARIO_ID           VARCHAR(10)          null,
   IP_ADDRESS           VARCHAR(15)          null,
   constraint PK_FACTURA primary key (ID)
);

comment on table FACTURA is
'factura';

comment on column FACTURA.ID is
'id';

comment on column FACTURA.FECHA is
'fecha';

comment on column FACTURA.RESOLUCION_SEC_ID is
'resolucion_sec_id';

comment on column FACTURA.PUNTO_VENTA_ID is
'punto_venta_id';

comment on column FACTURA.CLIENTE_PERSONA_ID is
'cliente_persona_id';

comment on column FACTURA.MONEDA_ID is
'moneda_id';

comment on column FACTURA.VALOR_TOTAL is
'valor_total';

comment on column FACTURA.FACTURA_ESTADO_ID is
'factura_estado_id';

comment on column FACTURA.FECHA_REGISTRO is
'fecha_registro';

comment on column FACTURA.FECHA_ACTUALIZACION is
'fecha_actualizacion';

comment on column FACTURA.USUARIO_ID is
'usuario_id';

comment on column FACTURA.IP_ADDRESS is
'ip_address';

/*==============================================================*/
/* Table: FACTURA_DETALLE                                       */
/*==============================================================*/
create table FACTURA_DETALLE (
   ID                   NUMERIC(20)          not null default NEXTVAL('factura_detalle_seq'),
   FACTURA_ID           NUMERIC(15)          not null,
   PRODUCTO_SERVICIO_ID VARCHAR(6)           not null,
   DESCUENTO_PORCENTAJE NUMERIC(5,2)         null default 0
      constraint CKC_DESCUENTO_PORCENT_FACTURA_ check (DESCUENTO_PORCENTAJE is null or (DESCUENTO_PORCENTAJE between 0 and 100)),
   VALOR_NETO           NUMERIC(15,2)        not null default 0,
   VALOR_TOTAL          NUMERIC(15,2)        not null default 0,
   ESTADO               NUMERIC(1)           null default 1,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   USUARIO_ID           VARCHAR(10)          null,
   IP_ADDRESS           VARCHAR(15)          null,
   constraint PK_FACTURA_DETALLE primary key (ID)
);

comment on table FACTURA_DETALLE is
'factura_detalle';

comment on column FACTURA_DETALLE.ID is
'id';

comment on column FACTURA_DETALLE.FACTURA_ID is
'factura_id';

comment on column FACTURA_DETALLE.PRODUCTO_SERVICIO_ID is
'producto_servicio_id';

comment on column FACTURA_DETALLE.DESCUENTO_PORCENTAJE is
'descuento_porcentaje';

comment on column FACTURA_DETALLE.VALOR_NETO is
'valor_neto';

comment on column FACTURA_DETALLE.VALOR_TOTAL is
'valor_total';

comment on column FACTURA_DETALLE.ESTADO is
'estado';

comment on column FACTURA_DETALLE.FECHA_REGISTRO is
'fecha_registro';

comment on column FACTURA_DETALLE.FECHA_ACTUALIZACION is
'fecha_actualizacion';

comment on column FACTURA_DETALLE.USUARIO_ID is
'usuario_id';

comment on column FACTURA_DETALLE.IP_ADDRESS is
'ip_address';

/*==============================================================*/
/* Table: FACTURA_ESTADO                                        */
/*==============================================================*/
create table FACTURA_ESTADO (
   ID                   VARCHAR(5)           not null,
   SIGUIENTE            VARCHAR(5)           null,
   PREVIO               VARCHAR(5)           null,
   INICIAL              NUMERIC(1)           null default 0
      constraint CKC_INICIAL_FACTURA_ check (INICIAL is null or (INICIAL between 0 and 1)),
   FINAL                NUMERIC(1)           null default 0
      constraint CKC_FINAL_FACTURA_ check (FINAL is null or (FINAL between 0 and 1)),
   constraint PK_FACTURA_ESTADO primary key (ID)
);

comment on table FACTURA_ESTADO is
'factura_estado';

comment on column FACTURA_ESTADO.ID is
'id';

comment on column FACTURA_ESTADO.SIGUIENTE is
'siguiente';

comment on column FACTURA_ESTADO.PREVIO is
'previo';

comment on column FACTURA_ESTADO.INICIAL is
'inicial';

comment on column FACTURA_ESTADO.FINAL is
'final';

/*==============================================================*/
/* Table: HISTORIA                                              */
/*==============================================================*/
create table HISTORIA (
   ID                   NUMERIC(15)          not null default NEXTVAL('historia_medica_seq'),
   FECHA                DATE                 not null default CURRENT_DATE,
   PACIENTE_PERSONA_ID  NUMERIC(10)          not null,
   MEDICO_PERSONA_ID    NUMERIC(10)          null,
   REGISTRO_MEDICO      VARCHAR(20)          null,
   HISTORIA_ESTADO_ID   VARCHAR(5)           null,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   USUARIO_ID           VARCHAR(10)          null,
   IP_ADDRESS           VARCHAR(15)          null,
   constraint PK_HISTORIA primary key (ID)
);

comment on table HISTORIA is
'historia';

comment on column HISTORIA.ID is
'id';

comment on column HISTORIA.FECHA is
'fecha';

comment on column HISTORIA.PACIENTE_PERSONA_ID is
'paciente_persona_id';

comment on column HISTORIA.MEDICO_PERSONA_ID is
'medico_persona_id';

comment on column HISTORIA.REGISTRO_MEDICO is
'registro_medico';

comment on column HISTORIA.HISTORIA_ESTADO_ID is
'historia_estado_id';

comment on column HISTORIA.FECHA_REGISTRO is
'fecha_registro';

comment on column HISTORIA.FECHA_ACTUALIZACION is
'fecha_actualizacion';

comment on column HISTORIA.USUARIO_ID is
'usuario_id';

comment on column HISTORIA.IP_ADDRESS is
'ip_address';

/*==============================================================*/
/* Table: HISTORIA_DIAGNOSTICOS                                 */
/*==============================================================*/
create table HISTORIA_DIAGNOSTICOS (
   ID                   NUMERIC(20)          not null default NEXTVAL('factura_detalle_seq'),
   HISTORIA_ID          NUMERIC(15)          not null,
   DIAGNOSTICO_ID       VARCHAR(4)           not null,
   NOTA_MEDICA          VARCHAR(200)         null,
   PROFESIONAL_SALUD    VARCHAR(50)          null default '0'
      constraint CKC_PROFESIONAL_SALUD_HISTORIA check (PROFESIONAL_SALUD is null or (PROFESIONAL_SALUD between '0' and '100')),
   ESTADO               NUMERIC(1)           null default 1,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   USUARIO_ID           VARCHAR(10)          null,
   IP_ADDRESS           VARCHAR(15)          null,
   constraint PK_HISTORIA_DIAGNOSTICOS primary key (ID)
);

comment on table HISTORIA_DIAGNOSTICOS is
'historia_diagnosticos';

comment on column HISTORIA_DIAGNOSTICOS.ID is
'id';

comment on column HISTORIA_DIAGNOSTICOS.HISTORIA_ID is
'historia_id';

comment on column HISTORIA_DIAGNOSTICOS.DIAGNOSTICO_ID is
'diagnostico_id';

comment on column HISTORIA_DIAGNOSTICOS.NOTA_MEDICA is
'nota_medica';

comment on column HISTORIA_DIAGNOSTICOS.PROFESIONAL_SALUD is
'profesional_salud';

comment on column HISTORIA_DIAGNOSTICOS.ESTADO is
'estado';

comment on column HISTORIA_DIAGNOSTICOS.FECHA_REGISTRO is
'fecha_registro';

comment on column HISTORIA_DIAGNOSTICOS.FECHA_ACTUALIZACION is
'fecha_actualizacion';

comment on column HISTORIA_DIAGNOSTICOS.USUARIO_ID is
'usuario_id';

comment on column HISTORIA_DIAGNOSTICOS.IP_ADDRESS is
'ip_address';

/*==============================================================*/
/* Table: HISTORIA_ESTADO                                       */
/*==============================================================*/
create table HISTORIA_ESTADO (
   ID                   VARCHAR(5)           not null,
   SIGUIENTE            VARCHAR(5)           null,
   PREVIO               VARCHAR(5)           null,
   INICIAL              NUMERIC(1)           null default 0
      constraint CKC_INICIAL_HISTORIA check (INICIAL is null or (INICIAL between 0 and 1)),
   FINAL                NUMERIC(1)           null default 0
      constraint CKC_FINAL_HISTORIA check (FINAL is null or (FINAL between 0 and 1)),
   constraint PK_HISTORIA_ESTADO primary key (ID)
);

comment on table HISTORIA_ESTADO is
'historia_estado';

comment on column HISTORIA_ESTADO.ID is
'id';

comment on column HISTORIA_ESTADO.SIGUIENTE is
'siguiente';

comment on column HISTORIA_ESTADO.PREVIO is
'previo';

comment on column HISTORIA_ESTADO.INICIAL is
'inicial';

comment on column HISTORIA_ESTADO.FINAL is
'final';

/*==============================================================*/
/* Table: HISTORIA_NOTAS                                        */
/*==============================================================*/
create table HISTORIA_NOTAS (
   ID                   NUMERIC(20)          not null default NEXTVAL('factura_detalle_seq'),
   HISTORIA_ID          NUMERIC(15)          not null,
   NOTA_MEDICA          VARCHAR(200)         not null,
   PROFESIONAL_SALUD    VARCHAR(50)          null default '0'
      constraint CKC_PROFESIONAL_SALUD_HISTORIA check (PROFESIONAL_SALUD is null or (PROFESIONAL_SALUD between '0' and '100')),
   ESTADO               NUMERIC(1)           null default 1,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   USUARIO_ID           VARCHAR(10)          null,
   IP_ADDRESS           VARCHAR(15)          null,
   constraint PK_HISTORIA_NOTAS primary key (ID)
);

comment on table HISTORIA_NOTAS is
'historia_notas';

comment on column HISTORIA_NOTAS.ID is
'id';

comment on column HISTORIA_NOTAS.HISTORIA_ID is
'historia_id';

comment on column HISTORIA_NOTAS.NOTA_MEDICA is
'nota_medica';

comment on column HISTORIA_NOTAS.PROFESIONAL_SALUD is
'profesional_salud';

comment on column HISTORIA_NOTAS.ESTADO is
'estado';

comment on column HISTORIA_NOTAS.FECHA_REGISTRO is
'fecha_registro';

comment on column HISTORIA_NOTAS.FECHA_ACTUALIZACION is
'fecha_actualizacion';

comment on column HISTORIA_NOTAS.USUARIO_ID is
'usuario_id';

comment on column HISTORIA_NOTAS.IP_ADDRESS is
'ip_address';

/*==============================================================*/
/* Table: HISTORIA_TRATAMIENTOS                                 */
/*==============================================================*/
create table HISTORIA_TRATAMIENTOS (
   ID                   NUMERIC(20)          not null default NEXTVAL('factura_detalle_seq'),
   HISTORIA_ID          NUMERIC(15)          not null,
   PROCEDIMIENTO_CUPS_ID VARCHAR(6)           not null,
   NOTA_MEDICA          VARCHAR(200)         null,
   PROFESIONAL_SALUD    VARCHAR(50)          null default '0'
      constraint CKC_PROFESIONAL_SALUD_HISTORIA check (PROFESIONAL_SALUD is null or (PROFESIONAL_SALUD between '0' and '100')),
   ESTADO               NUMERIC(1)           null default 1,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   USUARIO_ID           VARCHAR(10)          null,
   IP_ADDRESS           VARCHAR(15)          null,
   constraint PK_HISTORIA_TRATAMIENTOS primary key (ID)
);

comment on table HISTORIA_TRATAMIENTOS is
'historia_tratamientos';

comment on column HISTORIA_TRATAMIENTOS.ID is
'id';

comment on column HISTORIA_TRATAMIENTOS.HISTORIA_ID is
'historia_id';

comment on column HISTORIA_TRATAMIENTOS.PROCEDIMIENTO_CUPS_ID is
'procedimiento_cups_id';

comment on column HISTORIA_TRATAMIENTOS.NOTA_MEDICA is
'nota_medica';

comment on column HISTORIA_TRATAMIENTOS.PROFESIONAL_SALUD is
'profesional_salud';

comment on column HISTORIA_TRATAMIENTOS.ESTADO is
'estado';

comment on column HISTORIA_TRATAMIENTOS.FECHA_REGISTRO is
'fecha_registro';

comment on column HISTORIA_TRATAMIENTOS.FECHA_ACTUALIZACION is
'fecha_actualizacion';

comment on column HISTORIA_TRATAMIENTOS.USUARIO_ID is
'usuario_id';

comment on column HISTORIA_TRATAMIENTOS.IP_ADDRESS is
'ip_address';

/*==============================================================*/
/* Table: MEMBRESIA                                             */
/*==============================================================*/
create table MEMBRESIA (
   ID                   VARCHAR(3)           not null,
   NOMBRE               VARCHAR(20)          not null,
   DESCRIPCION          VARCHAR(100)         not null,
   VIGENTE_DESDE        DATE                 not null,
   VIGENTE_HASTA        DATE                 null,
   constraint PK_MEMBRESIA primary key (ID)
);

comment on table MEMBRESIA is
'membresia';

comment on column MEMBRESIA.ID is
'id';

comment on column MEMBRESIA.NOMBRE is
'nombre';

comment on column MEMBRESIA.DESCRIPCION is
'descripcion';

comment on column MEMBRESIA.VIGENTE_DESDE is
'vigente_desde';

comment on column MEMBRESIA.VIGENTE_HASTA is
'vigente_hasta';

/*==============================================================*/
/* Table: MEMBRESIA_SERVICIOS                                   */
/*==============================================================*/
create table MEMBRESIA_SERVICIOS (
   ID                   NUMERIC(5)           not null default NEXTVAL('membresia_servicios_seq'),
   MEMBRESIA_ID         VARCHAR(3)           not null,
   SERVICIO_ID          VARCHAR(3)           not null,
   ESTADO               NUMERIC(1)           null default 1,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   USUARIO_ID           VARCHAR(10)          null,
   IP_ADDRESS           VARCHAR(15)          null,
   constraint PK_MEMBRESIA_SERVICIOS primary key (ID)
);

comment on table MEMBRESIA_SERVICIOS is
'membresia_servicios';

comment on column MEMBRESIA_SERVICIOS.ID is
'id';

comment on column MEMBRESIA_SERVICIOS.MEMBRESIA_ID is
'membresia_id';

comment on column MEMBRESIA_SERVICIOS.SERVICIO_ID is
'servicio_id';

comment on column MEMBRESIA_SERVICIOS.ESTADO is
'estado';

comment on column MEMBRESIA_SERVICIOS.FECHA_REGISTRO is
'fecha_registro';

comment on column MEMBRESIA_SERVICIOS.FECHA_ACTUALIZACION is
'fecha_actualizacion';

comment on column MEMBRESIA_SERVICIOS.USUARIO_ID is
'usuario_id';

comment on column MEMBRESIA_SERVICIOS.IP_ADDRESS is
'ip_address';

/*==============================================================*/
/* Table: METODLOGIA_ENTRENAMIENTOS                             */
/*==============================================================*/
create table METODLOGIA_ENTRENAMIENTOS (
   METODOLOGIA_ID       VARCHAR(5)           not null,
   ENTRENAMIENTO_ID     VARCHAR(5)           not null,
   constraint PK_METODLOGIA_ENTRENAMIENTOS primary key (METODOLOGIA_ID, ENTRENAMIENTO_ID)
);

comment on table METODLOGIA_ENTRENAMIENTOS is
'metodlogia_entrenamientos';

comment on column METODLOGIA_ENTRENAMIENTOS.METODOLOGIA_ID is
'metodologia_id';

comment on column METODLOGIA_ENTRENAMIENTOS.ENTRENAMIENTO_ID is
'entrenamiento_id';

/*==============================================================*/
/* Table: METODOLOGIA                                           */
/*==============================================================*/
create table METODOLOGIA (
   ID                   VARCHAR(5)           not null,
   NOMBRE               VARCHAR(25)          not null,
   DESCRIPCION          VARCHAR(100)         null,
   URL_WIKI             VARCHAR(100)         null,
   URL_YOUTUBE          VARCHAR(100)         null,
   URL_ORGANIZACION     VARCHAR(100)         null,
   constraint PK_METODOLOGIA primary key (ID)
);

comment on table METODOLOGIA is
'metodologia';

comment on column METODOLOGIA.ID is
'id';

comment on column METODOLOGIA.NOMBRE is
'nombre';

comment on column METODOLOGIA.DESCRIPCION is
'descripcion';

comment on column METODOLOGIA.URL_WIKI is
'url_wiki';

comment on column METODOLOGIA.URL_YOUTUBE is
'url_youtube';

comment on column METODOLOGIA.URL_ORGANIZACION is
'url_organizacion';

/*==============================================================*/
/* Table: MONEDA                                                */
/*==============================================================*/
create table MONEDA (
   ID                   VARCHAR(3)           not null,
   NOMBRE               VARCHAR(30)          not null,
   SIMBOLO              VARCHAR(6)           not null,
   constraint PK_MONEDA primary key (ID)
);

comment on table MONEDA is
'moneda';

comment on column MONEDA.ID is
'id';

comment on column MONEDA.NOMBRE is
'nombre';

comment on column MONEDA.SIMBOLO is
'simbolo';

/*==============================================================*/
/* Table: MONEDA_PAISES                                         */
/*==============================================================*/
create table MONEDA_PAISES (
   PAIS_ID              VARCHAR(3)           not null,
   MONEDA_ID            VARCHAR(3)           not null,
   CORRIENTE            NUMERIC(1)           null default 1,
   ESTADO               NUMERIC(1)           null default 1,
   constraint PK_MONEDA_PAISES primary key (PAIS_ID, MONEDA_ID)
);

comment on table MONEDA_PAISES is
'moneda_paises';

comment on column MONEDA_PAISES.PAIS_ID is
'pais_id';

comment on column MONEDA_PAISES.MONEDA_ID is
'moneda_id';

comment on column MONEDA_PAISES.CORRIENTE is
'corriente';

comment on column MONEDA_PAISES.ESTADO is
'estado';

/*==============================================================*/
/* Table: PAGO                                                  */
/*==============================================================*/
create table PAGO (
   ID                   NUMERIC(15)          not null default NEXTVAL('pago_seq'),
   FECHA                DATE                 not null,
   PUNTO_VENTA_ID       VARCHAR(5)           not null,
   PAGO_ESTADO_ID       VARCHAR(5)           null,
   TOTAL_FACTURAS       NUMERIC(15,2)        not null default 0,
   TOTAL_PAGOS          NUMERIC(15,2)        not null default 0,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   USUARIO_ID           VARCHAR(10)          null,
   IP_ADDRESS           VARCHAR(15)          null,
   constraint PK_PAGO primary key (ID)
);

comment on table PAGO is
'pago';

comment on column PAGO.ID is
'id';

comment on column PAGO.FECHA is
'fecha';

comment on column PAGO.PUNTO_VENTA_ID is
'punto_venta_id';

comment on column PAGO.PAGO_ESTADO_ID is
'pago_estado_id';

comment on column PAGO.TOTAL_FACTURAS is
'total_facturas';

comment on column PAGO.TOTAL_PAGOS is
'total_pagos';

comment on column PAGO.FECHA_REGISTRO is
'fecha_registro';

comment on column PAGO.FECHA_ACTUALIZACION is
'fecha_actualizacion';

comment on column PAGO.USUARIO_ID is
'usuario_id';

comment on column PAGO.IP_ADDRESS is
'ip_address';

/*==============================================================*/
/* Table: PAGO_DETALLES                                         */
/*==============================================================*/
create table PAGO_DETALLES (
   ID                   NUMERIC(20)          not null default NEXTVAL('pago_detalles_seq'),
   PAGO_ID              NUMERIC(15)          not null,
   TIPO_PAGO_ID         VARCHAR(2)           not null,
   CUPO_ID              VARCHAR(5)           null,
   MONEDA_ID            VARCHAR(3)           not null,
   VALOR                NUMERIC(15,2)        not null default 0,
   AUTORIZACION_FRANQUICIA VARCHAR(20)          null,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   USUARIO_ID           VARCHAR(10)          null,
   IP_ADDRESS           VARCHAR(15)          null,
   constraint PK_PAGO_DETALLES primary key (ID)
);

comment on table PAGO_DETALLES is
'pago_detalles';

comment on column PAGO_DETALLES.ID is
'id';

comment on column PAGO_DETALLES.PAGO_ID is
'pago_id';

comment on column PAGO_DETALLES.TIPO_PAGO_ID is
'tipo_pago_id';

comment on column PAGO_DETALLES.CUPO_ID is
'cupo_id';

comment on column PAGO_DETALLES.MONEDA_ID is
'moneda_id';

comment on column PAGO_DETALLES.VALOR is
'valor';

comment on column PAGO_DETALLES.AUTORIZACION_FRANQUICIA is
'autorizacion_franquicia';

comment on column PAGO_DETALLES.FECHA_REGISTRO is
'fecha_registro';

comment on column PAGO_DETALLES.FECHA_ACTUALIZACION is
'fecha_actualizacion';

comment on column PAGO_DETALLES.USUARIO_ID is
'usuario_id';

comment on column PAGO_DETALLES.IP_ADDRESS is
'ip_address';

/*==============================================================*/
/* Table: PAGO_ESTADO                                           */
/*==============================================================*/
create table PAGO_ESTADO (
   ID                   VARCHAR(5)           not null,
   SIGUIENTE            VARCHAR(5)           null,
   PREVIO               VARCHAR(5)           null,
   INICIAL              NUMERIC(1)           null default 0
      constraint CKC_INICIAL_PAGO_EST check (INICIAL is null or (INICIAL between 0 and 1)),
   FINAL                NUMERIC(1)           null default 0
      constraint CKC_FINAL_PAGO_EST check (FINAL is null or (FINAL between 0 and 1)),
   constraint PK_PAGO_ESTADO primary key (ID)
);

comment on table PAGO_ESTADO is
'pago_estado';

comment on column PAGO_ESTADO.ID is
'id';

comment on column PAGO_ESTADO.SIGUIENTE is
'siguiente';

comment on column PAGO_ESTADO.PREVIO is
'previo';

comment on column PAGO_ESTADO.INICIAL is
'inicial';

comment on column PAGO_ESTADO.FINAL is
'final';

/*==============================================================*/
/* Table: PAGO_FACTURAS                                         */
/*==============================================================*/
create table PAGO_FACTURAS (
   ID                   NUMERIC(20)          not null default NEXTVAL('pago_facturas_seq'),
   PAGO_ID              NUMERIC(15)          not null,
   FACTURA_ID           NUMERIC(15)          not null,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   constraint PK_PAGO_FACTURAS primary key (ID)
);

comment on table PAGO_FACTURAS is
'pago_facturas';

comment on column PAGO_FACTURAS.ID is
'id';

comment on column PAGO_FACTURAS.PAGO_ID is
'pago_id';

comment on column PAGO_FACTURAS.FACTURA_ID is
'factura_id';

comment on column PAGO_FACTURAS.FECHA_REGISTRO is
'fecha_registro';

/*==============================================================*/
/* Table: PAIS                                                  */
/*==============================================================*/
create table PAIS (
   ID                   VARCHAR(3)           not null,
   NOMBRE               VARCHAR(50)          not null,
   INDICATIVO_TELEFONICO NUMERIC(4)           not null,
   CONTINENTE_ID        VARCHAR(2)           not null,
   ESTADO               NUMERIC(1)           null default 1,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   USUARIO_ID           VARCHAR(10)          null,
   IP_ADDRESS           VARCHAR(15)          null,
   constraint PK_PAIS primary key (ID)
);

comment on table PAIS is
'pais';

comment on column PAIS.ID is
'id';

comment on column PAIS.NOMBRE is
'nombre';

comment on column PAIS.INDICATIVO_TELEFONICO is
'indicativo_telefonico';

comment on column PAIS.CONTINENTE_ID is
'continente_id';

comment on column PAIS.ESTADO is
'estado';

comment on column PAIS.FECHA_REGISTRO is
'fecha_registro';

comment on column PAIS.FECHA_ACTUALIZACION is
'fecha_actualizacion';

comment on column PAIS.USUARIO_ID is
'usuario_id';

comment on column PAIS.IP_ADDRESS is
'ip_address';

/*==============================================================*/
/* Table: PERSONA                                               */
/*==============================================================*/
create table PERSONA (
   ID                   NUMERIC(10)          not null default NEXTVAL('persona_seq'),
   NOMBRE               VARCHAR(20)          not null,
   NOMBRE_SEC           VARCHAR(20)          null,
   APELLIDO             VARCHAR(40)          not null,
   APELLIDO_SEC         VARCHAR(40)          null,
   TIPO_DOCUMENTO_ID    VARCHAR(2)           not null,
   DOCUMENTO            VARCHAR(20)          not null,
   FECHA_NACIMIENTO     DATE                 not null,
   NACIONALIDAD_PAIS_ID VARCHAR(3)           not null,
   LUGAR_NACIMIENTO_CIUDAD_ID VARCHAR(5)           not null,
   ESTADO               NUMERIC(1)           null default 1,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   USUARIO_ID           VARCHAR(10)          null,
   IP_ADDRESS           VARCHAR(15)          null,
   constraint PK_PERSONA primary key (ID)
);

comment on table PERSONA is
'persona';

comment on column PERSONA.ID is
'id';

comment on column PERSONA.NOMBRE is
'nombre';

comment on column PERSONA.NOMBRE_SEC is
'nombre_sec';

comment on column PERSONA.APELLIDO is
'apellido';

comment on column PERSONA.APELLIDO_SEC is
'apellido_sec';

comment on column PERSONA.TIPO_DOCUMENTO_ID is
'tipo_documento_id';

comment on column PERSONA.DOCUMENTO is
'documento';

comment on column PERSONA.FECHA_NACIMIENTO is
'fecha_nacimiento';

comment on column PERSONA.NACIONALIDAD_PAIS_ID is
'nacionalidad_pais_id';

comment on column PERSONA.LUGAR_NACIMIENTO_CIUDAD_ID is
'lugar_nacimiento_ciudad_id';

comment on column PERSONA.ESTADO is
'estado';

comment on column PERSONA.FECHA_REGISTRO is
'fecha_registro';

comment on column PERSONA.FECHA_ACTUALIZACION is
'fecha_actualizacion';

comment on column PERSONA.USUARIO_ID is
'usuario_id';

comment on column PERSONA.IP_ADDRESS is
'ip_address';

/*==============================================================*/
/* Table: PERSONA_EMAILS                                        */
/*==============================================================*/
create table PERSONA_EMAILS (
   ID                   NUMERIC(10)          not null default NEXTVAL('persona_emails_seq'),
   PERSONA_ID           NUMERIC(10)          not null,
   TIPO_EMAIL_ID        VARCHAR(3)           not null,
   EMAIL                VARCHAR(50)          not null,
   ESTADO               NUMERIC(1)           null default 1,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   USUARIO_ID           VARCHAR(10)          null,
   IP_ADDRESS           VARCHAR(15)          null,
   constraint PK_PERSONA_EMAILS primary key (ID)
);

comment on table PERSONA_EMAILS is
'persona_emails';

comment on column PERSONA_EMAILS.ID is
'id';

comment on column PERSONA_EMAILS.PERSONA_ID is
'persona_id';

comment on column PERSONA_EMAILS.TIPO_EMAIL_ID is
'tipo_email_id';

comment on column PERSONA_EMAILS.EMAIL is
'email';

comment on column PERSONA_EMAILS.ESTADO is
'estado';

comment on column PERSONA_EMAILS.FECHA_REGISTRO is
'fecha_registro';

comment on column PERSONA_EMAILS.FECHA_ACTUALIZACION is
'fecha_actualizacion';

comment on column PERSONA_EMAILS.USUARIO_ID is
'usuario_id';

comment on column PERSONA_EMAILS.IP_ADDRESS is
'ip_address';

/*==============================================================*/
/* Table: PERSONA_ROLES                                         */
/*==============================================================*/
create table PERSONA_ROLES (
   PERSONA_ID           NUMERIC(10)          not null,
   ROL_PERSONA_ID       VARCHAR(3)           not null,
   PERSONA_TELEFONOS_ID NUMERIC(5)           null,
   ESTADO               NUMERIC(1)           null default 1,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   USUARIO_ID           VARCHAR(10)          null,
   IP_ADDRESS           VARCHAR(15)          null,
   constraint PK_PERSONA_ROLES primary key (PERSONA_ID, ROL_PERSONA_ID)
);

comment on table PERSONA_ROLES is
'persona_roles';

comment on column PERSONA_ROLES.PERSONA_ID is
'persona_id';

comment on column PERSONA_ROLES.ROL_PERSONA_ID is
'rol_persona_id';

comment on column PERSONA_ROLES.PERSONA_TELEFONOS_ID is
'persona_telefonos_id';

comment on column PERSONA_ROLES.ESTADO is
'estado';

comment on column PERSONA_ROLES.FECHA_REGISTRO is
'fecha_registro';

comment on column PERSONA_ROLES.FECHA_ACTUALIZACION is
'fecha_actualizacion';

comment on column PERSONA_ROLES.USUARIO_ID is
'usuario_id';

comment on column PERSONA_ROLES.IP_ADDRESS is
'ip_address';

/*==============================================================*/
/* Table: PERSONA_TELEFONOS                                     */
/*==============================================================*/
create table PERSONA_TELEFONOS (
   ID                   NUMERIC(5)           not null default NEXTVAL('persona_telefonos_seq'),
   TIPO_TELEFONO_ID     VARCHAR(3)           not null,
   PERSONA_ID           NUMERIC(10)          not null,
   PAIS_ID              VARCHAR(3)           not null,
   NUMERO               NUMERIC(15)          not null,
   WHATSAPP             NUMERIC(1)           null default 0,
   ESTADO               NUMERIC(1)           null default 1,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   USUARIO_ID           VARCHAR(10)          null,
   IP_ADDRESS           VARCHAR(15)          null,
   constraint PK_PERSONA_TELEFONOS primary key (ID)
);

comment on table PERSONA_TELEFONOS is
'persona_telefonos';

comment on column PERSONA_TELEFONOS.ID is
'id';

comment on column PERSONA_TELEFONOS.TIPO_TELEFONO_ID is
'tipo_telefono_id';

comment on column PERSONA_TELEFONOS.PERSONA_ID is
'persona_id';

comment on column PERSONA_TELEFONOS.PAIS_ID is
'pais_id';

comment on column PERSONA_TELEFONOS.NUMERO is
'numero';

comment on column PERSONA_TELEFONOS.WHATSAPP is
'whatsapp';

comment on column PERSONA_TELEFONOS.ESTADO is
'estado';

comment on column PERSONA_TELEFONOS.FECHA_REGISTRO is
'fecha_registro';

comment on column PERSONA_TELEFONOS.FECHA_ACTUALIZACION is
'fecha_actualizacion';

comment on column PERSONA_TELEFONOS.USUARIO_ID is
'usuario_id';

comment on column PERSONA_TELEFONOS.IP_ADDRESS is
'ip_address';

/*==============================================================*/
/* Index: IDX_PAIS_NUMERO                                       */
/*==============================================================*/
create unique index IDX_PAIS_NUMERO on PERSONA_TELEFONOS (
PAIS_ID,
NUMERO
);

/*==============================================================*/
/* Table: PROCEDIMIENTO                                         */
/*==============================================================*/
create table PROCEDIMIENTO (
   ID                   VARCHAR(5)           not null,
   PROCESO_ID           VARCHAR(2)           not null,
   SERVICIO_ID          VARCHAR(3)           null,
   NOMBRE               VARCHAR(30)          not null,
   DESCRIPCION          VARCHAR(100)         null,
   constraint PK_PROCEDIMIENTO primary key (ID)
);

comment on table PROCEDIMIENTO is
'procedimiento';

comment on column PROCEDIMIENTO.ID is
'id';

comment on column PROCEDIMIENTO.PROCESO_ID is
'proceso_id';

comment on column PROCEDIMIENTO.SERVICIO_ID is
'servicio_id';

comment on column PROCEDIMIENTO.NOMBRE is
'nombre';

comment on column PROCEDIMIENTO.DESCRIPCION is
'descripcion';

/*==============================================================*/
/* Table: PROCEDIMIENTO_CUPS                                    */
/*==============================================================*/
create table PROCEDIMIENTO_CUPS (
   ID                   VARCHAR(6)           not null,
   CUPS                 VARCHAR(10)          not null,
   NOMBRE               VARCHAR(100)         not null,
   DESCRIPCION          VARCHAR(200)         null,
   constraint PK_PROCEDIMIENTO_CUPS primary key (ID)
);

comment on table PROCEDIMIENTO_CUPS is
'procedimiento_cups';

comment on column PROCEDIMIENTO_CUPS.ID is
'id';

comment on column PROCEDIMIENTO_CUPS.CUPS is
'cups';

comment on column PROCEDIMIENTO_CUPS.NOMBRE is
'nombre';

comment on column PROCEDIMIENTO_CUPS.DESCRIPCION is
'descripcion';

/*==============================================================*/
/* Table: PROCESO                                               */
/*==============================================================*/
create table PROCESO (
   ID                   VARCHAR(2)           not null,
   NOMBRE               VARCHAR(25)          not null,
   DESCRIPCION          VARCHAR(100)         null,
   constraint PK_PROCESO primary key (ID)
);

comment on table PROCESO is
'proceso';

comment on column PROCESO.ID is
'id';

comment on column PROCESO.NOMBRE is
'nombre';

comment on column PROCESO.DESCRIPCION is
'descripcion';

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO (
   ID                   VARCHAR(6)           not null,
   NOMBRE               VARCHAR(50)          not null,
   DESCRIPCION          VARCHAR(100)         null,
   MEMBRESIA_ID         VARCHAR(3)           null,
   TIPO_PRODUCTO_ID     VARCHAR(2)           not null,
   VIGENTE_DESDE        DATE                 null default CURRENT_DATE,
   ESTADO               NUMERIC(1)           null default 1,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   USUARIO_ID           VARCHAR(10)          null,
   IP_ADDRESS           VARCHAR(15)          null,
   constraint PK_PRODUCTO primary key (ID)
);

comment on table PRODUCTO is
'producto';

comment on column PRODUCTO.ID is
'id';

comment on column PRODUCTO.NOMBRE is
'nombre';

comment on column PRODUCTO.DESCRIPCION is
'descripcion';

comment on column PRODUCTO.MEMBRESIA_ID is
'membresia_id';

comment on column PRODUCTO.TIPO_PRODUCTO_ID is
'tipo_producto_id';

comment on column PRODUCTO.VIGENTE_DESDE is
'vigente_desde';

comment on column PRODUCTO.ESTADO is
'estado';

comment on column PRODUCTO.FECHA_REGISTRO is
'fecha_registro';

comment on column PRODUCTO.FECHA_ACTUALIZACION is
'fecha_actualizacion';

comment on column PRODUCTO.USUARIO_ID is
'usuario_id';

comment on column PRODUCTO.IP_ADDRESS is
'ip_address';

/*==============================================================*/
/* Table: PRODUCTO_COSTO                                        */
/*==============================================================*/
create table PRODUCTO_COSTO (
   ID                   NUMERIC(5)           not null default NEXTVAL('producto_costo_seq'),
   PRODUCTO_ID          VARCHAR(6)           not null,
   VALOR                NUMERIC(15,2)        not null default 0,
   VIGENTE_DESDE        DATE                 null default CURRENT_DATE,
   VIGENTE_HASTA        DATE                 null default CURRENT_DATE,
   ESTADO               NUMERIC(1)           null default 1,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   USUARIO_ID           VARCHAR(10)          null,
   IP_ADDRESS           VARCHAR(15)          null,
   constraint PK_PRODUCTO_COSTO primary key (ID)
);

comment on table PRODUCTO_COSTO is
'producto_costo';

comment on column PRODUCTO_COSTO.ID is
'id';

comment on column PRODUCTO_COSTO.PRODUCTO_ID is
'producto_id';

comment on column PRODUCTO_COSTO.VALOR is
'valor';

comment on column PRODUCTO_COSTO.VIGENTE_DESDE is
'vigente_desde';

comment on column PRODUCTO_COSTO.VIGENTE_HASTA is
'vigente_hasta';

comment on column PRODUCTO_COSTO.ESTADO is
'estado';

comment on column PRODUCTO_COSTO.FECHA_REGISTRO is
'fecha_registro';

comment on column PRODUCTO_COSTO.FECHA_ACTUALIZACION is
'fecha_actualizacion';

comment on column PRODUCTO_COSTO.USUARIO_ID is
'usuario_id';

comment on column PRODUCTO_COSTO.IP_ADDRESS is
'ip_address';

/*==============================================================*/
/* Table: PUNTO_VENTA                                           */
/*==============================================================*/
create table PUNTO_VENTA (
   ID                   VARCHAR(5)           not null,
   TIPO_PUNTO_VENTA_ID  VARCHAR(2)           not null,
   CIUDAD_ID            VARCHAR(5)           not null,
   NOMBRE               VARCHAR(30)          not null,
   ESTADO               NUMERIC(1)           null default 1,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   USUARIO_ID           VARCHAR(10)          null,
   IP_ADDRESS           VARCHAR(15)          null,
   constraint PK_PUNTO_VENTA primary key (ID)
);

comment on table PUNTO_VENTA is
'punto_venta';

comment on column PUNTO_VENTA.ID is
'id';

comment on column PUNTO_VENTA.TIPO_PUNTO_VENTA_ID is
'tipo_punto_venta_id';

comment on column PUNTO_VENTA.CIUDAD_ID is
'ciudad_id';

comment on column PUNTO_VENTA.NOMBRE is
'nombre';

comment on column PUNTO_VENTA.ESTADO is
'estado';

comment on column PUNTO_VENTA.FECHA_REGISTRO is
'fecha_registro';

comment on column PUNTO_VENTA.FECHA_ACTUALIZACION is
'fecha_actualizacion';

comment on column PUNTO_VENTA.USUARIO_ID is
'usuario_id';

comment on column PUNTO_VENTA.IP_ADDRESS is
'ip_address';

/*==============================================================*/
/* Table: RESOLUCION                                            */
/*==============================================================*/
create table RESOLUCION (
   ID                   NUMERIC(3)           not null default NEXTVAL('resolucion_seq'),
   CODIGO_DIAN          VARCHAR(20)          not null,
   DESCRIPCION          VARCHAR(100)         not null,
   FECHA                DATE                 not null,
   ESTADO               NUMERIC(1)           null default 1,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   USUARIO_ID           VARCHAR(10)          null,
   IP_ADDRESS           VARCHAR(15)          null,
   constraint PK_RESOLUCION primary key (ID)
);

comment on table RESOLUCION is
'resolucion';

comment on column RESOLUCION.ID is
'id';

comment on column RESOLUCION.CODIGO_DIAN is
'codigo_dian';

comment on column RESOLUCION.DESCRIPCION is
'descripcion';

comment on column RESOLUCION.FECHA is
'fecha';

comment on column RESOLUCION.ESTADO is
'estado';

comment on column RESOLUCION.FECHA_REGISTRO is
'fecha_registro';

comment on column RESOLUCION.FECHA_ACTUALIZACION is
'fecha_actualizacion';

comment on column RESOLUCION.USUARIO_ID is
'usuario_id';

comment on column RESOLUCION.IP_ADDRESS is
'ip_address';

/*==============================================================*/
/* Table: RESOLUCION_SEC                                        */
/*==============================================================*/
create table RESOLUCION_SEC (
   ID                   NUMERIC(5)           not null default NEXTVAL('resolucion_sec_seq'),
   RESOLUCION_ID        NUMERIC(3)           not null,
   FECHA                DATE                 not null default CURRENT_DATE,
   PREFIJO              VARCHAR(3)           not null,
   SECUENCIA_INICIO     NUMERIC(10)          not null,
   SECUENCIA_FIN        NUMERIC(10)          not null,
   SECUENCIA_ACTUAL     NUMERIC(10)          not null,
   ESTADO               NUMERIC(1)           null default 1,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   USUARIO_ID           VARCHAR(10)          null,
   IP_ADDRESS           VARCHAR(15)          null,
   constraint PK_RESOLUCION_SEC primary key (ID)
);

comment on table RESOLUCION_SEC is
'resolucion_sec';

comment on column RESOLUCION_SEC.ID is
'id';

comment on column RESOLUCION_SEC.RESOLUCION_ID is
'resolucion_id';

comment on column RESOLUCION_SEC.FECHA is
'fecha';

comment on column RESOLUCION_SEC.PREFIJO is
'prefijo';

comment on column RESOLUCION_SEC.SECUENCIA_INICIO is
'secuencia_inicio';

comment on column RESOLUCION_SEC.SECUENCIA_FIN is
'secuencia_fin';

comment on column RESOLUCION_SEC.SECUENCIA_ACTUAL is
'secuencia_actual';

comment on column RESOLUCION_SEC.ESTADO is
'estado';

comment on column RESOLUCION_SEC.FECHA_REGISTRO is
'fecha_registro';

comment on column RESOLUCION_SEC.FECHA_ACTUALIZACION is
'fecha_actualizacion';

comment on column RESOLUCION_SEC.USUARIO_ID is
'usuario_id';

comment on column RESOLUCION_SEC.IP_ADDRESS is
'ip_address';

/*==============================================================*/
/* Table: ROL_PERSONA                                           */
/*==============================================================*/
create table ROL_PERSONA (
   ID                   VARCHAR(3)           not null,
   NOMBRE               VARCHAR(25)          not null,
   constraint PK_ROL_PERSONA primary key (ID)
);

comment on table ROL_PERSONA is
'rol_persona';

comment on column ROL_PERSONA.ID is
'id';

comment on column ROL_PERSONA.NOMBRE is
'nombre';

/*==============================================================*/
/* Table: SERVICIO                                              */
/*==============================================================*/
create table SERVICIO (
   ID                   VARCHAR(3)           not null,
   NOMBRE               VARCHAR(30)          not null,
   TIPO_SERVICIO_ID     VARCHAR(2)           null,
   constraint PK_SERVICIO primary key (ID)
);

comment on table SERVICIO is
'servicio';

comment on column SERVICIO.ID is
'id';

comment on column SERVICIO.NOMBRE is
'nombre';

comment on column SERVICIO.TIPO_SERVICIO_ID is
'tipo_servicio_id';

/*==============================================================*/
/* Table: TIPO_ACCESO                                           */
/*==============================================================*/
create table TIPO_ACCESO (
   ID                   VARCHAR(2)           not null,
   NOMBRE               VARCHAR(25)          not null,
   constraint PK_TIPO_ACCESO primary key (ID)
);

comment on table TIPO_ACCESO is
'tipo_acceso';

comment on column TIPO_ACCESO.ID is
'id';

comment on column TIPO_ACCESO.NOMBRE is
'nombre';

/*==============================================================*/
/* Table: TIPO_ACTIVIDAD                                        */
/*==============================================================*/
create table TIPO_ACTIVIDAD (
   ID                   VARCHAR(2)           not null,
   NOMBRE               VARCHAR(25)          not null,
   constraint PK_TIPO_ACTIVIDAD primary key (ID)
);

comment on table TIPO_ACTIVIDAD is
'tipo_actividad';

comment on column TIPO_ACTIVIDAD.ID is
'id';

comment on column TIPO_ACTIVIDAD.NOMBRE is
'nombre';

/*==============================================================*/
/* Table: TIPO_CUPON                                            */
/*==============================================================*/
create table TIPO_CUPON (
   ID                   VARCHAR(2)           not null,
   NOMBRE               VARCHAR(25)          not null,
   constraint PK_TIPO_CUPON primary key (ID)
);

comment on table TIPO_CUPON is
'tipo_cupon';

comment on column TIPO_CUPON.ID is
'id';

comment on column TIPO_CUPON.NOMBRE is
'nombre';

/*==============================================================*/
/* Table: TIPO_DOCUMENTO                                        */
/*==============================================================*/
create table TIPO_DOCUMENTO (
   ID                   VARCHAR(2)           not null,
   NOMBRE               VARCHAR(50)          not null,
   constraint PK_TIPO_DOCUMENTO primary key (ID)
);

comment on table TIPO_DOCUMENTO is
'tipo_documento';

comment on column TIPO_DOCUMENTO.ID is
'id';

comment on column TIPO_DOCUMENTO.NOMBRE is
'nombre';

/*==============================================================*/
/* Table: TIPO_EMAIL                                            */
/*==============================================================*/
create table TIPO_EMAIL (
   ID                   VARCHAR(3)           not null,
   NOMBRE               VARCHAR(25)          not null,
   constraint PK_TIPO_EMAIL primary key (ID)
);

comment on table TIPO_EMAIL is
'tipo_email';

comment on column TIPO_EMAIL.ID is
'id';

comment on column TIPO_EMAIL.NOMBRE is
'nombre';

/*==============================================================*/
/* Table: TIPO_ENTRENAMIENTO                                    */
/*==============================================================*/
create table TIPO_ENTRENAMIENTO (
   ID                   VARCHAR(2)           not null,
   NOMBRE               VARCHAR(25)          not null,
   constraint PK_TIPO_ENTRENAMIENTO primary key (ID)
);

comment on table TIPO_ENTRENAMIENTO is
'tipo_entrenamiento';

comment on column TIPO_ENTRENAMIENTO.ID is
'id';

comment on column TIPO_ENTRENAMIENTO.NOMBRE is
'nombre';

/*==============================================================*/
/* Table: TIPO_EVENTO                                           */
/*==============================================================*/
create table TIPO_EVENTO (
   ID                   VARCHAR(2)           not null,
   NOMBRE               VARCHAR(25)          not null,
   constraint PK_TIPO_EVENTO primary key (ID)
);

comment on table TIPO_EVENTO is
'tipo_evento';

comment on column TIPO_EVENTO.ID is
'id';

comment on column TIPO_EVENTO.NOMBRE is
'nombre';

/*==============================================================*/
/* Table: TIPO_PAGO                                             */
/*==============================================================*/
create table TIPO_PAGO (
   ID                   VARCHAR(2)           not null,
   NOMBRE               VARCHAR(25)          not null,
   constraint PK_TIPO_PAGO primary key (ID)
);

comment on table TIPO_PAGO is
'tipo_pago';

comment on column TIPO_PAGO.ID is
'id';

comment on column TIPO_PAGO.NOMBRE is
'nombre';

/*==============================================================*/
/* Table: TIPO_PRODUCTO                                         */
/*==============================================================*/
create table TIPO_PRODUCTO (
   ID                   VARCHAR(2)           not null,
   NOMBRE               VARCHAR(25)          not null,
   constraint PK_TIPO_PRODUCTO primary key (ID)
);

comment on table TIPO_PRODUCTO is
'tipo_producto';

comment on column TIPO_PRODUCTO.ID is
'id';

comment on column TIPO_PRODUCTO.NOMBRE is
'nombre';

/*==============================================================*/
/* Table: TIPO_PUNTO_VENTA                                      */
/*==============================================================*/
create table TIPO_PUNTO_VENTA (
   ID                   VARCHAR(2)           not null,
   NOMBRE               VARCHAR(25)          not null,
   constraint PK_TIPO_PUNTO_VENTA primary key (ID)
);

comment on table TIPO_PUNTO_VENTA is
'tipo_punto_venta';

comment on column TIPO_PUNTO_VENTA.ID is
'id';

comment on column TIPO_PUNTO_VENTA.NOMBRE is
'nombre';

/*==============================================================*/
/* Table: TIPO_SERVICIO                                         */
/*==============================================================*/
create table TIPO_SERVICIO (
   ID                   VARCHAR(2)           not null,
   NOMBRE               VARCHAR(25)          not null,
   constraint PK_TIPO_SERVICIO primary key (ID)
);

comment on table TIPO_SERVICIO is
'tipo_servicio';

comment on column TIPO_SERVICIO.ID is
'id';

comment on column TIPO_SERVICIO.NOMBRE is
'nombre';

/*==============================================================*/
/* Table: TIPO_TELEFONO                                         */
/*==============================================================*/
create table TIPO_TELEFONO (
   ID                   VARCHAR(3)           not null,
   NOMBRE               VARCHAR(25)          not null,
   constraint PK_TIPO_TELEFONO primary key (ID)
);

comment on table TIPO_TELEFONO is
'tipo_telefono';

comment on column TIPO_TELEFONO.ID is
'id';

comment on column TIPO_TELEFONO.NOMBRE is
'nombre';

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO (
   ID                   VARCHAR(10)          not null,
   NOMBRE               VARCHAR(50)          not null,
   EMAIL                VARCHAR(50)          not null,
   PASSWORD             VARCHAR(50)          not null,
   ESTADO               NUMERIC(1)           null default 1,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE null default CURRENT_TIMESTAMP,
   USUARIO_ID           VARCHAR(10)          null,
   IP_ADDRESS           VARCHAR(15)          null,
   constraint PK_USUARIO primary key (ID)
);

comment on table USUARIO is
'usuario';

comment on column USUARIO.ID is
'id';

comment on column USUARIO.NOMBRE is
'nombre';

comment on column USUARIO.EMAIL is
'email';

comment on column USUARIO.PASSWORD is
'password';

comment on column USUARIO.ESTADO is
'estado';

comment on column USUARIO.FECHA_REGISTRO is
'fecha_registro';

comment on column USUARIO.FECHA_ACTUALIZACION is
'fecha_actualizacion';

comment on column USUARIO.USUARIO_ID is
'usuario_id';

comment on column USUARIO.IP_ADDRESS is
'ip_address';

alter table CHAT_CONVERSACION
   add constraint FK_CHAT_CONV_RF_ESTADO foreign key (CHAT_ESTADO_ID)
      references CHAT_ESTADO (ID)
      on delete restrict on update restrict;

alter table CHAT_CONVERSACION
   add constraint FK_CHAT_RF_REM_PERSONA_TEL foreign key (PERSONA_TELEFONOS_ID)
      references PERSONA_TELEFONOS (ID)
      on delete restrict on update restrict;

alter table CHAT_ENTRENAMIENTO_PLAN
   add constraint FK_CHAT_ENT_RF_CHAT foreign key (CHAT_CONVERSACION_ID)
      references CHAT_CONVERSACION (ID)
      on delete restrict on update restrict;

alter table CHAT_ENTRENAMIENTO_PLAN
   add constraint FK_CHAT_ENT_RF_ENT_PLAN foreign key (ENTRENAMIENTO_PLAN_ID)
      references ENTRENAMIENTO_PLAN (ID)
      on delete restrict on update restrict;

alter table CHAT_MENSAJE
   add constraint FK_CHAT_MSJ_RF_CHAT_CONV foreign key (CHAT_CONVERSACION_ID)
      references CHAT_CONVERSACION (ID)
      on delete restrict on update restrict;

alter table CHAT_MENSAJE_MEDIA
   add constraint FK_CHAT_MM_RF_CHAT_MSJ foreign key (ID)
      references CHAT_MENSAJE (ID)
      on delete restrict on update restrict;

alter table CIUDAD
   add constraint FK_CIUDAD_REF_DEPTO foreign key (DEPTO_ID)
      references DEPTO (ID)
      on delete restrict on update restrict;

alter table CUPON
   add constraint FK_CUPON_REF_MONEDA foreign key (MONEDA_ID)
      references MONEDA (ID)
      on delete restrict on update restrict;

alter table CUPON
   add constraint FK_CUPON_REF_TIPO_CUPON foreign key (TIPO_CUPON_ID)
      references TIPO_CUPON (ID)
      on delete restrict on update restrict;

alter table DEPTO
   add constraint FK_DEPTO_REF_PAIS foreign key (PAIS_ID)
      references PAIS (ID)
      on delete restrict on update restrict;

alter table ENTRENAMIENTO
   add constraint FK_ENTRENAM_REF_PRO_PRO foreign key (PROCEDIMIENTO_ID)
      references PROCEDIMIENTO (ID)
      on delete restrict on update restrict;

alter table ENTRENAMIENTO
   add constraint FK_ENTRENAM_REF_TIPO_ENTRE foreign key (TIPO_ENTRENAMIENTO_ID)
      references TIPO_ENTRENAMIENTO (ID)
      on delete restrict on update restrict;

alter table ENTRENAMIENTO_ACTIVIDAD
   add constraint FK_ENTR_REF_TIPO_ACT foreign key (TIPO_ACTIVIDAD_ID)
      references TIPO_ACTIVIDAD (ID)
      on delete restrict on update restrict;

alter table ENTRENAMIENTO_ACTIVIDAD
   add constraint FK_ENT_REF_ENT_ACT foreign key (ENTRENAMIENTO_ID)
      references ENTRENAMIENTO (ID)
      on delete restrict on update restrict;

alter table ENTRENAMIENTO_PLAN
   add constraint FK_ENTR_PLAN_REF_ENTR foreign key (ENTRENAMIENTO_ID)
      references ENTRENAMIENTO (ID)
      on delete restrict on update restrict;

alter table ENTRENAMIENTO_PLAN
   add constraint FK_ENT_PLAN_REF_PER_ATLETA foreign key (ATLETA_ID)
      references PERSONA (ID)
      on delete restrict on update restrict;

alter table ENTRENAMIENTO_PLAN
   add constraint FK_ENT_PLAN_REF_PER_ENTRE foreign key (ENTRENADOR_ID)
      references PERSONA (ID)
      on delete restrict on update restrict;

alter table ENTRENAMIENTO_SEGUIMIENTO
   add constraint FK_ENT_SEG_REF_ENT_ACT foreign key (ENTRENAMIENTO_ACTIVIDAD_ID)
      references ENTRENAMIENTO_ACTIVIDAD (ID)
      on delete restrict on update restrict;

alter table ENTRENAMIENTO_SEGUIMIENTO
   add constraint FK_ENT_SEG_REF_ENT_PLAN foreign key (ENTRENAMIENTO_PLAN_ID)
      references ENTRENAMIENTO_PLAN (ID)
      on delete restrict on update restrict;

alter table EVENTO
   add constraint FK_EVENTO_RF_CIUDAD foreign key (CIUDAD_ID)
      references CIUDAD (ID)
      on delete restrict on update restrict;

alter table EVENTO
   add constraint FK_EVENTO_RF_TIPO_ACCESO foreign key (TIPO_ACCESO_ID)
      references TIPO_ACCESO (ID)
      on delete restrict on update restrict;

alter table EVENTO
   add constraint FK_EVENTO_RF_TIPO_EVENTO foreign key (TIPO_EVENTO_ID)
      references TIPO_EVENTO (ID)
      on delete restrict on update restrict;

alter table EVENTO_PARTICIPANTES
   add constraint FK_EVEPAR_RF_EVENTO foreign key (EVENTO_ID)
      references EVENTO (ID)
      on delete restrict on update restrict;

alter table EVENTO_PARTICIPANTES
   add constraint FK_EVEPAR_RF_PERSONA foreign key (PERSONA_ID)
      references PERSONA (ID)
      on delete restrict on update restrict;

alter table FACTURA
   add constraint FK_FACTURA_REF_FACT_EST foreign key (FACTURA_ESTADO_ID)
      references FACTURA_ESTADO (ID)
      on delete restrict on update restrict;

alter table FACTURA
   add constraint FK_FACTURA_REF_MONEDA foreign key (MONEDA_ID)
      references MONEDA (ID)
      on delete restrict on update restrict;

alter table FACTURA
   add constraint FK_FACTURA_REF_PERSONA foreign key (CLIENTE_PERSONA_ID)
      references PERSONA (ID)
      on delete restrict on update restrict;

alter table FACTURA
   add constraint FK_FACTURA_REF_PUNTO_VEN foreign key (PUNTO_VENTA_ID)
      references PUNTO_VENTA (ID)
      on delete restrict on update restrict;

alter table FACTURA
   add constraint FK_FACTURA_REF_RESOL_SEC foreign key (RESOLUCION_SEC_ID)
      references RESOLUCION_SEC (ID)
      on delete restrict on update restrict;

alter table FACTURA_DETALLE
   add constraint FK_FACTURA_DET_REF_PROD foreign key (PRODUCTO_SERVICIO_ID)
      references PRODUCTO (ID)
      on delete restrict on update restrict;

alter table FACTURA_DETALLE
   add constraint FK_FAC_DET_REF_FACTURA foreign key (FACTURA_ID)
      references FACTURA (ID)
      on delete restrict on update restrict;

alter table HISTORIA
   add constraint FK_HISTORIA_RF_MEDICO foreign key (MEDICO_PERSONA_ID)
      references PERSONA (ID)
      on delete restrict on update restrict;

alter table HISTORIA
   add constraint FK_HISTORIA_RF_PACIENTE foreign key (PACIENTE_PERSONA_ID)
      references PERSONA (ID)
      on delete restrict on update restrict;

alter table HISTORIA
   add constraint FK_HISTORIA_REFERENCE_HISTORIA foreign key (HISTORIA_ESTADO_ID)
      references HISTORIA_ESTADO (ID)
      on delete restrict on update restrict;

alter table HISTORIA_DIAGNOSTICOS
   add constraint FK_HISTORIA_FK_HISTOR_DIAGNOST foreign key (DIAGNOSTICO_ID)
      references DIAGNOSTICO_CIE10 (ID)
      on delete restrict on update restrict;

alter table HISTORIA_DIAGNOSTICOS
   add constraint FK_HIST_DX_REF_HISTORIA foreign key (HISTORIA_ID)
      references HISTORIA (ID)
      on delete restrict on update restrict;

alter table HISTORIA_NOTAS
   add constraint FK_HISNOTA_RF_HISTORIA foreign key (HISTORIA_ID)
      references HISTORIA (ID)
      on delete restrict on update restrict;

alter table HISTORIA_TRATAMIENTOS
   add constraint FK_HISTRA_RF_HISTORIA foreign key (HISTORIA_ID)
      references HISTORIA (ID)
      on delete restrict on update restrict;

alter table HISTORIA_TRATAMIENTOS
   add constraint FK_HISTRA_RF_PROCUPS foreign key (PROCEDIMIENTO_CUPS_ID)
      references PROCEDIMIENTO_CUPS (ID)
      on delete restrict on update restrict;

alter table MEMBRESIA_SERVICIOS
   add constraint FK_MEMB_REF_MEMB_SER foreign key (MEMBRESIA_ID)
      references MEMBRESIA (ID)
      on delete restrict on update restrict;

alter table MEMBRESIA_SERVICIOS
   add constraint FK_MEMB_REF_SERVICIO foreign key (SERVICIO_ID)
      references SERVICIO (ID)
      on delete restrict on update restrict;

alter table METODLOGIA_ENTRENAMIENTOS
   add constraint FK_METENT_RF_ENTRENAMIENTO foreign key (ENTRENAMIENTO_ID)
      references ENTRENAMIENTO (ID)
      on delete restrict on update restrict;

alter table METODLOGIA_ENTRENAMIENTOS
   add constraint FK_METENT_RF_METODOLOGIA foreign key (METODOLOGIA_ID)
      references METODOLOGIA (ID)
      on delete restrict on update restrict;

alter table MONEDA_PAISES
   add constraint FK_PAIS_MON_REF_MONEDA foreign key (MONEDA_ID)
      references MONEDA (ID)
      on delete restrict on update restrict;

alter table MONEDA_PAISES
   add constraint FK_PAIS_MON_REF_PAIS foreign key (PAIS_ID)
      references PAIS (ID)
      on delete restrict on update restrict;

alter table PAGO
   add constraint FK_PAGO_REF_PAGO_EST foreign key (PAGO_ESTADO_ID)
      references PAGO_ESTADO (ID)
      on delete restrict on update restrict;

alter table PAGO
   add constraint FK_PAGO_REF_PUNTO_VEN foreign key (PUNTO_VENTA_ID)
      references PUNTO_VENTA (ID)
      on delete restrict on update restrict;

alter table PAGO_DETALLES
   add constraint FK_PAGO_DET_REF_CUPON foreign key (CUPO_ID)
      references CUPON (ID)
      on delete restrict on update restrict;

alter table PAGO_DETALLES
   add constraint FK_PAGO_DET_REF_MONEDA foreign key (MONEDA_ID)
      references MONEDA (ID)
      on delete restrict on update restrict;

alter table PAGO_DETALLES
   add constraint FK_PAGO_DET_REF_PAGO foreign key (PAGO_ID)
      references PAGO (ID)
      on delete restrict on update restrict;

alter table PAGO_DETALLES
   add constraint FK_PAGO_DET_REF_TIPO_PAGO foreign key (TIPO_PAGO_ID)
      references TIPO_PAGO (ID)
      on delete restrict on update restrict;

alter table PAGO_FACTURAS
   add constraint FK_PAGO_FAC_REF_FACTURA foreign key (FACTURA_ID)
      references FACTURA (ID)
      on delete restrict on update restrict;

alter table PAGO_FACTURAS
   add constraint FK_PAGO_FAC_REF_PAGO foreign key (PAGO_ID)
      references PAGO (ID)
      on delete restrict on update restrict;

alter table PAIS
   add constraint FK_PAIS_RF_CONTINENTE foreign key (CONTINENTE_ID)
      references CONTINENTE (ID)
      on delete restrict on update restrict;

alter table PERSONA
   add constraint FK_PERSONA_REF_CIUDAD foreign key (LUGAR_NACIMIENTO_CIUDAD_ID)
      references CIUDAD (ID)
      on delete restrict on update restrict;

alter table PERSONA
   add constraint FK_PERSONA_REF_PAIS foreign key (NACIONALIDAD_PAIS_ID)
      references PAIS (ID)
      on delete restrict on update restrict;

alter table PERSONA
   add constraint FK_PERSONA_REF_TIPO_DOC foreign key (TIPO_DOCUMENTO_ID)
      references TIPO_DOCUMENTO (ID)
      on delete restrict on update restrict;

alter table PERSONA_EMAILS
   add constraint FK_PERSONA_EMAIL_REF_PERSONA foreign key (PERSONA_ID)
      references PERSONA (ID)
      on delete restrict on update restrict;

alter table PERSONA_EMAILS
   add constraint FK_PERSONA_EMAIL_REF_TIPO_EMAIL foreign key (TIPO_EMAIL_ID)
      references TIPO_EMAIL (ID)
      on delete restrict on update restrict;

alter table PERSONA_ROLES
   add constraint FK_PERSONA_ROLES_REF_PERSONA foreign key (PERSONA_ID)
      references PERSONA (ID)
      on delete restrict on update restrict;

alter table PERSONA_ROLES
   add constraint FK_PERSONA_ROLES_REF_TIPO_PER foreign key (ROL_PERSONA_ID)
      references ROL_PERSONA (ID)
      on delete restrict on update restrict;

alter table PERSONA_ROLES
   add constraint FK_PER_ROLES_REF_PER_TEL foreign key (PERSONA_TELEFONOS_ID)
      references PERSONA_TELEFONOS (ID)
      on delete restrict on update restrict;

alter table PERSONA_TELEFONOS
   add constraint FK_PERSONA_TELS_REF_PERSONA foreign key (PERSONA_ID)
      references PERSONA (ID)
      on delete restrict on update restrict;

alter table PERSONA_TELEFONOS
   add constraint FK_PERSONA_TELS_REF_TIPO_TEL foreign key (TIPO_TELEFONO_ID)
      references TIPO_TELEFONO (ID)
      on delete restrict on update restrict;

alter table PERSONA_TELEFONOS
   add constraint FK_PERTEL_RF_PAIS foreign key (PAIS_ID)
      references PAIS (ID)
      on delete restrict on update restrict;

alter table PROCEDIMIENTO
   add constraint FK_PROCEDIMIENTO_REF_PROCESO foreign key (PROCESO_ID)
      references PROCESO (ID)
      on delete restrict on update restrict;

alter table PROCEDIMIENTO
   add constraint FK_PRO_PRO_REF_SERVICIO foreign key (SERVICIO_ID)
      references SERVICIO (ID)
      on delete restrict on update restrict;

alter table PRODUCTO
   add constraint FK_PROD_SER_REF_TIPO_PRO foreign key (TIPO_PRODUCTO_ID)
      references TIPO_PRODUCTO (ID)
      on delete restrict on update restrict;

alter table PRODUCTO
   add constraint FK_PRO_SER_REF_MEMBRESIA foreign key (MEMBRESIA_ID)
      references MEMBRESIA (ID)
      on delete restrict on update restrict;

alter table PRODUCTO_COSTO
   add constraint FK_PROD_COS_REF_PRODUCTO foreign key (PRODUCTO_ID)
      references PRODUCTO (ID)
      on delete restrict on update restrict;

alter table PUNTO_VENTA
   add constraint FK_PUNTO_VE_REF_CIUDAD foreign key (CIUDAD_ID)
      references CIUDAD (ID)
      on delete restrict on update restrict;

alter table PUNTO_VENTA
   add constraint FK_PUNTO_VE_REF_TIPO_PUN_VEN foreign key (TIPO_PUNTO_VENTA_ID)
      references TIPO_PUNTO_VENTA (ID)
      on delete restrict on update restrict;

alter table RESOLUCION_SEC
   add constraint FK_RESOL_REF_RESOLUCION foreign key (RESOLUCION_ID)
      references RESOLUCION (ID)
      on delete restrict on update restrict;

alter table SERVICIO
   add constraint FK_SERVICIO_REF_TIPO_SERVICIO foreign key (TIPO_SERVICIO_ID)
      references TIPO_SERVICIO (ID)
      on delete restrict on update restrict;

