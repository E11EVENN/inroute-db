/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     30/03/2024 10:49:47 a. m.                    */
/*==============================================================*/


drop table ciudad;

drop table cupon;

drop table depto;

drop table entrenamiento;

drop table entrenamiento_actividad;

drop table entrenamiento_plan;

drop table entrenamiento_seguimiento;

drop table factura;

drop table factura_detalle;

drop table factura_estado;

drop table membresia;

drop table membresia_servicios;

drop table moneda;

drop table pago;

drop table pago_detalles;

drop table pago_estado;

drop table pago_facturas;

drop table pais;

drop table persona;

drop table persona_emails;

drop table persona_roles;

drop table persona_telefonos;

drop table procedimiento;

drop table proceso;

drop table producto;

drop table producto_costo;

drop table punto_venta;

drop table resolucion;

drop table resolucion_sec;

drop table rol_persona;

drop table servicio;

drop table tipo_actividad;

drop table tipo_cupon;

drop table tipo_documento;

drop table tipo_email;

drop table tipo_entrenamiento;

drop table tipo_pago;

drop table tipo_producto;

drop table tipo_punto_venta;

drop table tipo_servicio;

drop table tipo_telefono;

drop table usuario;

drop sequence entrenamiento_actividad_seq;

drop sequence entrenamiento_plan_seq;

drop sequence entrenamiento_seguimiento_seq;

drop sequence factura_detalle_seq;

drop sequence factura_seq;

drop sequence membresia_servicios_seq;

drop sequence pago_detalles_seq;

drop sequence pago_facturas_seq;

drop sequence pago_seq;

drop sequence persona_emails_seq;

drop sequence persona_seq;

drop sequence persona_telefonos_seq;

drop sequence producto_costo_seq;

drop sequence resolucion_sec_seq;

drop sequence resolucion_seq;

create sequence entrenamiento_actividad_seq
increment 1
start 0;

create sequence entrenamiento_plan_seq
increment 1
start 0;

create sequence entrenamiento_seguimiento_seq
increment 1
start 0;

create sequence factura_detalle_seq
increment 1
start 0;

create sequence factura_seq
increment 1
start 0;

create sequence membresia_servicios_seq
increment 1
start 0;

create sequence pago_detalles_seq
increment 1
start 0;

create sequence pago_facturas_seq
increment 1
start 0;

create sequence pago_seq
increment 1
start 0;

create sequence persona_emails_seq
increment 1
start 0;

create sequence persona_seq
increment 1
start 0;

create sequence persona_telefonos_seq
increment 1
start 0;

create sequence producto_costo_seq
increment 1
start 0;

create sequence resolucion_sec_seq
increment 1
start 0;

create sequence resolucion_seq
increment 1
start 0;

/*==============================================================*/
/* Table: ciudad                                                */
/*==============================================================*/
create table ciudad (
   id                   varchar(3)           not null,
   nombre               varchar(30)          not null,
   depto_id             varchar(2)           not null,
   estado               numeric(1)           null default 1,
   fecha_registro       timestamp with time zone null default current_timestamp,
   fecha_actualizacion  timestamp with time zone null default current_timestamp,
   usuario_id           varchar(10)          null,
   ip_address           varchar(15)          null,
   constraint pk_ciudad primary key (id)
);

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

/*==============================================================*/
/* Table: entrenamiento                                         */
/*==============================================================*/
create table entrenamiento (
   id                   varchar(5)           not null,
   nombre               varchar(25)          not null,
   tipo_entrenamiento_id varchar(2)           not null,
   procedimiento_id     varchar(2)           not null,
   descripcion          varchar(100)         null,
   url_video            varchar(200)         null,
   estado               numeric(1)           null default 1,
   constraint pk_entrenamiento primary key (id)
);

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

/*==============================================================*/
/* Table: entrenamiento_seguimiento                             */
/*==============================================================*/
create table entrenamiento_seguimiento (
   id                   numeric(20)          not null default nextval('entrenamiento_seguimiento_seq'),
   fecha_registro       timestamp with time zone null default current_timestamp,
   entrenamiento_plan_id numeric(15)          not null default nextval('entrenamiento_plan_seq'),
   entrenamiento_actividad_id numeric(4)           not null,
   latitud              decimal              null,
   longitud             decimal              null,
   respuesta            varchar(100)         null,
   usuario_id           varchar(10)          null,
   ip_address           varchar(15)          null,
   constraint pk_entrenamiento_seguimiento primary key (id)
);

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

/*==============================================================*/
/* Table: membresia_servicios                                   */
/*==============================================================*/
create table membresia_servicios (
   id                   numeric(5)           not null default nextval('membresia_servicios_seq'),
   membresia_id         varchar(3)           not null,
   servicio_id          varchar(5)           not null,
   estado               numeric(1)           null default 1,
   fecha_registro       timestamp with time zone null default current_timestamp,
   fecha_actualizacion  timestamp with time zone null default current_timestamp,
   usuario_id           varchar(10)          null,
   ip_address           varchar(15)          null,
   constraint pk_membresia_servicios primary key (id)
);

/*==============================================================*/
/* Table: moneda                                                */
/*==============================================================*/
create table moneda (
   id                   varchar(3)           not null,
   nombre               varchar(20)          not null,
   simbolo              varchar(3)           not null,
   pais_id              varchar(3)           not null,
   constraint pk_moneda primary key (id)
);

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

/*==============================================================*/
/* Table: pais                                                  */
/*==============================================================*/
create table pais (
   id                   varchar(3)           not null,
   nombre               varchar(40)          not null,
   indicativo_telefonico numeric(4)           not null,
   estado               numeric(1)           null default 1,
   fecha_registro       timestamp with time zone null default current_timestamp,
   fecha_actualizacion  timestamp with time zone null default current_timestamp,
   usuario_id           varchar(10)          null,
   ip_address           varchar(15)          null,
   constraint pk_pais primary key (id)
);

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
   lugar_nacimiento_ciudad_id varchar(3)           not null,
   estado               numeric(1)           null default 1,
   fecha_registro       timestamp with time zone null default current_timestamp,
   fecha_actualizacion  timestamp with time zone null default current_timestamp,
   usuario_id           varchar(10)          null,
   ip_address           varchar(15)          null,
   constraint pk_persona primary key (id)
);

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

/*==============================================================*/
/* Table: persona_telefonos                                     */
/*==============================================================*/
create table persona_telefonos (
   id                   numeric(5)           not null default nextval('persona_telefonos_seq'),
   tipo_telefono_id     varchar(3)           not null,
   persona_id           numeric(10)          not null,
   numero               numeric(15)          not null,
   whatsapp             bool                 null default false,
   estado               numeric(1)           null default 1,
   fecha_registro       timestamp with time zone null default current_timestamp,
   fecha_actualizacion  timestamp with time zone null default current_timestamp,
   usuario_id           varchar(10)          null,
   ip_address           varchar(15)          null,
   constraint pk_persona_telefonos primary key (id)
);

/*==============================================================*/
/* Table: procedimiento                                         */
/*==============================================================*/
create table procedimiento (
   id                   varchar(2)           not null,
   proceso_id           varchar(2)           not null,
   servicio_id          varchar(5)           not null,
   nombre               varchar(25)          not null,
   descripcion          varchar(100)         null,
   constraint pk_procedimiento primary key (id)
);

/*==============================================================*/
/* Table: proceso                                               */
/*==============================================================*/
create table proceso (
   id                   varchar(2)           not null,
   nombre               varchar(25)          not null,
   descripcion          varchar(100)         null,
   constraint pk_proceso primary key (id)
);

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

/*==============================================================*/
/* Table: punto_venta                                           */
/*==============================================================*/
create table punto_venta (
   id                   varchar(5)           not null,
   tipo_punto_venta_id  varchar(2)           not null,
   ciudad_id            varchar(3)           not null,
   nombre               varchar(30)          not null,
   estado               numeric(1)           null default 1,
   fecha_registro       timestamp with time zone null default current_timestamp,
   fecha_actualizacion  timestamp with time zone null default current_timestamp,
   usuario_id           varchar(10)          null,
   ip_address           varchar(15)          null,
   constraint pk_punto_venta primary key (id)
);

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

/*==============================================================*/
/* Table: rol_persona                                           */
/*==============================================================*/
create table rol_persona (
   id                   varchar(3)           not null,
   nombre               varchar(25)          not null,
   constraint pk_rol_persona primary key (id)
);

/*==============================================================*/
/* Table: servicio                                              */
/*==============================================================*/
create table servicio (
   id                   varchar(5)           not null,
   nombre               varchar(20)          not null,
   tipo_servicio_id     varchar(2)           null,
   constraint pk_servicio primary key (id)
);

/*==============================================================*/
/* Table: tipo_actividad                                        */
/*==============================================================*/
create table tipo_actividad (
   id                   varchar(2)           not null,
   nombre               varchar(25)          not null,
   constraint pk_tipo_actividad primary key (id)
);

/*==============================================================*/
/* Table: tipo_cupon                                            */
/*==============================================================*/
create table tipo_cupon (
   id                   varchar(2)           not null,
   nombre               varchar(25)          not null,
   constraint pk_tipo_cupon primary key (id)
);

/*==============================================================*/
/* Table: tipo_documento                                        */
/*==============================================================*/
create table tipo_documento (
   id                   varchar(2)           not null,
   nombre               varchar(25)          not null,
   constraint pk_tipo_documento primary key (id)
);

/*==============================================================*/
/* Table: tipo_email                                            */
/*==============================================================*/
create table tipo_email (
   id                   varchar(3)           not null,
   nombre               varchar(25)          not null,
   constraint pk_tipo_email primary key (id)
);

/*==============================================================*/
/* Table: tipo_entrenamiento                                    */
/*==============================================================*/
create table tipo_entrenamiento (
   id                   varchar(2)           not null,
   nombre               varchar(25)          not null,
   constraint pk_tipo_entrenamiento primary key (id)
);

/*==============================================================*/
/* Table: tipo_pago                                             */
/*==============================================================*/
create table tipo_pago (
   id                   varchar(2)           not null,
   nombre               varchar(25)          not null,
   constraint pk_tipo_pago primary key (id)
);

/*==============================================================*/
/* Table: tipo_producto                                         */
/*==============================================================*/
create table tipo_producto (
   id                   varchar(2)           not null,
   nombre               varchar(25)          not null,
   constraint pk_tipo_producto primary key (id)
);

/*==============================================================*/
/* Table: tipo_punto_venta                                      */
/*==============================================================*/
create table tipo_punto_venta (
   id                   varchar(2)           not null,
   nombre               varchar(25)          not null,
   constraint pk_tipo_punto_venta primary key (id)
);

/*==============================================================*/
/* Table: tipo_servicio                                         */
/*==============================================================*/
create table tipo_servicio (
   id                   varchar(2)           not null,
   nombre               varchar(25)          not null,
   constraint pk_tipo_servicio primary key (id)
);

/*==============================================================*/
/* Table: tipo_telefono                                         */
/*==============================================================*/
create table tipo_telefono (
   id                   varchar(3)           not null,
   nombre               varchar(25)          not null,
   constraint pk_tipo_telefono primary key (id)
);

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
   add constraint fk_ent_ref_ent_act foreign key (entrenamiento_id)
      references entrenamiento (id)
      on delete restrict on update restrict;

alter table entrenamiento_actividad
   add constraint fk_entrenam_reference_tipo_act foreign key (tipo_actividad_id)
      references tipo_actividad (id)
      on delete restrict on update restrict;

alter table entrenamiento_plan
   add constraint fk_ent_plan_ref_per_atleta foreign key (atleta_id)
      references persona (id)
      on delete restrict on update restrict;

alter table entrenamiento_plan
   add constraint fk_ent_plan_ref_per_entre foreign key (entrenador_id)
      references persona (id)
      on delete restrict on update restrict;

alter table entrenamiento_plan
   add constraint fk_entrenam_reference_entrenam foreign key (entrenamiento_id)
      references entrenamiento (id)
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
   add constraint fk_membresi_reference_servicio foreign key (servicio_id)
      references servicio (id)
      on delete restrict on update restrict;

alter table moneda
   add constraint fk_moneda_ref_pais foreign key (pais_id)
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

