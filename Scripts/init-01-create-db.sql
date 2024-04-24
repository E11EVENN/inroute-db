/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     22/04/2024 11:24:10 p. m.                    */
/*==============================================================*/


drop index idx_pais_numero;

create sequence entrenamiento_actividad_seq
increment 1
start 1;

create sequence entrenamiento_plan_seq
increment 1
start 1;

create sequence entrenamiento_seguimiento_seq
increment 1
start 1;

create sequence factura_detalle_seq
increment 1
start 1;

create sequence factura_seq
increment 1
start 1;

create sequence membresia_servicios_seq
increment 1
start 1;

create sequence pago_detalles_seq
increment 1
start 1;

create sequence pago_facturas_seq
increment 1
start 1;

create sequence pago_seq
increment 1
start 1;

create sequence persona_emails_seq
increment 1
start 1;

create sequence persona_seq
increment 1
start 1;

create sequence persona_telefonos_seq
increment 1
start 1;

create sequence producto_costo_seq
increment 1
start 1;

create sequence resolucion_sec_seq
increment 1
start 1;

create sequence resolucion_seq
increment 1
start 1;

/*==============================================================*/
/* Table: ciudad                                                */
/*==============================================================*/
create table ciudad (
   id                   varchar(5)           not null,
   nombre               varchar(30)          not null,
   depto_id             varchar(2)           not null,
   estado               numeric(1)           null default 1,
   fecha_registro       timestamp with time zone null default current_timestamp,
   fecha_actualizacion  timestamp with time zone null default current_timestamp,
   usuario_id           varchar(10)          null,
   ip_address           varchar(15)          null,
   constraint pk_ciudad primary key (id)
);

comment on table ciudad is
'ciudad';

comment on column ciudad.id is
'id';

comment on column ciudad.nombre is
'nombre';

comment on column ciudad.depto_id is
'depto_id';

comment on column ciudad.estado is
'estado';

comment on column ciudad.fecha_registro is
'fecha_registro';

comment on column ciudad.fecha_actualizacion is
'fecha_actualizacion';

comment on column ciudad.usuario_id is
'usuario_id';

comment on column ciudad.ip_address is
'ip_address';

/*==============================================================*/
/* Table: continente                                            */
/*==============================================================*/
create table continente (
   id                   varchar(2)           not null,
   nombre               varchar(25)          not null,
   descripcion          varchar(100)         null,
   constraint pk_continente primary key (id)
);

comment on table continente is
'continente';

comment on column continente.id is
'id';

comment on column continente.nombre is
'nombre';

comment on column continente.descripcion is
'descripcion';

/*==============================================================*/
/* Table: cupon                                                 */
/*==============================================================*/
create table cupon (
   id                   varchar(5)           not null,
   tipo_cupon_id        varchar(2)           not null,
   nombre               varchar(20)          not null,
   descuento_porcentaje numeric(5,2)         null default 0
      constraint ckc_descuento_porcent_cupon check (descuento_porcentaje is null or (descuento_porcentaje between 0 and 100)),
   moneda_id            varchar(3)           not null,
   valor                numeric(15,2)        null default 0,
   valor_tope           numeric(15,2)        null default 0,
   aplica_tope          numeric(1)           null default 0
      constraint ckc_aplica_tope_cupon check (aplica_tope is null or (aplica_tope between 0 and 1)),
   vigente_desde        date                 null default current_date,
   vigente_hasta        date                 null default current_date,
   estado               numeric(1)           null default 1,
   constraint pk_cupon primary key (id)
);

comment on table cupon is
'cupon';

comment on column cupon.id is
'id';

comment on column cupon.tipo_cupon_id is
'tipo_cupon_id';

comment on column cupon.nombre is
'nombre';

comment on column cupon.descuento_porcentaje is
'descuento_porcentaje';

comment on column cupon.moneda_id is
'moneda_id';

comment on column cupon.valor is
'valor';

comment on column cupon.valor_tope is
'valor_tope';

comment on column cupon.aplica_tope is
'aplica_tope';

comment on column cupon.vigente_desde is
'vigente_desde';

comment on column cupon.vigente_hasta is
'vigente_hasta';

comment on column cupon.estado is
'estado';

/*==============================================================*/
/* Table: depto                                                 */
/*==============================================================*/
create table depto (
   id                   varchar(2)           not null,
   nombre               varchar(30)          not null,
   pais_id              varchar(3)           not null,
   estado               numeric(1)           null default 1,
   fecha_registro       timestamp with time zone null default current_timestamp,
   fecha_actualizacion  timestamp with time zone null default current_timestamp,
   usuario_id           varchar(10)          null,
   ip_address           varchar(15)          null,
   constraint pk_depto primary key (id)
);

comment on table depto is
'depto';

comment on column depto.id is
'id';

comment on column depto.nombre is
'nombre';

comment on column depto.pais_id is
'pais_id';

comment on column depto.estado is
'estado';

comment on column depto.fecha_registro is
'fecha_registro';

comment on column depto.fecha_actualizacion is
'fecha_actualizacion';

comment on column depto.usuario_id is
'usuario_id';

comment on column depto.ip_address is
'ip_address';

/*==============================================================*/
/* Table: entrenamiento                                         */
/*==============================================================*/
create table entrenamiento (
   id                   varchar(5)           not null,
   nombre               varchar(25)          not null,
   procedimiento_id     varchar(5)           not null,
   tipo_entrenamiento_id varchar(2)           not null,
   descripcion          varchar(100)         null,
   url_video            varchar(200)         null,
   estado               numeric(1)           null default 1,
   constraint pk_entrenamiento primary key (id)
);

comment on table entrenamiento is
'entrenamiento';

comment on column entrenamiento.id is
'id';

comment on column entrenamiento.nombre is
'nombre';

comment on column entrenamiento.procedimiento_id is
'procedimiento_id';

comment on column entrenamiento.tipo_entrenamiento_id is
'tipo_entrenamiento_id';

comment on column entrenamiento.descripcion is
'descripcion';

comment on column entrenamiento.url_video is
'url_video';

comment on column entrenamiento.estado is
'estado';

/*==============================================================*/
/* Table: entrenamiento_actividad                               */
/*==============================================================*/
create table entrenamiento_actividad (
   id                   numeric(4)           not null default nextval('entrenamiento_actividad_seq'),
   entrenamiento_id     varchar(5)           not null,
   tipo_actividad_id    varchar(2)           not null,
   nombre               varchar(25)          not null,
   descripcion          varchar(100)         null,
   url_video            varchar(200)         null,
   series               numeric(10)          null,
   cantidad             numeric(10)          null,
   min_descanso         time                 null,
   tiempo_estimado      time                 null,
   tiempo_marca         time                 null,
   orden                numeric(2)           null,
   ubicacion            numeric(1)           null default 1,
   estado               numeric(1)           null default 1,
   constraint pk_entrenamiento_actividad primary key (id)
);

comment on table entrenamiento_actividad is
'entrenamiento_actividad';

comment on column entrenamiento_actividad.id is
'id';

comment on column entrenamiento_actividad.entrenamiento_id is
'entrenamiento_id';

comment on column entrenamiento_actividad.tipo_actividad_id is
'tipo_actividad_id';

comment on column entrenamiento_actividad.nombre is
'nombre';

comment on column entrenamiento_actividad.descripcion is
'descripcion';

comment on column entrenamiento_actividad.url_video is
'url_video';

comment on column entrenamiento_actividad.series is
'series';

comment on column entrenamiento_actividad.cantidad is
'cantidad';

comment on column entrenamiento_actividad.min_descanso is
'min_descanso';

comment on column entrenamiento_actividad.tiempo_estimado is
'tiempo_estimado';

comment on column entrenamiento_actividad.tiempo_marca is
'tiempo_marca';

comment on column entrenamiento_actividad.orden is
'orden';

comment on column entrenamiento_actividad.ubicacion is
'ubicacion';

comment on column entrenamiento_actividad.estado is
'estado';

/*==============================================================*/
/* Table: entrenamiento_plan                                    */
/*==============================================================*/
create table entrenamiento_plan (
   id                   numeric(15)          not null default nextval('entrenamiento_plan_seq'),
   entrenamiento_id     varchar(5)           not null,
   entrenador_id        numeric(10)          not null,
   atleta_id            numeric(10)          not null,
   fecha_registro       timestamp with time zone null default current_timestamp,
   fecha_actualizacion  timestamp with time zone null default current_timestamp,
   estado               numeric(1)           null default 1,
   usuario_id           varchar(10)          null,
   ip_address           varchar(15)          null,
   constraint pk_entrenamiento_plan primary key (id)
);

comment on table entrenamiento_plan is
'entrenamiento_plan';

comment on column entrenamiento_plan.id is
'id';

comment on column entrenamiento_plan.entrenamiento_id is
'entrenamiento_id';

comment on column entrenamiento_plan.entrenador_id is
'entrenador_id';

comment on column entrenamiento_plan.atleta_id is
'atleta_id';

comment on column entrenamiento_plan.fecha_registro is
'fecha_registro';

comment on column entrenamiento_plan.fecha_actualizacion is
'fecha_actualizacion';

comment on column entrenamiento_plan.estado is
'estado';

comment on column entrenamiento_plan.usuario_id is
'usuario_id';

comment on column entrenamiento_plan.ip_address is
'ip_address';

/*==============================================================*/
/* Table: entrenamiento_seguimiento                             */
/*==============================================================*/
create table entrenamiento_seguimiento (
   id                   numeric(20)          not null default nextval('entrenamiento_seguimiento_seq'),
   fecha_registro       timestamp with time zone null default current_timestamp,
   entrenamiento_plan_id numeric(15)          not null,
   entrenamiento_actividad_id numeric(4)           not null,
   latitud              decimal              null,
   longitud             decimal              null,
   respuesta            varchar(100)         null,
   usuario_id           varchar(10)          null,
   ip_address           varchar(15)          null,
   constraint pk_entrenamiento_seguimiento primary key (id)
);

comment on table entrenamiento_seguimiento is
'entrenamiento_seguimiento';

comment on column entrenamiento_seguimiento.id is
'id';

comment on column entrenamiento_seguimiento.fecha_registro is
'fecha_registro';

comment on column entrenamiento_seguimiento.entrenamiento_plan_id is
'entrenamiento_plan_id';

comment on column entrenamiento_seguimiento.entrenamiento_actividad_id is
'entrenamiento_actividad_id';

comment on column entrenamiento_seguimiento.latitud is
'latitud';

comment on column entrenamiento_seguimiento.longitud is
'longitud';

comment on column entrenamiento_seguimiento.respuesta is
'respuesta';

comment on column entrenamiento_seguimiento.usuario_id is
'usuario_id';

comment on column entrenamiento_seguimiento.ip_address is
'ip_address';

/*==============================================================*/
/* Table: factura                                               */
/*==============================================================*/
create table factura (
   id                   numeric(15)          not null default nextval('factura_seq'),
   fecha                date                 not null default current_date,
   resolucion_sec_id    numeric(5)           not null,
   punto_venta_id       varchar(5)           not null,
   cliente_persona_id   numeric(10)          not null,
   moneda_id            varchar(3)           not null,
   valor_total          numeric(15,2)        not null default 0,
   factura_estado_id    varchar(5)           null,
   fecha_registro       timestamp with time zone null default current_timestamp,
   fecha_actualizacion  timestamp with time zone null default current_timestamp,
   usuario_id           varchar(10)          null,
   ip_address           varchar(15)          null,
   constraint pk_factura primary key (id)
);

comment on table factura is
'factura';

comment on column factura.id is
'id';

comment on column factura.fecha is
'fecha';

comment on column factura.resolucion_sec_id is
'resolucion_sec_id';

comment on column factura.punto_venta_id is
'punto_venta_id';

comment on column factura.cliente_persona_id is
'cliente_persona_id';

comment on column factura.moneda_id is
'moneda_id';

comment on column factura.valor_total is
'valor_total';

comment on column factura.factura_estado_id is
'factura_estado_id';

comment on column factura.fecha_registro is
'fecha_registro';

comment on column factura.fecha_actualizacion is
'fecha_actualizacion';

comment on column factura.usuario_id is
'usuario_id';

comment on column factura.ip_address is
'ip_address';

/*==============================================================*/
/* Table: factura_detalle                                       */
/*==============================================================*/
create table factura_detalle (
   id                   numeric(20)          not null default nextval('factura_detalle_seq'),
   factura_id           numeric(15)          not null,
   producto_servicio_id varchar(6)           not null,
   descuento_porcentaje numeric(5,2)         null default 0
      constraint ckc_descuento_porcent_factura_ check (descuento_porcentaje is null or (descuento_porcentaje between 0 and 100)),
   valor_neto           numeric(15,2)        not null default 0,
   valor_total          numeric(15,2)        not null default 0,
   estado               numeric(1)           null default 1,
   fecha_registro       timestamp with time zone null default current_timestamp,
   fecha_actualizacion  timestamp with time zone null default current_timestamp,
   usuario_id           varchar(10)          null,
   ip_address           varchar(15)          null,
   constraint pk_factura_detalle primary key (id)
);

comment on table factura_detalle is
'factura_detalle';

comment on column factura_detalle.id is
'id';

comment on column factura_detalle.factura_id is
'factura_id';

comment on column factura_detalle.producto_servicio_id is
'producto_servicio_id';

comment on column factura_detalle.descuento_porcentaje is
'descuento_porcentaje';

comment on column factura_detalle.valor_neto is
'valor_neto';

comment on column factura_detalle.valor_total is
'valor_total';

comment on column factura_detalle.estado is
'estado';

comment on column factura_detalle.fecha_registro is
'fecha_registro';

comment on column factura_detalle.fecha_actualizacion is
'fecha_actualizacion';

comment on column factura_detalle.usuario_id is
'usuario_id';

comment on column factura_detalle.ip_address is
'ip_address';

/*==============================================================*/
/* Table: factura_estado                                        */
/*==============================================================*/
create table factura_estado (
   id                   varchar(5)           not null,
   siguiente            varchar(5)           null,
   previo               varchar(5)           null,
   inicial              numeric(1)           null default 0
      constraint ckc_inicial_factura_ check (inicial is null or (inicial between 0 and 1)),
   final                numeric(1)           null default 0
      constraint ckc_final_factura_ check (final is null or (final between 0 and 1)),
   constraint pk_factura_estado primary key (id)
);

comment on table factura_estado is
'factura_estado';

comment on column factura_estado.id is
'id';

comment on column factura_estado.siguiente is
'siguiente';

comment on column factura_estado.previo is
'previo';

comment on column factura_estado.inicial is
'inicial';

comment on column factura_estado.final is
'final';

/*==============================================================*/
/* Table: membresia                                             */
/*==============================================================*/
create table membresia (
   id                   varchar(3)           not null,
   nombre               varchar(20)          not null,
   descripcion          varchar(100)         not null,
   vigente_desde        date                 not null,
   vigente_hasta        date                 null,
   constraint pk_membresia primary key (id)
);

comment on table membresia is
'membresia';

comment on column membresia.id is
'id';

comment on column membresia.nombre is
'nombre';

comment on column membresia.descripcion is
'descripcion';

comment on column membresia.vigente_desde is
'vigente_desde';

comment on column membresia.vigente_hasta is
'vigente_hasta';

/*==============================================================*/
/* Table: membresia_servicios                                   */
/*==============================================================*/
create table membresia_servicios (
   id                   numeric(5)           not null default nextval('membresia_servicios_seq'),
   membresia_id         varchar(3)           not null,
   servicio_id          varchar(3)           not null,
   estado               numeric(1)           null default 1,
   fecha_registro       timestamp with time zone null default current_timestamp,
   fecha_actualizacion  timestamp with time zone null default current_timestamp,
   usuario_id           varchar(10)          null,
   ip_address           varchar(15)          null,
   constraint pk_membresia_servicios primary key (id)
);

comment on table membresia_servicios is
'membresia_servicios';

comment on column membresia_servicios.id is
'id';

comment on column membresia_servicios.membresia_id is
'membresia_id';

comment on column membresia_servicios.servicio_id is
'servicio_id';

comment on column membresia_servicios.estado is
'estado';

comment on column membresia_servicios.fecha_registro is
'fecha_registro';

comment on column membresia_servicios.fecha_actualizacion is
'fecha_actualizacion';

comment on column membresia_servicios.usuario_id is
'usuario_id';

comment on column membresia_servicios.ip_address is
'ip_address';

/*==============================================================*/
/* Table: moneda                                                */
/*==============================================================*/
create table moneda (
   id                   varchar(3)           not null,
   nombre               varchar(30)          not null,
   simbolo              varchar(6)           not null,
   constraint pk_moneda primary key (id)
);

comment on table moneda is
'moneda';

comment on column moneda.id is
'id';

comment on column moneda.nombre is
'nombre';

comment on column moneda.simbolo is
'simbolo';

/*==============================================================*/
/* Table: moneda_paises                                         */
/*==============================================================*/
create table moneda_paises (
   pais_id              varchar(3)           not null,
   moneda_id            varchar(3)           not null,
   corriente            numeric(1)           null default 1,
   estado               numeric(1)           null default 1,
   constraint pk_moneda_paises primary key (pais_id, moneda_id)
);

comment on table moneda_paises is
'moneda_paises';

comment on column moneda_paises.pais_id is
'pais_id';

comment on column moneda_paises.moneda_id is
'moneda_id';

comment on column moneda_paises.corriente is
'corriente';

comment on column moneda_paises.estado is
'estado';

/*==============================================================*/
/* Table: pago                                                  */
/*==============================================================*/
create table pago (
   id                   numeric(15)          not null default nextval('pago_seq'),
   fecha                date                 not null,
   punto_venta_id       varchar(5)           not null,
   pago_estado_id       varchar(5)           null,
   total_facturas       numeric(15,2)        not null default 0,
   total_pagos          numeric(15,2)        not null default 0,
   fecha_registro       timestamp with time zone null default current_timestamp,
   fecha_actualizacion  timestamp with time zone null default current_timestamp,
   usuario_id           varchar(10)          null,
   ip_address           varchar(15)          null,
   constraint pk_pago primary key (id)
);

comment on table pago is
'pago';

comment on column pago.id is
'id';

comment on column pago.fecha is
'fecha';

comment on column pago.punto_venta_id is
'punto_venta_id';

comment on column pago.pago_estado_id is
'pago_estado_id';

comment on column pago.total_facturas is
'total_facturas';

comment on column pago.total_pagos is
'total_pagos';

comment on column pago.fecha_registro is
'fecha_registro';

comment on column pago.fecha_actualizacion is
'fecha_actualizacion';

comment on column pago.usuario_id is
'usuario_id';

comment on column pago.ip_address is
'ip_address';

/*==============================================================*/
/* Table: pago_detalles                                         */
/*==============================================================*/
create table pago_detalles (
   id                   numeric(20)          not null default nextval('pago_detalles_seq'),
   pago_id              numeric(15)          not null,
   tipo_pago_id         varchar(2)           not null,
   cupo_id              varchar(5)           null,
   moneda_id            varchar(3)           not null,
   valor                numeric(15,2)        not null default 0,
   autorizacion_franquicia varchar(20)          null,
   fecha_registro       timestamp with time zone null default current_timestamp,
   fecha_actualizacion  timestamp with time zone null default current_timestamp,
   usuario_id           varchar(10)          null,
   ip_address           varchar(15)          null,
   constraint pk_pago_detalles primary key (id)
);

comment on table pago_detalles is
'pago_detalles';

comment on column pago_detalles.id is
'id';

comment on column pago_detalles.pago_id is
'pago_id';

comment on column pago_detalles.tipo_pago_id is
'tipo_pago_id';

comment on column pago_detalles.cupo_id is
'cupo_id';

comment on column pago_detalles.moneda_id is
'moneda_id';

comment on column pago_detalles.valor is
'valor';

comment on column pago_detalles.autorizacion_franquicia is
'autorizacion_franquicia';

comment on column pago_detalles.fecha_registro is
'fecha_registro';

comment on column pago_detalles.fecha_actualizacion is
'fecha_actualizacion';

comment on column pago_detalles.usuario_id is
'usuario_id';

comment on column pago_detalles.ip_address is
'ip_address';

/*==============================================================*/
/* Table: pago_estado                                           */
/*==============================================================*/
create table pago_estado (
   id                   varchar(5)           not null,
   siguiente            varchar(5)           null,
   previo               varchar(5)           null,
   inicial              numeric(1)           null default 0
      constraint ckc_inicial_pago_est check (inicial is null or (inicial between 0 and 1)),
   final                numeric(1)           null default 0
      constraint ckc_final_pago_est check (final is null or (final between 0 and 1)),
   constraint pk_pago_estado primary key (id)
);

comment on table pago_estado is
'pago_estado';

comment on column pago_estado.id is
'id';

comment on column pago_estado.siguiente is
'siguiente';

comment on column pago_estado.previo is
'previo';

comment on column pago_estado.inicial is
'inicial';

comment on column pago_estado.final is
'final';

/*==============================================================*/
/* Table: pago_facturas                                         */
/*==============================================================*/
create table pago_facturas (
   id                   numeric(20)          not null default nextval('pago_facturas_seq'),
   pago_id              numeric(15)          not null,
   factura_id           numeric(15)          not null,
   fecha_registro       timestamp with time zone null default current_timestamp,
   constraint pk_pago_facturas primary key (id)
);

comment on table pago_facturas is
'pago_facturas';

comment on column pago_facturas.id is
'id';

comment on column pago_facturas.pago_id is
'pago_id';

comment on column pago_facturas.factura_id is
'factura_id';

comment on column pago_facturas.fecha_registro is
'fecha_registro';

/*==============================================================*/
/* Table: pais                                                  */
/*==============================================================*/
create table pais (
   id                   varchar(3)           not null,
   nombre               varchar(50)          not null,
   indicativo_telefonico numeric(4)           not null,
   continente_id        varchar(2)           not null,
   estado               numeric(1)           null default 1,
   fecha_registro       timestamp with time zone null default current_timestamp,
   fecha_actualizacion  timestamp with time zone null default current_timestamp,
   usuario_id           varchar(10)          null,
   ip_address           varchar(15)          null,
   constraint pk_pais primary key (id)
);

comment on table pais is
'pais';

comment on column pais.id is
'id';

comment on column pais.nombre is
'nombre';

comment on column pais.indicativo_telefonico is
'indicativo_telefonico';

comment on column pais.continente_id is
'continente_id';

comment on column pais.estado is
'estado';

comment on column pais.fecha_registro is
'fecha_registro';

comment on column pais.fecha_actualizacion is
'fecha_actualizacion';

comment on column pais.usuario_id is
'usuario_id';

comment on column pais.ip_address is
'ip_address';

/*==============================================================*/
/* Table: persona                                               */
/*==============================================================*/
create table persona (
   id                   numeric(10)          not null default nextval('persona_seq'),
   nombre               varchar(20)          not null,
   nombre_sec           varchar(20)          null,
   apellido             varchar(40)          not null,
   apellido_sec         varchar(40)          null,
   tipo_documento_id    varchar(2)           not null,
   documento            varchar(20)          not null,
   fecha_nacimiento     date                 not null,
   nacionalidad_pais_id varchar(3)           not null,
   lugar_nacimiento_ciudad_id varchar(5)           not null,
   estado               numeric(1)           null default 1,
   fecha_registro       timestamp with time zone null default current_timestamp,
   fecha_actualizacion  timestamp with time zone null default current_timestamp,
   usuario_id           varchar(10)          null,
   ip_address           varchar(15)          null,
   constraint pk_persona primary key (id)
);

comment on table persona is
'persona';

comment on column persona.id is
'id';

comment on column persona.nombre is
'nombre';

comment on column persona.nombre_sec is
'nombre_sec';

comment on column persona.apellido is
'apellido';

comment on column persona.apellido_sec is
'apellido_sec';

comment on column persona.tipo_documento_id is
'tipo_documento_id';

comment on column persona.documento is
'documento';

comment on column persona.fecha_nacimiento is
'fecha_nacimiento';

comment on column persona.nacionalidad_pais_id is
'nacionalidad_pais_id';

comment on column persona.lugar_nacimiento_ciudad_id is
'lugar_nacimiento_ciudad_id';

comment on column persona.estado is
'estado';

comment on column persona.fecha_registro is
'fecha_registro';

comment on column persona.fecha_actualizacion is
'fecha_actualizacion';

comment on column persona.usuario_id is
'usuario_id';

comment on column persona.ip_address is
'ip_address';

/*==============================================================*/
/* Table: persona_emails                                        */
/*==============================================================*/
create table persona_emails (
   id                   numeric(10)          not null default nextval('persona_emails_seq'),
   persona_id           numeric(10)          not null,
   tipo_email_id        varchar(3)           not null,
   email                varchar(50)          not null,
   estado               numeric(1)           null default 1,
   fecha_registro       timestamp with time zone null default current_timestamp,
   fecha_actualizacion  timestamp with time zone null default current_timestamp,
   usuario_id           varchar(10)          null,
   ip_address           varchar(15)          null,
   constraint pk_persona_emails primary key (id)
);

comment on table persona_emails is
'persona_emails';

comment on column persona_emails.id is
'id';

comment on column persona_emails.persona_id is
'persona_id';

comment on column persona_emails.tipo_email_id is
'tipo_email_id';

comment on column persona_emails.email is
'email';

comment on column persona_emails.estado is
'estado';

comment on column persona_emails.fecha_registro is
'fecha_registro';

comment on column persona_emails.fecha_actualizacion is
'fecha_actualizacion';

comment on column persona_emails.usuario_id is
'usuario_id';

comment on column persona_emails.ip_address is
'ip_address';

/*==============================================================*/
/* Table: persona_roles                                         */
/*==============================================================*/
create table persona_roles (
   persona_id           numeric(10)          not null,
   rol_persona_id       varchar(3)           not null,
   persona_telefonos_id numeric(5)           null,
   estado               numeric(1)           null default 1,
   fecha_registro       timestamp with time zone null default current_timestamp,
   fecha_actualizacion  timestamp with time zone null default current_timestamp,
   usuario_id           varchar(10)          null,
   ip_address           varchar(15)          null,
   constraint pk_persona_roles primary key (persona_id, rol_persona_id)
);

comment on table persona_roles is
'persona_roles';

comment on column persona_roles.persona_id is
'persona_id';

comment on column persona_roles.rol_persona_id is
'rol_persona_id';

comment on column persona_roles.persona_telefonos_id is
'persona_telefonos_id';

comment on column persona_roles.estado is
'estado';

comment on column persona_roles.fecha_registro is
'fecha_registro';

comment on column persona_roles.fecha_actualizacion is
'fecha_actualizacion';

comment on column persona_roles.usuario_id is
'usuario_id';

comment on column persona_roles.ip_address is
'ip_address';

/*==============================================================*/
/* Table: persona_telefonos                                     */
/*==============================================================*/
create table persona_telefonos (
   id                   numeric(5)           not null default nextval('persona_telefonos_seq'),
   tipo_telefono_id     varchar(3)           not null,
   persona_id           numeric(10)          not null,
   pais_id              varchar(3)           not null,
   numero               numeric(15)          not null,
   whatsapp             numeric(1)           null default 0,
   estado               numeric(1)           null default 1,
   fecha_registro       timestamp with time zone null default current_timestamp,
   fecha_actualizacion  timestamp with time zone null default current_timestamp,
   usuario_id           varchar(10)          null,
   ip_address           varchar(15)          null,
   constraint pk_persona_telefonos primary key (id)
);

comment on table persona_telefonos is
'persona_telefonos';

comment on column persona_telefonos.id is
'id';

comment on column persona_telefonos.tipo_telefono_id is
'tipo_telefono_id';

comment on column persona_telefonos.persona_id is
'persona_id';

comment on column persona_telefonos.pais_id is
'pais_id';

comment on column persona_telefonos.numero is
'numero';

comment on column persona_telefonos.whatsapp is
'whatsapp';

comment on column persona_telefonos.estado is
'estado';

comment on column persona_telefonos.fecha_registro is
'fecha_registro';

comment on column persona_telefonos.fecha_actualizacion is
'fecha_actualizacion';

comment on column persona_telefonos.usuario_id is
'usuario_id';

comment on column persona_telefonos.ip_address is
'ip_address';

/*==============================================================*/
/* Index: idx_pais_numero                                       */
/*==============================================================*/
create unique index idx_pais_numero on persona_telefonos (
pais_id,
numero
);

/*==============================================================*/
/* Table: procedimiento                                         */
/*==============================================================*/
create table procedimiento (
   id                   varchar(5)           not null,
   proceso_id           varchar(2)           not null,
   servicio_id          varchar(3)           null,
   nombre               varchar(30)          not null,
   descripcion          varchar(100)         null,
   constraint pk_procedimiento primary key (id)
);

comment on table procedimiento is
'procedimiento';

comment on column procedimiento.id is
'id';

comment on column procedimiento.proceso_id is
'proceso_id';

comment on column procedimiento.servicio_id is
'servicio_id';

comment on column procedimiento.nombre is
'nombre';

comment on column procedimiento.descripcion is
'descripcion';

/*==============================================================*/
/* Table: proceso                                               */
/*==============================================================*/
create table proceso (
   id                   varchar(2)           not null,
   nombre               varchar(25)          not null,
   descripcion          varchar(100)         null,
   constraint pk_proceso primary key (id)
);

comment on table proceso is
'proceso';

comment on column proceso.id is
'id';

comment on column proceso.nombre is
'nombre';

comment on column proceso.descripcion is
'descripcion';

/*==============================================================*/
/* Table: producto                                              */
/*==============================================================*/
create table producto (
   id                   varchar(6)           not null,
   nombre               varchar(50)          not null,
   descripcion          varchar(100)         null,
   membresia_id         varchar(3)           null,
   tipo_producto_id     varchar(2)           not null,
   vigente_desde        date                 null default current_date,
   estado               numeric(1)           null default 1,
   fecha_registro       timestamp with time zone null default current_timestamp,
   fecha_actualizacion  timestamp with time zone null default current_timestamp,
   usuario_id           varchar(10)          null,
   ip_address           varchar(15)          null,
   constraint pk_producto primary key (id)
);

comment on table producto is
'producto';

comment on column producto.id is
'id';

comment on column producto.nombre is
'nombre';

comment on column producto.descripcion is
'descripcion';

comment on column producto.membresia_id is
'membresia_id';

comment on column producto.tipo_producto_id is
'tipo_producto_id';

comment on column producto.vigente_desde is
'vigente_desde';

comment on column producto.estado is
'estado';

comment on column producto.fecha_registro is
'fecha_registro';

comment on column producto.fecha_actualizacion is
'fecha_actualizacion';

comment on column producto.usuario_id is
'usuario_id';

comment on column producto.ip_address is
'ip_address';

/*==============================================================*/
/* Table: producto_costo                                        */
/*==============================================================*/
create table producto_costo (
   id                   numeric(5)           not null default nextval('producto_costo_seq'),
   producto_id          varchar(6)           not null,
   valor                numeric(15,2)        not null default 0,
   vigente_desde        date                 null default current_date,
   vigente_hasta        date                 null default current_date,
   estado               numeric(1)           null default 1,
   fecha_registro       timestamp with time zone null default current_timestamp,
   fecha_actualizacion  timestamp with time zone null default current_timestamp,
   usuario_id           varchar(10)          null,
   ip_address           varchar(15)          null,
   constraint pk_producto_costo primary key (id)
);

comment on table producto_costo is
'producto_costo';

comment on column producto_costo.id is
'id';

comment on column producto_costo.producto_id is
'producto_id';

comment on column producto_costo.valor is
'valor';

comment on column producto_costo.vigente_desde is
'vigente_desde';

comment on column producto_costo.vigente_hasta is
'vigente_hasta';

comment on column producto_costo.estado is
'estado';

comment on column producto_costo.fecha_registro is
'fecha_registro';

comment on column producto_costo.fecha_actualizacion is
'fecha_actualizacion';

comment on column producto_costo.usuario_id is
'usuario_id';

comment on column producto_costo.ip_address is
'ip_address';

/*==============================================================*/
/* Table: punto_venta                                           */
/*==============================================================*/
create table punto_venta (
   id                   varchar(5)           not null,
   tipo_punto_venta_id  varchar(2)           not null,
   ciudad_id            varchar(5)           not null,
   nombre               varchar(30)          not null,
   estado               numeric(1)           null default 1,
   fecha_registro       timestamp with time zone null default current_timestamp,
   fecha_actualizacion  timestamp with time zone null default current_timestamp,
   usuario_id           varchar(10)          null,
   ip_address           varchar(15)          null,
   constraint pk_punto_venta primary key (id)
);

comment on table punto_venta is
'punto_venta';

comment on column punto_venta.id is
'id';

comment on column punto_venta.tipo_punto_venta_id is
'tipo_punto_venta_id';

comment on column punto_venta.ciudad_id is
'ciudad_id';

comment on column punto_venta.nombre is
'nombre';

comment on column punto_venta.estado is
'estado';

comment on column punto_venta.fecha_registro is
'fecha_registro';

comment on column punto_venta.fecha_actualizacion is
'fecha_actualizacion';

comment on column punto_venta.usuario_id is
'usuario_id';

comment on column punto_venta.ip_address is
'ip_address';

/*==============================================================*/
/* Table: resolucion                                            */
/*==============================================================*/
create table resolucion (
   id                   numeric(3)           not null default nextval('resolucion_seq'),
   codigo_dian          varchar(20)          not null,
   descripcion          varchar(100)         not null,
   fecha                date                 not null,
   estado               numeric(1)           null default 1,
   fecha_registro       timestamp with time zone null default current_timestamp,
   fecha_actualizacion  timestamp with time zone null default current_timestamp,
   usuario_id           varchar(10)          null,
   ip_address           varchar(15)          null,
   constraint pk_resolucion primary key (id)
);

comment on table resolucion is
'resolucion';

comment on column resolucion.id is
'id';

comment on column resolucion.codigo_dian is
'codigo_dian';

comment on column resolucion.descripcion is
'descripcion';

comment on column resolucion.fecha is
'fecha';

comment on column resolucion.estado is
'estado';

comment on column resolucion.fecha_registro is
'fecha_registro';

comment on column resolucion.fecha_actualizacion is
'fecha_actualizacion';

comment on column resolucion.usuario_id is
'usuario_id';

comment on column resolucion.ip_address is
'ip_address';

/*==============================================================*/
/* Table: resolucion_sec                                        */
/*==============================================================*/
create table resolucion_sec (
   id                   numeric(5)           not null default nextval('resolucion_sec_seq'),
   resolucion_id        numeric(3)           not null,
   fecha                date                 not null default current_date,
   prefijo              varchar(3)           not null,
   secuencia_inicio     numeric(10)          not null,
   secuencia_fin        numeric(10)          not null,
   secuencia_actual     numeric(10)          not null,
   estado               numeric(1)           null default 1,
   fecha_registro       timestamp with time zone null default current_timestamp,
   fecha_actualizacion  timestamp with time zone null default current_timestamp,
   usuario_id           varchar(10)          null,
   ip_address           varchar(15)          null,
   constraint pk_resolucion_sec primary key (id)
);

comment on table resolucion_sec is
'resolucion_sec';

comment on column resolucion_sec.id is
'id';

comment on column resolucion_sec.resolucion_id is
'resolucion_id';

comment on column resolucion_sec.fecha is
'fecha';

comment on column resolucion_sec.prefijo is
'prefijo';

comment on column resolucion_sec.secuencia_inicio is
'secuencia_inicio';

comment on column resolucion_sec.secuencia_fin is
'secuencia_fin';

comment on column resolucion_sec.secuencia_actual is
'secuencia_actual';

comment on column resolucion_sec.estado is
'estado';

comment on column resolucion_sec.fecha_registro is
'fecha_registro';

comment on column resolucion_sec.fecha_actualizacion is
'fecha_actualizacion';

comment on column resolucion_sec.usuario_id is
'usuario_id';

comment on column resolucion_sec.ip_address is
'ip_address';

/*==============================================================*/
/* Table: rol_persona                                           */
/*==============================================================*/
create table rol_persona (
   id                   varchar(3)           not null,
   nombre               varchar(25)          not null,
   constraint pk_rol_persona primary key (id)
);

comment on table rol_persona is
'rol_persona';

comment on column rol_persona.id is
'id';

comment on column rol_persona.nombre is
'nombre';

/*==============================================================*/
/* Table: servicio                                              */
/*==============================================================*/
create table servicio (
   id                   varchar(3)           not null,
   nombre               varchar(30)          not null,
   tipo_servicio_id     varchar(2)           null,
   constraint pk_servicio primary key (id)
);

comment on table servicio is
'servicio';

comment on column servicio.id is
'id';

comment on column servicio.nombre is
'nombre';

comment on column servicio.tipo_servicio_id is
'tipo_servicio_id';

/*==============================================================*/
/* Table: tipo_actividad                                        */
/*==============================================================*/
create table tipo_actividad (
   id                   varchar(2)           not null,
   nombre               varchar(25)          not null,
   constraint pk_tipo_actividad primary key (id)
);

comment on table tipo_actividad is
'tipo_actividad';

comment on column tipo_actividad.id is
'id';

comment on column tipo_actividad.nombre is
'nombre';

/*==============================================================*/
/* Table: tipo_cupon                                            */
/*==============================================================*/
create table tipo_cupon (
   id                   varchar(2)           not null,
   nombre               varchar(25)          not null,
   constraint pk_tipo_cupon primary key (id)
);

comment on table tipo_cupon is
'tipo_cupon';

comment on column tipo_cupon.id is
'id';

comment on column tipo_cupon.nombre is
'nombre';

/*==============================================================*/
/* Table: tipo_documento                                        */
/*==============================================================*/
create table tipo_documento (
   id                   varchar(2)           not null,
   nombre               varchar(50)          not null,
   constraint pk_tipo_documento primary key (id)
);

comment on table tipo_documento is
'tipo_documento';

comment on column tipo_documento.id is
'id';

comment on column tipo_documento.nombre is
'nombre';

/*==============================================================*/
/* Table: tipo_email                                            */
/*==============================================================*/
create table tipo_email (
   id                   varchar(3)           not null,
   nombre               varchar(25)          not null,
   constraint pk_tipo_email primary key (id)
);

comment on table tipo_email is
'tipo_email';

comment on column tipo_email.id is
'id';

comment on column tipo_email.nombre is
'nombre';

/*==============================================================*/
/* Table: tipo_entrenamiento                                    */
/*==============================================================*/
create table tipo_entrenamiento (
   id                   varchar(2)           not null,
   nombre               varchar(25)          not null,
   constraint pk_tipo_entrenamiento primary key (id)
);

comment on table tipo_entrenamiento is
'tipo_entrenamiento';

comment on column tipo_entrenamiento.id is
'id';

comment on column tipo_entrenamiento.nombre is
'nombre';

/*==============================================================*/
/* Table: tipo_pago                                             */
/*==============================================================*/
create table tipo_pago (
   id                   varchar(2)           not null,
   nombre               varchar(25)          not null,
   constraint pk_tipo_pago primary key (id)
);

comment on table tipo_pago is
'tipo_pago';

comment on column tipo_pago.id is
'id';

comment on column tipo_pago.nombre is
'nombre';

/*==============================================================*/
/* Table: tipo_producto                                         */
/*==============================================================*/
create table tipo_producto (
   id                   varchar(2)           not null,
   nombre               varchar(25)          not null,
   constraint pk_tipo_producto primary key (id)
);

comment on table tipo_producto is
'tipo_producto';

comment on column tipo_producto.id is
'id';

comment on column tipo_producto.nombre is
'nombre';

/*==============================================================*/
/* Table: tipo_punto_venta                                      */
/*==============================================================*/
create table tipo_punto_venta (
   id                   varchar(2)           not null,
   nombre               varchar(25)          not null,
   constraint pk_tipo_punto_venta primary key (id)
);

comment on table tipo_punto_venta is
'tipo_punto_venta';

comment on column tipo_punto_venta.id is
'id';

comment on column tipo_punto_venta.nombre is
'nombre';

/*==============================================================*/
/* Table: tipo_servicio                                         */
/*==============================================================*/
create table tipo_servicio (
   id                   varchar(2)           not null,
   nombre               varchar(25)          not null,
   constraint pk_tipo_servicio primary key (id)
);

comment on table tipo_servicio is
'tipo_servicio';

comment on column tipo_servicio.id is
'id';

comment on column tipo_servicio.nombre is
'nombre';

/*==============================================================*/
/* Table: tipo_telefono                                         */
/*==============================================================*/
create table tipo_telefono (
   id                   varchar(3)           not null,
   nombre               varchar(25)          not null,
   constraint pk_tipo_telefono primary key (id)
);

comment on table tipo_telefono is
'tipo_telefono';

comment on column tipo_telefono.id is
'id';

comment on column tipo_telefono.nombre is
'nombre';

/*==============================================================*/
/* Table: usuario                                               */
/*==============================================================*/
create table usuario (
   id                   varchar(10)          not null,
   nombre               varchar(50)          not null,
   email                varchar(50)          not null,
   password             varchar(50)          not null,
   estado               numeric(1)           null default 1,
   fecha_registro       timestamp with time zone null default current_timestamp,
   fecha_actualizacion  timestamp with time zone null default current_timestamp,
   usuario_id           varchar(10)          null,
   ip_address           varchar(15)          null,
   constraint pk_usuario primary key (id)
);

comment on table usuario is
'usuario';

comment on column usuario.id is
'id';

comment on column usuario.nombre is
'nombre';

comment on column usuario.email is
'email';

comment on column usuario.password is
'password';

comment on column usuario.estado is
'estado';

comment on column usuario.fecha_registro is
'fecha_registro';

comment on column usuario.fecha_actualizacion is
'fecha_actualizacion';

comment on column usuario.usuario_id is
'usuario_id';

comment on column usuario.ip_address is
'ip_address';

alter table ciudad
   add constraint fk_ciudad_ref_depto foreign key (depto_id)
      references depto (id)
      on delete restrict on update restrict;

alter table cupon
   add constraint fk_cupon_ref_moneda foreign key (moneda_id)
      references moneda (id)
      on delete restrict on update restrict;

alter table cupon
   add constraint fk_cupon_ref_tipo_cupon foreign key (tipo_cupon_id)
      references tipo_cupon (id)
      on delete restrict on update restrict;

alter table depto
   add constraint fk_depto_ref_pais foreign key (pais_id)
      references pais (id)
      on delete restrict on update restrict;

alter table entrenamiento
   add constraint fk_entrenam_ref_pro_pro foreign key (procedimiento_id)
      references procedimiento (id)
      on delete restrict on update restrict;

alter table entrenamiento
   add constraint fk_entrenam_ref_tipo_entre foreign key (tipo_entrenamiento_id)
      references tipo_entrenamiento (id)
      on delete restrict on update restrict;

alter table entrenamiento_actividad
   add constraint fk_entr_ref_tipo_act foreign key (tipo_actividad_id)
      references tipo_actividad (id)
      on delete restrict on update restrict;

alter table entrenamiento_actividad
   add constraint fk_ent_ref_ent_act foreign key (entrenamiento_id)
      references entrenamiento (id)
      on delete restrict on update restrict;

alter table entrenamiento_plan
   add constraint fk_entr_plan_ref_entr foreign key (entrenamiento_id)
      references entrenamiento (id)
      on delete restrict on update restrict;

alter table entrenamiento_plan
   add constraint fk_ent_plan_ref_per_atleta foreign key (atleta_id)
      references persona (id)
      on delete restrict on update restrict;

alter table entrenamiento_plan
   add constraint fk_ent_plan_ref_per_entre foreign key (entrenador_id)
      references persona (id)
      on delete restrict on update restrict;

alter table entrenamiento_seguimiento
   add constraint fk_ent_seg_ref_ent_act foreign key (entrenamiento_actividad_id)
      references entrenamiento_actividad (id)
      on delete restrict on update restrict;

alter table entrenamiento_seguimiento
   add constraint fk_ent_seg_ref_ent_plan foreign key (entrenamiento_plan_id)
      references entrenamiento_plan (id)
      on delete restrict on update restrict;

alter table factura
   add constraint fk_factura_ref_fact_est foreign key (factura_estado_id)
      references factura_estado (id)
      on delete restrict on update restrict;

alter table factura
   add constraint fk_factura_ref_moneda foreign key (moneda_id)
      references moneda (id)
      on delete restrict on update restrict;

alter table factura
   add constraint fk_factura_ref_persona foreign key (cliente_persona_id)
      references persona (id)
      on delete restrict on update restrict;

alter table factura
   add constraint fk_factura_ref_punto_ven foreign key (punto_venta_id)
      references punto_venta (id)
      on delete restrict on update restrict;

alter table factura
   add constraint fk_factura_ref_resol_sec foreign key (resolucion_sec_id)
      references resolucion_sec (id)
      on delete restrict on update restrict;

alter table factura_detalle
   add constraint fk_factura_det_ref_prod foreign key (producto_servicio_id)
      references producto (id)
      on delete restrict on update restrict;

alter table factura_detalle
   add constraint fk_fac_det_ref_factura foreign key (factura_id)
      references factura (id)
      on delete restrict on update restrict;

alter table membresia_servicios
   add constraint fk_memb_ref_memb_ser foreign key (membresia_id)
      references membresia (id)
      on delete restrict on update restrict;

alter table membresia_servicios
   add constraint fk_memb_ref_servicio foreign key (servicio_id)
      references servicio (id)
      on delete restrict on update restrict;

alter table moneda_paises
   add constraint fk_pais_mon_ref_moneda foreign key (moneda_id)
      references moneda (id)
      on delete restrict on update restrict;

alter table moneda_paises
   add constraint fk_pais_mon_ref_pais foreign key (pais_id)
      references pais (id)
      on delete restrict on update restrict;

alter table pago
   add constraint fk_pago_ref_pago_est foreign key (pago_estado_id)
      references pago_estado (id)
      on delete restrict on update restrict;

alter table pago
   add constraint fk_pago_ref_punto_ven foreign key (punto_venta_id)
      references punto_venta (id)
      on delete restrict on update restrict;

alter table pago_detalles
   add constraint fk_pago_det_ref_cupon foreign key (cupo_id)
      references cupon (id)
      on delete restrict on update restrict;

alter table pago_detalles
   add constraint fk_pago_det_ref_moneda foreign key (moneda_id)
      references moneda (id)
      on delete restrict on update restrict;

alter table pago_detalles
   add constraint fk_pago_det_ref_pago foreign key (pago_id)
      references pago (id)
      on delete restrict on update restrict;

alter table pago_detalles
   add constraint fk_pago_det_ref_tipo_pago foreign key (tipo_pago_id)
      references tipo_pago (id)
      on delete restrict on update restrict;

alter table pago_facturas
   add constraint fk_pago_fac_ref_factura foreign key (factura_id)
      references factura (id)
      on delete restrict on update restrict;

alter table pago_facturas
   add constraint fk_pago_fac_ref_pago foreign key (pago_id)
      references pago (id)
      on delete restrict on update restrict;

alter table pais
   add constraint fk_pais_rf_continente foreign key (continente_id)
      references continente (id)
      on delete restrict on update restrict;

alter table persona
   add constraint fk_persona_ref_ciudad foreign key (lugar_nacimiento_ciudad_id)
      references ciudad (id)
      on delete restrict on update restrict;

alter table persona
   add constraint fk_persona_ref_pais foreign key (nacionalidad_pais_id)
      references pais (id)
      on delete restrict on update restrict;

alter table persona
   add constraint fk_persona_ref_tipo_doc foreign key (tipo_documento_id)
      references tipo_documento (id)
      on delete restrict on update restrict;

alter table persona_emails
   add constraint fk_persona_email_ref_persona foreign key (persona_id)
      references persona (id)
      on delete restrict on update restrict;

alter table persona_emails
   add constraint fk_persona_email_ref_tipo_email foreign key (tipo_email_id)
      references tipo_email (id)
      on delete restrict on update restrict;

alter table persona_roles
   add constraint fk_persona_roles_ref_persona foreign key (persona_id)
      references persona (id)
      on delete restrict on update restrict;

alter table persona_roles
   add constraint fk_persona_roles_ref_tipo_per foreign key (rol_persona_id)
      references rol_persona (id)
      on delete restrict on update restrict;

alter table persona_roles
   add constraint fk_per_roles_ref_per_tel foreign key (persona_telefonos_id)
      references persona_telefonos (id)
      on delete restrict on update restrict;

alter table persona_telefonos
   add constraint fk_persona_tels_ref_persona foreign key (persona_id)
      references persona (id)
      on delete restrict on update restrict;

alter table persona_telefonos
   add constraint fk_persona_tels_ref_tipo_tel foreign key (tipo_telefono_id)
      references tipo_telefono (id)
      on delete restrict on update restrict;

alter table persona_telefonos
   add constraint fk_pertel_rf_pais foreign key (pais_id)
      references pais (id)
      on delete restrict on update restrict;

alter table procedimiento
   add constraint fk_procedimiento_ref_proceso foreign key (proceso_id)
      references proceso (id)
      on delete restrict on update restrict;

alter table procedimiento
   add constraint fk_pro_pro_ref_servicio foreign key (servicio_id)
      references servicio (id)
      on delete restrict on update restrict;

alter table producto
   add constraint fk_prod_ser_ref_tipo_pro foreign key (tipo_producto_id)
      references tipo_producto (id)
      on delete restrict on update restrict;

alter table producto
   add constraint fk_pro_ser_ref_membresia foreign key (membresia_id)
      references membresia (id)
      on delete restrict on update restrict;

alter table producto_costo
   add constraint fk_prod_cos_ref_producto foreign key (producto_id)
      references producto (id)
      on delete restrict on update restrict;

alter table punto_venta
   add constraint fk_punto_ve_ref_ciudad foreign key (ciudad_id)
      references ciudad (id)
      on delete restrict on update restrict;

alter table punto_venta
   add constraint fk_punto_ve_ref_tipo_pun_ven foreign key (tipo_punto_venta_id)
      references tipo_punto_venta (id)
      on delete restrict on update restrict;

alter table resolucion_sec
   add constraint fk_resol_ref_resolucion foreign key (resolucion_id)
      references resolucion (id)
      on delete restrict on update restrict;

alter table servicio
   add constraint fk_servicio_ref_tipo_servicio foreign key (tipo_servicio_id)
      references tipo_servicio (id)
      on delete restrict on update restrict;

