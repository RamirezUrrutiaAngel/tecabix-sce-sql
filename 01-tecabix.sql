/*
 *   This file is part of Foobar.
 *
 *   Foobar is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation, either version 3 of the License, or
 *   (at your option) any later version.
 *
 *   Foobar is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with Foobar.  If not, see <https://www.gnu.org/licenses/>.
 *
 */
 CREATE SCHEMA tecabix_sce
    AUTHORIZATION postgres;

CREATE SEQUENCE tecabix_sce.catalogo_tipo_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.catalogo_tipo_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.catalogo_tipo(
	id_catalogo_tipo integer NOT NULL DEFAULT nextval('tecabix_sce.catalogo_tipo_seq'::regclass),
	nombre character varying(45) NOT NULL,
	descripcion character varying(250) NOT NULL,
    id_usuario_modificado bigint,
	fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
	id_estatus integer,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_catalogo_tipo_id_catalogo_tipo PRIMARY KEY (id_catalogo_tipo),
CONSTRAINT uq_catalogo_tipo_nombre UNIQUE (nombre),
CONSTRAINT uq_catalogo_tipo_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.catalogo_tipo IS 'TIPO DE CATALOGO';
COMMENT ON COLUMN tecabix_sce.catalogo_tipo.id_catalogo_tipo IS 'IDENTIFICADOR UNICO DEL TIPO DE CATALOGO';
COMMENT ON COLUMN tecabix_sce.catalogo_tipo.nombre IS 'NOMBRE DEL TIPO DE CATALOGO';
COMMENT ON COLUMN tecabix_sce.catalogo_tipo.descripcion IS 'DESCRIPCION DEL TIPO DEL CATALOGO';
COMMENT ON COLUMN tecabix_sce.catalogo_tipo.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.catalogo_tipo.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.catalogo_tipo.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';

CREATE INDEX indx_catalogo_tipo_nombre
    ON tecabix_sce.catalogo_tipo USING btree
    (nombre COLLATE pg_catalog."default")
    TABLESPACE pg_default;



CREATE SEQUENCE tecabix_sce.catalogo_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.catalogo_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.catalogo(
	id_catalogo integer NOT NULL DEFAULT nextval('tecabix_sce.catalogo_seq'::regclass),
	nombre character varying(45) NOT NULL,
	nombre_completo character varying(250) NOT NULL,
	descripcion character varying(500) NOT NULL,
	orden integer,
	id_catalogo_tipo integer NOT NULL,
    id_usuario_modificado bigint,
	fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
	id_estatus integer,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_catalogo_id_catalogo PRIMARY KEY (id_catalogo),
CONSTRAINT uq_catalogo_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.catalogo IS 'CATALOGO';
COMMENT ON COLUMN tecabix_sce.catalogo.id_catalogo IS 'IDENTIFICADOR UNICO DEL CATALOGO';
COMMENT ON COLUMN tecabix_sce.catalogo.nombre IS 'NOMBRE DE CATALOGO';
COMMENT ON COLUMN tecabix_sce.catalogo.nombre_completo IS 'NOMBRE COMPLETO DEL CATALOGO';
COMMENT ON COLUMN tecabix_sce.catalogo.descripcion IS 'DESCRIPCION DEL CATALOGO';
COMMENT ON COLUMN tecabix_sce.catalogo.orden IS 'ORDEN DEL CATALOGO';
COMMENT ON COLUMN tecabix_sce.catalogo.id_catalogo_tipo IS 'TIPO DE CATALOGO';
COMMENT ON COLUMN tecabix_sce.catalogo.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.catalogo.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.catalogo.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';


ALTER TABLE tecabix_sce.catalogo ADD CONSTRAINT fk_catalogo_id_catalogo_tipo FOREIGN KEY (id_catalogo_tipo)
REFERENCES tecabix_sce.catalogo_tipo(id_catalogo_tipo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

CREATE INDEX indx_catalogo_nombre
    ON tecabix_sce.catalogo USING btree
    (nombre COLLATE pg_catalog."default")
    TABLESPACE pg_default;


CREATE SEQUENCE tecabix_sce.estado_seq
    INCREMENT 1
    START 33
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.estado_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.estado(
	id_estado integer NOT NULL DEFAULT nextval('tecabix_sce.estado_seq'::regclass),
	nombre character varying(20) NOT NULL,
	abreviatura character varying(4) NOT NULL,
    id_usuario_modificado bigint NOT NULL,
	fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
	id_estatus integer NOT NULL,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_estado_id_estado PRIMARY KEY (id_estado),
CONSTRAINT uq_estado_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.estado IS 'ENTIDAD FEDERATIVA';
COMMENT ON COLUMN tecabix_sce.estado.id_estado IS 'IDENTIFICADOR UNICO DE LA ENTIDAD FEDERATIVA';
COMMENT ON COLUMN tecabix_sce.estado.nombre IS 'NOMBRE DE LA ENTIDAD FEDERATIVA';
COMMENT ON COLUMN tecabix_sce.estado.abreviatura IS 'ABREVIATURA DE LA ENTIDAD FEDERATIVA';
COMMENT ON COLUMN tecabix_sce.estado.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.estado.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.estado.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';

ALTER TABLE tecabix_sce.estado ADD CONSTRAINT fk_estado_id_estatus FOREIGN KEY (id_estatus)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;




CREATE INDEX indx_estado_nombre_idx
    ON tecabix_sce.estado USING btree
    (nombre COLLATE pg_catalog."default")
    TABLESPACE pg_default;

CREATE INDEX indx_estado_abreviatura_idx
    ON tecabix_sce.estado USING btree
    (abreviatura COLLATE pg_catalog."default")
    TABLESPACE pg_default;



CREATE SEQUENCE tecabix_sce.municipio_seq
    INCREMENT 1
    START 2459
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.municipio_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.municipio(
	id_municipio integer NOT NULL DEFAULT nextval('tecabix_sce.municipio_seq'::regclass),
	nombre character varying(40) NOT NULL,
	id_estado integer NOT NULL,
    id_usuario_modificado bigint NOT NULL,
	fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
	id_estatus integer NOT NULL,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_municipio_id_municipio PRIMARY KEY (id_municipio),
CONSTRAINT uq_municipio_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.municipio IS 'MUNICIPIO';
COMMENT ON COLUMN tecabix_sce.municipio.id_estado IS 'IDENTIFICADOR UNICO DEL MUNICIPIO';
COMMENT ON COLUMN tecabix_sce.municipio.nombre IS 'NOMBRE DEL MUNICIPIO';
COMMENT ON COLUMN tecabix_sce.municipio.id_estado IS 'ESTADO AL QUE PERTENECE EL MUNICIPIO';
COMMENT ON COLUMN tecabix_sce.municipio.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.municipio.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.municipio.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';

ALTER TABLE tecabix_sce.municipio ADD CONSTRAINT fk_municipio_id_estatus FOREIGN KEY (id_estatus)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.municipio ADD CONSTRAINT fk_municipio_id_estado FOREIGN KEY (id_estado)
REFERENCES tecabix_sce.estado(id_estado) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;



CREATE SEQUENCE tecabix_sce.perfil_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.perfil_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.perfil(
	id_perfil bigint NOT NULL DEFAULT nextval('tecabix_sce.perfil_seq'::regclass),
	nombre character varying(45) NOT NULL,
	descripcion character varying(500) NOT NULL,
	id_empresa bigint NOT NULL,
    id_usuario_modificado bigint NOT NULL,
	fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
    id_estatus integer NOT NULL,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_perfil_id_perfil PRIMARY KEY (id_perfil),
CONSTRAINT uq_perfil_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.perfil IS 'PERFIL';
COMMENT ON COLUMN tecabix_sce.perfil.id_perfil IS 'IDENTIFICADOR UNICO DEL PERFIL';
COMMENT ON COLUMN tecabix_sce.perfil.nombre IS 'NOMBRE DEL PERFIL';
COMMENT ON COLUMN tecabix_sce.perfil.descripcion IS 'DESCRIPCION DEL PERFIL';
COMMENT ON COLUMN tecabix_sce.perfil.id_empresa IS 'EMPRESA AL QUE PERTENECE EL PERFIL';
COMMENT ON COLUMN tecabix_sce.perfil.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.perfil.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.perfil.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';

CREATE INDEX indx_perfil_nombre
    ON tecabix_sce.perfil USING btree
    (nombre COLLATE pg_catalog."default")
    TABLESPACE pg_default;

CREATE SEQUENCE tecabix_sce.authority_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.authority_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.authority(
	id_authority integer NOT NULL DEFAULT nextval('tecabix_sce.authority_seq'::regclass),
	nombre character varying(50) NOT NULL,
	descripcion character varying(300) NOT NULL,
	id_pre_authority integer,
    id_usuario_modificado bigint,
	fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
	id_estatus integer NOT NULL,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_authority_id_authority PRIMARY KEY (id_authority),
CONSTRAINT uq_authority_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.authority IS 'PERMISOS DEL PERFIL';
COMMENT ON COLUMN tecabix_sce.authority.id_authority IS 'IDENTIFICADOR UNICO DEL PERMISO';
COMMENT ON COLUMN tecabix_sce.authority.nombre IS 'NOMBRE DEL PERMISO';
COMMENT ON COLUMN tecabix_sce.authority.descripcion IS 'DESCRIPCION DEL PERMISO';
COMMENT ON COLUMN tecabix_sce.authority.id_pre_authority IS 'PERMISO PADRE';
COMMENT ON COLUMN tecabix_sce.authority.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.authority.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.authority.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';


ALTER TABLE tecabix_sce.authority ADD CONSTRAINT fk_authority_id_pre_authority FOREIGN KEY (id_pre_authority)
REFERENCES tecabix_sce.authority(id_authority) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.authority ADD CONSTRAINT fk_authority_id_estatus FOREIGN KEY (id_estatus)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;


CREATE INDEX indx_authority_nombre
    ON tecabix_sce.authority USING btree
    (nombre COLLATE pg_catalog."default")
    TABLESPACE pg_default;



CREATE SEQUENCE tecabix_sce.perfil_authority_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.perfil_authority_seq
    OWNER TO postgres;
CREATE TABLE tecabix_sce.perfil_authority(
	id_perfil_authority bigint NOT NULL DEFAULT nextval('tecabix_sce.perfil_authority_seq'::regclass),
	id_perfil bigint NOT NULL,
	id_authority integer NOT NULL,
CONSTRAINT pk_perfil_authority_id_perfil_authority PRIMARY KEY (id_perfil_authority)
);
COMMENT ON TABLE tecabix_sce.perfil_authority IS 'RELACION ENTRE PERFIL Y AUTHORITY';
COMMENT ON COLUMN tecabix_sce.perfil_authority.id_perfil_authority IS 'IDENTIFICADOR UNICO DE LA RELACION';
COMMENT ON COLUMN tecabix_sce.perfil_authority.id_perfil IS 'LLAVE FORANEA DEL PERFIL';
COMMENT ON COLUMN tecabix_sce.perfil_authority.id_authority IS 'LLAVE FORANEA DEL AUTHORITY';

ALTER TABLE tecabix_sce.perfil_authority ADD CONSTRAINT fk_perfil_authority_id_perfil FOREIGN KEY (id_perfil)
REFERENCES tecabix_sce.perfil(id_perfil) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.perfil_authority ADD CONSTRAINT fk_perfil_authority_id_authority FOREIGN KEY (id_authority)
REFERENCES tecabix_sce.authority(id_authority) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;



CREATE SEQUENCE tecabix_sce.usuario_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.usuario_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.usuario(
	id_usuario bigint NOT NULL DEFAULT nextval('tecabix_sce.usuario_seq'::regclass),
	nombre character varying(45) NOT NULL,
	psw character varying(500) NOT NULL,
	correo character varying(45) NOT NULL,
	id_perfil bigint,
	id_usuario_modificado bigint,
	fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
	id_estatus integer,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_usuario_id_usuario PRIMARY KEY (id_usuario),
CONSTRAINT uq_usuario_nombre UNIQUE (nombre),
CONSTRAINT uq_usuario_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.usuario IS 'USUARIO';
COMMENT ON COLUMN tecabix_sce.usuario.id_usuario IS 'IDENTIFICADOR UNICO DEL USUARIO';
COMMENT ON COLUMN tecabix_sce.usuario.nombre IS 'NOMBRE DEL USUARIO';
COMMENT ON COLUMN tecabix_sce.usuario.psw IS 'CONTRASEÑA DEL USUARIO';
COMMENT ON COLUMN tecabix_sce.usuario.correo IS 'CORREO DEL USUARIO';
COMMENT ON COLUMN tecabix_sce.usuario.id_perfil IS 'PERFIL';
COMMENT ON COLUMN tecabix_sce.usuario.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.usuario.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.usuario.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';

ALTER TABLE tecabix_sce.usuario ADD CONSTRAINT fk_usuario_id_perfil FOREIGN KEY (id_perfil)
REFERENCES tecabix_sce.perfil(id_perfil) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.estado ADD CONSTRAINT fk_estado_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.municipio ADD CONSTRAINT fk_municipio_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;


CREATE INDEX indx_usuario_nombre
    ON tecabix_sce.usuario USING btree
    (nombre COLLATE pg_catalog."default")
    TABLESPACE pg_default;

CREATE INDEX indx_usuario_correo_idx
    ON tecabix_sce.usuario USING btree
    (correo COLLATE pg_catalog."default")
    TABLESPACE pg_default;

ALTER TABLE tecabix_sce.authority ADD CONSTRAINT fk_authority_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;



CREATE SEQUENCE tecabix_sce.direccion_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.direccion_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.direccion(
	id_direccion bigint NOT NULL DEFAULT nextval('tecabix_sce.direccion_seq'::regclass),
	calle character varying(40) NOT NULL,
	codigo_postal character varying(6) NOT NULL,
	num_int character varying(15),
	num_ext character varying(10),
	asentamiento character varying(40),
	entre_calle character varying(40),
	referencia character varying(250),
	id_municipio integer NOT NULL,
	id_usuario_modificado bigint NOT NULL,
	fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
	id_estatus integer NOT NULL,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_direccion_id_direccion PRIMARY KEY (id_direccion),
CONSTRAINT uq_direccion_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.direccion IS 'DOMICILIO DE ENTIDADES FISICAS O MORALES';
COMMENT ON COLUMN tecabix_sce.direccion.id_direccion IS 'IDENTIFICADOR UNICO DE LA DIRECCION';
COMMENT ON COLUMN tecabix_sce.direccion.calle IS 'CALLE';
COMMENT ON COLUMN tecabix_sce.direccion.codigo_postal IS 'CODIGO POSTAL';
COMMENT ON COLUMN tecabix_sce.direccion.num_int IS 'NUMERO INTERIOR';
COMMENT ON COLUMN tecabix_sce.direccion.num_ext IS 'NUMERO EXTERIOR';
COMMENT ON COLUMN tecabix_sce.direccion.asentamiento IS 'ASENTAMIENTO DE LA COLONIA, BARRIO, FRACCIONAMIENTO, ETC';
COMMENT ON COLUMN tecabix_sce.direccion.entre_calle IS 'ENTRE QUE CALLE Y CALLE SE ENCUENTRA EL DOMICILIO';
COMMENT ON COLUMN tecabix_sce.direccion.referencia IS 'REFERENCIA';
COMMENT ON COLUMN tecabix_sce.direccion.id_municipio IS 'MUNICIPIO';
COMMENT ON COLUMN tecabix_sce.direccion.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.direccion.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.direccion.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';

ALTER TABLE tecabix_sce.direccion ADD CONSTRAINT fk_direccion_id_estatus FOREIGN KEY (id_estatus)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.direccion ADD CONSTRAINT fk_direccion_id_municipio FOREIGN KEY (id_municipio)
REFERENCES tecabix_sce.municipio(id_municipio) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.direccion ADD CONSTRAINT fk_direccion_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;



CREATE SEQUENCE tecabix_sce.persona_seq
    INCREMENT 1
    START 1234000040003468
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.persona_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.persona(
	id_persona bigint NOT NULL DEFAULT nextval('tecabix_sce.persona_seq'::regclass),
	id_tipo integer NOT NULL,
    id_empresa bigint,
	id_usuario_modificado bigint NOT NULL,
	fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
	id_estatus integer NOT NULL,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_persona_id_persona PRIMARY KEY (id_persona),
CONSTRAINT uq_persona_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.persona IS 'PERSONA QUE PUEDE SER FISICA O MORAL';
COMMENT ON COLUMN tecabix_sce.persona.id_persona IS 'IDENTIFICADOR UNICO DE LA PERSONA';
COMMENT ON COLUMN tecabix_sce.persona.id_tipo IS 'TIPO DE PERSONA, CATALOGO_TIPO = TIPO_DE_PERSONA';
COMMENT ON COLUMN tecabix_sce.persona.id_empresa IS 'EMPRESA AL QUE PERTENECE LA PERSONA';
COMMENT ON COLUMN tecabix_sce.persona.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.persona.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.persona.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';

ALTER TABLE tecabix_sce.persona ADD CONSTRAINT fk_persona_id_tipo FOREIGN KEY (id_tipo)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.persona ADD CONSTRAINT fk_persona_id_estatus FOREIGN KEY (id_estatus)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.persona ADD CONSTRAINT fk_persona_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

CREATE SEQUENCE tecabix_sce.usuario_persona_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.usuario_persona_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.usuario_persona(
	id_usuario_persona bigint NOT NULL DEFAULT nextval('tecabix_sce.usuario_persona_seq'::regclass),
	id_usuario bigint NOT NULL,
	id_persona bigint NOT NULL,
	id_usuario_modificado bigint,
	fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
	id_estatus integer NOT NULL,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_usuario_persona_id_usuario_persona PRIMARY KEY (id_usuario_persona),
CONSTRAINT uq_usuario_persona_id_usuario UNIQUE (id_usuario),
CONSTRAINT uq_usuario_persona_id_persona UNIQUE (id_persona),
CONSTRAINT uq_usuario_persona_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.usuario_persona IS 'RELACION ENTRE USUARIO Y PERSONA';
COMMENT ON COLUMN tecabix_sce.usuario_persona.id_usuario_persona IS 'IDENTIFICADOR UNICO DE LA RELACION USUARIO Y PERSONA';
COMMENT ON COLUMN tecabix_sce.usuario_persona.id_usuario IS 'IDENTIFICADOR UNICO DEL USUARIO';
COMMENT ON COLUMN tecabix_sce.usuario_persona.id_persona IS 'IDENTIFICADOR UNICO DE LA PERSONA';
COMMENT ON COLUMN tecabix_sce.usuario_persona.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.usuario_persona.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.usuario_persona.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';

ALTER TABLE tecabix_sce.usuario_persona ADD CONSTRAINT fk_usuario_id_estatus FOREIGN KEY (id_estatus)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.usuario_persona ADD CONSTRAINT fk_usuario_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.usuario_persona ADD CONSTRAINT fk_usuario_id_usuario FOREIGN KEY (id_usuario)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.usuario_persona ADD CONSTRAINT fk_usuario_id_persona FOREIGN KEY (id_persona)
REFERENCES tecabix_sce.persona(id_persona) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;


CREATE SEQUENCE tecabix_sce.persona_moral_seq
    INCREMENT 1
    START 4321987610122740
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.persona_moral_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.persona_moral(
	id_persona_moral bigint NOT NULL DEFAULT nextval('tecabix_sce.persona_moral_seq'::regclass),
	id_persona bigint NOT NULL,
	razon_social character varying(45) NOT NULL,
	rfc character varying(18) NOT NULL,
	fundada date NOT NULL DEFAULT now (),
	id_direccion bigint NOT NULL,
	id_usuario_modificado bigint NOT NULL,
	fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
	id_estatus integer NOT NULL,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_persona_moral_id_persona_moral PRIMARY KEY (id_persona_moral),
CONSTRAINT uq_persona_moral_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.persona_moral IS 'EMPRESAS O PERSONA CON ACTIVIDAD EMPRESARIAL';
COMMENT ON COLUMN tecabix_sce.persona_moral.id_persona_moral IS 'IDENTIFICADOR ÚNICO DE LA EMPRESA.';
COMMENT ON COLUMN tecabix_sce.persona_moral.id_persona IS 'LLAVE FORANEA DE LA PERSONA';
COMMENT ON COLUMN tecabix_sce.persona_moral.razon_social IS 'RAZON SOCIAL';
COMMENT ON COLUMN tecabix_sce.persona_moral.rfc IS 'REGISTRO FEDERAL DE CONTRIBUYENTES';
COMMENT ON COLUMN tecabix_sce.persona_moral.fundada IS 'FECHA DE CREACION';
COMMENT ON COLUMN tecabix_sce.persona_moral.id_direccion IS 'LLAVE FORANEA DE UBICACION';
COMMENT ON COLUMN tecabix_sce.persona_moral.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.persona_moral.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.persona_moral.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';


ALTER TABLE tecabix_sce.persona_moral ADD CONSTRAINT fk_persona_moral_id_persona FOREIGN KEY (id_persona)
REFERENCES tecabix_sce.persona(id_persona) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.persona_moral ADD CONSTRAINT fk_persona_moral_id_direccion FOREIGN KEY (id_direccion)
REFERENCES tecabix_sce.direccion(id_direccion) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.persona_moral ADD CONSTRAINT fk_persona_moral_id_estatus FOREIGN KEY (id_estatus)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.persona ADD CONSTRAINT fk_persona_id_empresa FOREIGN KEY (id_empresa)
REFERENCES tecabix_sce.persona_moral(id_persona_moral) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.perfil ADD CONSTRAINT fk_perfil_id_empresa FOREIGN KEY (id_empresa)
REFERENCES tecabix_sce.persona_moral(id_persona_moral) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.perfil ADD CONSTRAINT fk_perfil_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.perfil ADD CONSTRAINT fk_perfil_id_estatus FOREIGN KEY (id_estatus)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

CREATE INDEX indx_persona_moral_razon_social
    ON tecabix_sce.persona_moral USING btree
    (razon_social COLLATE pg_catalog."default")
    TABLESPACE pg_default;

CREATE INDEX indx_persona_moral_rfc
    ON tecabix_sce.persona_moral USING btree
    (rfc COLLATE pg_catalog."default")
    TABLESPACE pg_default;



CREATE SEQUENCE tecabix_sce.persona_fisica_seq
    INCREMENT 1
    START 1111000012340356
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.persona_fisica_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.persona_fisica(
	id_persona_fisica bigint NOT NULL DEFAULT nextval('tecabix_sce.persona_fisica_seq'::regclass),
	id_persona bigint NOT NULL,
	nombre character varying(45) NOT NULL,
	apellido_paterno character varying(15) NOT NULL,
	apellido_materno character varying(15) NOT NULL,
    id_sexo integer,
	fecha_nacimiento date,
	id_direccion bigint,
	id_usuario_modificado bigint NOT NULL,
	fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
	id_estatus integer NOT NULL,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_persona_fisica_id_persona_fisica PRIMARY KEY (id_persona_fisica),
CONSTRAINT uq_persona_fisica_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.persona_fisica IS 'PERSONAS FISICAS';
COMMENT ON COLUMN tecabix_sce.persona_fisica.id_persona_fisica IS 'IDENTIFICADOR UNICO DE LA PERSONA FISICA';
COMMENT ON COLUMN tecabix_sce.persona_fisica.id_persona IS 'LLAVE FORANEA DE LA PERSONA';
COMMENT ON COLUMN tecabix_sce.persona_fisica.nombre IS 'NOMBRE DE PILA';
COMMENT ON COLUMN tecabix_sce.persona_fisica.apellido_paterno IS 'APELLIDO PATERNO O PRIMER NOMBRE';
COMMENT ON COLUMN tecabix_sce.persona_fisica.apellido_materno IS 'APELLIDO MATERBO O SEGUNDO APELLIDO';
COMMENT ON COLUMN tecabix_sce.persona_fisica.id_sexo IS 'SEXO BIOLOGICO, CATALOGO_TIPO = SEXO';
COMMENT ON COLUMN tecabix_sce.persona_fisica.fecha_nacimiento IS 'FECHA DE NACIMIENTO';
COMMENT ON COLUMN tecabix_sce.persona_fisica.id_direccion IS 'DOMICILIO';
COMMENT ON COLUMN tecabix_sce.persona_fisica.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.persona_fisica.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.persona_fisica.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';

ALTER TABLE tecabix_sce.persona_fisica ADD CONSTRAINT fk_persona_fisica_id_persona FOREIGN KEY (id_persona)
REFERENCES tecabix_sce.persona(id_persona) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.persona_fisica ADD CONSTRAINT fk_persona_fisical_id_direccion FOREIGN KEY (id_direccion)
REFERENCES tecabix_sce.direccion(id_direccion) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.persona_fisica ADD CONSTRAINT fk_persona_fisica_id_sexo FOREIGN KEY (id_sexo)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.persona_fisica ADD CONSTRAINT fk_persona_fisica_id_estatus FOREIGN KEY (id_estatus)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.persona_fisica ADD CONSTRAINT fk_persona_fisica_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

CREATE INDEX indx_persona_fisica_nombre
    ON tecabix_sce.persona_fisica USING btree
    (nombre COLLATE pg_catalog."default")
    TABLESPACE pg_default;

CREATE INDEX indx_persona_fisica_apellido_paterno
    ON tecabix_sce.persona_fisica USING btree
    (apellido_paterno COLLATE pg_catalog."default")
    TABLESPACE pg_default;

CREATE INDEX indx_persona_fisica_apellido_materno
    ON tecabix_sce.persona_fisica USING btree
    (apellido_materno COLLATE pg_catalog."default")
    TABLESPACE pg_default;



CREATE SEQUENCE tecabix_sce.contacto_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.contacto_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.contacto(
	id_contacto bigint NOT NULL DEFAULT nextval('tecabix_sce.contacto_seq'::regclass),
	id_persona bigint NOT NULL,
    id_tipo integer NOT NULL,
    valor character varying(45) NOT NULL,
CONSTRAINT pk_catalogo_tipo_id_contacto PRIMARY KEY (id_contacto)
);
COMMENT ON TABLE tecabix_sce.contacto IS 'CONTACTO';
COMMENT ON COLUMN tecabix_sce.contacto.id_contacto IS 'IDENTIFICADOR UNICO DEL TIPO DEL CONTACTO';
COMMENT ON COLUMN tecabix_sce.contacto.id_persona IS 'IDENTIFICADOR UNICO DE LA PERSONA';
COMMENT ON COLUMN tecabix_sce.contacto.id_tipo IS 'TIPO DE CONTACTO, CATALOGO_TIPO = TIPO_CONTACTO';
COMMENT ON COLUMN tecabix_sce.contacto.valor IS 'VALOR DEL CONTACTO';

ALTER TABLE tecabix_sce.contacto ADD CONSTRAINT fk_contacto_id_persona FOREIGN KEY (id_persona)
REFERENCES tecabix_sce.persona(id_persona) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.contacto ADD CONSTRAINT fk_contacto_id_tipo FOREIGN KEY (id_tipo)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;



CREATE SEQUENCE tecabix_sce.banco_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.banco_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.banco(
	id_banco integer NOT NULL DEFAULT nextval('tecabix_sce.banco_seq'::regclass),
    clave_banco character varying(4) NOT NULL,
    nombre character varying(35) NOT NULL,
    razon_social character varying(120) NOT NULL,
    id_usuario_modificado bigint NOT NULL,
	fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
	id_estatus integer NOT NULL,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_banco_id_banco PRIMARY KEY (id_banco),
CONSTRAINT uq_banco_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.banco IS 'BANCO';
COMMENT ON COLUMN tecabix_sce.banco.id_banco IS 'IDENTIFICADOR UNICO DEL BANCO';
COMMENT ON COLUMN tecabix_sce.banco.clave_banco IS 'CLAVE DEL BANCO';
COMMENT ON COLUMN tecabix_sce.banco.nombre IS 'NOMBRE DEL BANCO';
COMMENT ON COLUMN tecabix_sce.banco.razon_social IS 'RAZON SOCIAL DEL BANCO';
COMMENT ON COLUMN tecabix_sce.banco.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.banco.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.banco.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';

ALTER TABLE tecabix_sce.banco ADD CONSTRAINT fk_banco_id_estatus FOREIGN KEY (id_estatus)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.banco ADD CONSTRAINT fk_banco_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

CREATE INDEX indx_banco_nombre
    ON tecabix_sce.banco USING btree
    (nombre COLLATE pg_catalog."default")
    TABLESPACE pg_default;

CREATE SEQUENCE tecabix_sce.departamento_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.departamento_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.departamento(
	id_departamento bigint NOT NULL DEFAULT nextval('tecabix_sce.departamento_seq'::regclass),
	nombre character varying(35) NOT NULL,
	descripcion character varying(300) NOT NULL,
	id_empresa bigint NOT NULL,
	id_usuario_modificado bigint NOT NULL,
	fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
	id_estatus integer NOT NULL,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_departamento_id_departamento PRIMARY KEY (id_departamento),
CONSTRAINT uq_departamento_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.departamento IS 'DEPARTAMENTO DE LA EMPRESA';
COMMENT ON COLUMN tecabix_sce.departamento.id_departamento IS 'IDENTIFICADOR UNICO DEL DEPARTAMENTO';
COMMENT ON COLUMN tecabix_sce.departamento.nombre IS 'NOMBRE DEL DEPARTAMENTO';
COMMENT ON COLUMN tecabix_sce.departamento.descripcion IS 'DESCRIPCION DEL DEPARTAMENTO';
COMMENT ON COLUMN tecabix_sce.departamento.id_empresa IS 'EMPRESA AL QUE PERTENECE EL DEPARTAMENTO';
COMMENT ON COLUMN tecabix_sce.departamento.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.departamento.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.departamento.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';

ALTER TABLE tecabix_sce.departamento ADD CONSTRAINT fk_departamento_id_estatus FOREIGN KEY (id_estatus)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.departamento ADD CONSTRAINT fk_departamento_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.departamento ADD CONSTRAINT fk_departamento_id_empresa FOREIGN KEY (id_empresa)
REFERENCES tecabix_sce.persona_moral(id_persona_moral) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

CREATE INDEX indx_departamento_nombre
    ON tecabix_sce.departamento USING btree
    (nombre COLLATE pg_catalog."default")
    TABLESPACE pg_default;


CREATE SEQUENCE tecabix_sce.puesto_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.puesto_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.puesto(
	id_puesto bigint NOT NULL DEFAULT nextval('tecabix_sce.puesto_seq'::regclass),
	nombre character varying(35) NOT NULL,
	descripcion character varying(300) NOT NULL,
	id_departamento bigint NOT NULL,
	id_usuario_modificado bigint NOT NULL,
	fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
	id_estatus integer NOT NULL,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_puesto_id_puesto PRIMARY KEY (id_puesto),
CONSTRAINT uq_puesto_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.puesto IS 'PUESTO DEL TRABAJADOR';
COMMENT ON COLUMN tecabix_sce.puesto.id_puesto IS 'IDENTIFICADOR UNICO DEL PUESTO';
COMMENT ON COLUMN tecabix_sce.puesto.nombre IS 'NOMBRE DEL PUESTO';
COMMENT ON COLUMN tecabix_sce.puesto.descripcion IS 'DESCRIPCION DEL PUESTO';
COMMENT ON COLUMN tecabix_sce.puesto.id_departamento IS 'DEPARTAMENTO AL QUE PERTENECE EL PUESTO';
COMMENT ON COLUMN tecabix_sce.puesto.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.puesto.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.puesto.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';

ALTER TABLE tecabix_sce.puesto ADD CONSTRAINT fk_puesto_id_estatus FOREIGN KEY (id_estatus)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.puesto ADD CONSTRAINT fk_puesto_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.puesto ADD CONSTRAINT fk_puesto_id_departamento FOREIGN KEY (id_departamento)
REFERENCES tecabix_sce.departamento(id_departamento) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

CREATE INDEX indx_puesto_nombre
    ON tecabix_sce.puesto USING btree
    (nombre COLLATE pg_catalog."default")
    TABLESPACE pg_default;



CREATE SEQUENCE tecabix_sce.trabajador_seq
    INCREMENT 1
    START 1000432198763876
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.trabajador_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.trabajador(
	id_trabajador bigint NOT NULL DEFAULT nextval('tecabix_sce.trabajador_seq'::regclass),
    curp character varying(19),
	id_persona_fisica bigint NOT NULL,
	id_puesto bigint NOT NULL,
    id_plantel bigint,
	id_jefe bigint,
	url_imagen character varying(200) ,
	id_empresa bigint NOT NULL,
	id_usuario_modificado bigint NOT NULL,
	fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
	id_estatus integer NOT NULL,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_trabajador_id_trabajador PRIMARY KEY (id_trabajador),
CONSTRAINT uq_trabajador_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.trabajador IS 'TRABAJADOR';
COMMENT ON COLUMN tecabix_sce.trabajador.id_trabajador IS 'IDENTIFICADOR DEL TRABAJADOR';
COMMENT ON COLUMN tecabix_sce.trabajador.curp IS 'CLAVE ÚNICA DE REGISTRO DE POBLACIÓN';
COMMENT ON COLUMN tecabix_sce.trabajador.id_persona_fisica IS 'LLAVE FORANEA DE LA PERSONA';
COMMENT ON COLUMN tecabix_sce.trabajador.id_puesto IS 'LLAVE FORANEA DEL PUESTO';
COMMENT ON COLUMN tecabix_sce.trabajador.id_plantel IS 'LLAVE FORANEA DEL PLANTEL';
COMMENT ON COLUMN tecabix_sce.trabajador.id_jefe IS 'LLAVE FORANEA DEL JEFE DIRECTO';
COMMENT ON COLUMN tecabix_sce.trabajador.url_imagen IS 'URL DE LA IMAGEN DE PERFIL DEL TRABAJADOR';
COMMENT ON COLUMN tecabix_sce.trabajador.id_empresa IS 'LLAVE FORANEA DE LA EMPRESA AL QUE TRABAJA';
COMMENT ON COLUMN tecabix_sce.trabajador.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.trabajador.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.trabajador.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';

ALTER TABLE tecabix_sce.trabajador ADD CONSTRAINT fk_trabajador_id_estatus FOREIGN KEY (id_estatus)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.trabajador ADD CONSTRAINT fk_trabajador_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.trabajador ADD CONSTRAINT fk_trabajador_id_puesto FOREIGN KEY (id_puesto)
REFERENCES tecabix_sce.puesto(id_puesto) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.trabajador ADD CONSTRAINT fk_trabajador_id_empresa FOREIGN KEY (id_empresa)
REFERENCES tecabix_sce.persona_moral(id_persona_moral) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.trabajador ADD CONSTRAINT fk_trabajador_id_jefe FOREIGN KEY (id_jefe)
REFERENCES tecabix_sce.trabajador(id_trabajador) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.trabajador ADD CONSTRAINT fk_trabajador_id_persona_fisica FOREIGN KEY (id_persona_fisica)
REFERENCES tecabix_sce.persona_fisica(id_persona_fisica) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

CREATE INDEX indx_trabajador_curp
    ON tecabix_sce.trabajador USING btree
    (curp COLLATE pg_catalog."default")
    TABLESPACE pg_default;



CREATE SEQUENCE tecabix_sce.plantel_seq
    INCREMENT 1
    START 2340147048306470
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.plantel_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.plantel(
	id_plantel bigint NOT NULL DEFAULT nextval('tecabix_sce.plantel_seq'::regclass),
	nombre character varying(200) ,
	id_gerente bigint NOT NULL,
	id_direccion bigint NOT NULL,
	id_empresa bigint NOT NULL,
	id_usuario_modificado bigint NOT NULL,
	fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
	id_estatus integer NOT NULL,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_plantel_id_plantel PRIMARY KEY (id_plantel),
CONSTRAINT uq_plantel_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.plantel IS 'plantel';
COMMENT ON COLUMN tecabix_sce.plantel.id_plantel IS 'IDENTIFICADOR UNICO DE LA PLANTE';
COMMENT ON COLUMN tecabix_sce.plantel.nombre IS 'NOMBRE DE LA PLANTEL';
COMMENT ON COLUMN tecabix_sce.plantel.id_gerente IS 'GERENTE';
COMMENT ON COLUMN tecabix_sce.plantel.id_direccion IS 'DIRECCION';
COMMENT ON COLUMN tecabix_sce.plantel.id_empresa IS 'EMPRESA AL QUE PERTENECE LA PLANTEL';
COMMENT ON COLUMN tecabix_sce.plantel.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.plantel.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.plantel.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';


ALTER TABLE tecabix_sce.plantel ADD CONSTRAINT fk_trabajador_id_estatus FOREIGN KEY (id_estatus)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.plantel ADD CONSTRAINT fk_trabajador_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.plantel ADD CONSTRAINT fk_plantel_id_empresa FOREIGN KEY (id_empresa)
REFERENCES tecabix_sce.persona_moral(id_persona_moral) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.plantel ADD CONSTRAINT fk_plantel_id_gerente FOREIGN KEY (id_gerente)
REFERENCES tecabix_sce.trabajador(id_trabajador) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.plantel ADD CONSTRAINT fk_plantel_id_direccion FOREIGN KEY (id_direccion)
REFERENCES tecabix_sce.direccion(id_direccion) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.trabajador ADD CONSTRAINT fk_trabajador_id_plantel FOREIGN KEY (id_plantel)
REFERENCES tecabix_sce.plantel(id_plantel) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

CREATE INDEX indx_plantel_nombre
    ON tecabix_sce.plantel USING btree
    (nombre COLLATE pg_catalog."default")
    TABLESPACE pg_default;



CREATE SEQUENCE tecabix_sce.configuracion_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.configuracion_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.configuracion(
	id_configuracion bigint NOT NULL DEFAULT nextval('tecabix_sce.configuracion_seq'::regclass),
    id_tipo integer NOT NULL,
	valor character varying(500) NOT NULL,
	id_usuario_modificado bigint NOT NULL,
	fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
	id_estatus integer NOT NULL,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_configuracion_id_configuracion PRIMARY KEY (id_configuracion),
CONSTRAINT uq_configuracion_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.configuracion IS 'CONFIGURACION';
COMMENT ON COLUMN tecabix_sce.configuracion.id_configuracion IS 'IDENTIFICADOR UNICO DE CONFIGURACION';
COMMENT ON COLUMN tecabix_sce.configuracion.id_tipo IS 'TIPO DE LA CONFIGURACION, CATALOGO_TIPO = CONFIGURACION_<TABLA>';
COMMENT ON COLUMN tecabix_sce.configuracion.valor IS 'VALOR DE LA CONFIGURACION';
COMMENT ON COLUMN tecabix_sce.configuracion.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.configuracion.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.configuracion.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';

ALTER TABLE tecabix_sce.configuracion ADD CONSTRAINT fk_configuracion_id_tipo FOREIGN KEY (id_tipo)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.configuracion ADD CONSTRAINT fk_trabajador_id_estatus FOREIGN KEY (id_estatus)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.configuracion ADD CONSTRAINT fk_trabajador_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;



CREATE SEQUENCE tecabix_sce.plan_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.plan_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.plan(
	id_plan integer NOT NULL DEFAULT nextval('tecabix_sce.plan_seq'::regclass),
	nombre character varying(50) NOT NULL,
	descripcion character varying(500) NOT NULL,
	precio real NOT NULL,
    id_usuario_modificado bigint NOT NULL,
	fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
	id_estatus integer NOT NULL,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_plan_id_plan PRIMARY KEY (id_plan),
CONSTRAINT uq_plan_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.plan IS 'PLAN DE SUSCRIPCION';
COMMENT ON COLUMN tecabix_sce.plan.id_plan IS 'IDENTIFICADOR UNICO DEL PLAN';
COMMENT ON COLUMN tecabix_sce.plan.nombre IS 'NOMBRE DEL PLAN';
COMMENT ON COLUMN tecabix_sce.plan.descripcion IS 'DESCRIPCION DEL PLAN';
COMMENT ON COLUMN tecabix_sce.plan.precio IS 'PRECIO DEL PLAN';
COMMENT ON COLUMN tecabix_sce.plan.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.plan.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.plan.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';

ALTER TABLE tecabix_sce.plan ADD CONSTRAINT fk_plan_id_estatus FOREIGN KEY (id_estatus)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.plan ADD CONSTRAINT fk_plan_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;


CREATE INDEX indx_plan_nombre
    ON tecabix_sce.plan USING btree
    (nombre COLLATE pg_catalog."default")
    TABLESPACE pg_default;



CREATE SEQUENCE tecabix_sce.servicio_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.servicio_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.servicio(
	id_servicio integer NOT NULL DEFAULT nextval('tecabix_sce.servicio_seq'::regclass),
    id_plan integer NOT NULL,
	nombre character varying(50) NOT NULL,
	descripcion character varying(500) NOT NULL,
    id_tipo integer NOT NULL,
    peticiones integer NOT NULL DEFAULT 0,
    numero_licencias integer NOT NULL,
    id_usuario_modificado bigint NOT NULL,
	fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
	id_estatus integer NOT NULL,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_servicio_id_servicio PRIMARY KEY (id_servicio),
CONSTRAINT uq_servicio_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.servicio IS 'SERVICIOS QUE BRINDA EL SISTEMA';
COMMENT ON COLUMN tecabix_sce.servicio.id_servicio IS 'IDENTIFICADOR UNICO DEL SERVICIO';
COMMENT ON COLUMN tecabix_sce.servicio.id_plan IS 'IDENTIFICADOR UNICO DEL PLAN';
COMMENT ON COLUMN tecabix_sce.servicio.nombre IS 'NOMBRE DEL SERVICIO';
COMMENT ON COLUMN tecabix_sce.servicio.descripcion IS 'DESCRIPCION DEL SERVICIO';
COMMENT ON COLUMN tecabix_sce.servicio.id_tipo IS 'TIPO DE SERVICIO, CATALOGO_TIPO = TIPO_DE_SERVICIO';
COMMENT ON COLUMN tecabix_sce.servicio.peticiones IS 'PETICIONES POR DIA';
COMMENT ON COLUMN tecabix_sce.servicio.numero_licencias IS 'NUMERO DE LICENCIAS';
COMMENT ON COLUMN tecabix_sce.servicio.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.servicio.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.servicio.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';

ALTER TABLE tecabix_sce.servicio ADD CONSTRAINT fk_servicio_id_estatus FOREIGN KEY (id_estatus)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.servicio ADD CONSTRAINT fk_servicio_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.servicio ADD CONSTRAINT fk_servicio_id_tipo FOREIGN KEY (id_tipo)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.servicio ADD CONSTRAINT fk_servicio_id_plan FOREIGN KEY (id_plan)
REFERENCES tecabix_sce.plan(id_plan) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

CREATE INDEX indx_servicio_nombre
    ON tecabix_sce.servicio USING btree
    (nombre COLLATE pg_catalog."default")
    TABLESPACE pg_default;


CREATE SEQUENCE tecabix_sce.plan_configuracion_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.plan_configuracion_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.plan_configuracion(
	id_plan_configuracion integer NOT NULL DEFAULT nextval('tecabix_sce.plan_configuracion_seq'::regclass),
	id_plan integer NOT NULL,
	id_configuracion bigint NOT NULL,
CONSTRAINT pk_plan_configuracion_id_plan_configuracion PRIMARY KEY (id_plan_configuracion)
);
COMMENT ON TABLE tecabix_sce.plan_configuracion IS 'RELACION DE PLAN Y CONFIGURACION';
COMMENT ON COLUMN tecabix_sce.plan_configuracion.id_plan_configuracion IS 'IDENTIFICADOR UNICO DEL CONFIGURACION DEL PLAN';
COMMENT ON COLUMN tecabix_sce.plan_configuracion.id_plan IS 'LLAVE FORANEA DEL PLAN';
COMMENT ON COLUMN tecabix_sce.plan_configuracion.id_configuracion IS 'LLAVE FORANEA DE LA CONFIGURACION';

ALTER TABLE tecabix_sce.plan_configuracion ADD CONSTRAINT fk_plan_configuracion_id_plan FOREIGN KEY (id_plan)
REFERENCES tecabix_sce.plan(id_plan) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.plan_configuracion ADD CONSTRAINT fk_plan_configuracion_id_configuracion FOREIGN KEY (id_configuracion)
REFERENCES tecabix_sce.configuracion(id_configuracion) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;



CREATE SEQUENCE tecabix_sce.persona_moral_configuracion_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.persona_moral_configuracion_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.persona_moral_configuracion(
	id_persona_moral_configuracion bigint NOT NULL DEFAULT nextval('tecabix_sce.persona_moral_configuracion_seq'::regclass),
	id_persona_moral bigint NOT NULL,
	id_configuracion bigint NOT NULL,
CONSTRAINT pk_persona_moral_configuracion_id_persona_moral_configuracion PRIMARY KEY (id_persona_moral_configuracion)
);
COMMENT ON TABLE tecabix_sce.persona_moral_configuracion IS 'RELACION DE LA EMPRESA Y LA CONFIGURACION';
COMMENT ON COLUMN tecabix_sce.persona_moral_configuracion.id_persona_moral_configuracion IS 'IDENTIFICADOR UNICO DEL CONFIGURACION DE LA EMPRESA';
COMMENT ON COLUMN tecabix_sce.persona_moral_configuracion.id_persona_moral IS 'LLAVE FORANEA DEL LA EMPRESA';
COMMENT ON COLUMN tecabix_sce.persona_moral_configuracion.id_configuracion IS 'LLAVE FORANEA DE LA CONFIGURACION';

ALTER TABLE tecabix_sce.persona_moral_configuracion ADD CONSTRAINT fk_persona_moral_configuracion_id_persona_moral FOREIGN KEY (id_persona_moral)
REFERENCES tecabix_sce.plan(id_plan) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.persona_moral_configuracion ADD CONSTRAINT fk_persona_moral_configuracion_id_configuracion FOREIGN KEY (id_configuracion)
REFERENCES tecabix_sce.configuracion(id_configuracion) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;


CREATE SEQUENCE tecabix_sce.suscripcion_seq
    INCREMENT 1
    START 2340147048306470
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.suscripcion_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.suscripcion(
	id_suscripcion bigint NOT NULL DEFAULT nextval('tecabix_sce.suscripcion_seq'::regclass),
	id_empresa bigint NOT NULL UNIQUE,
    id_plan integer NOT NULL,
	vencimiento date NOT NULL DEFAULT now (),
	id_usuario_modificado bigint NOT NULL,
	fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
	id_estatus integer NOT NULL,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_suscripcion_id_suscripcion PRIMARY KEY (id_suscripcion),
CONSTRAINT uq_suscripcion_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.suscripcion IS 'SUSCRIPCION';
COMMENT ON COLUMN tecabix_sce.suscripcion.id_suscripcion IS 'IDENTIFICADOR UNICO DE LA SUSCRIPCION';
COMMENT ON COLUMN tecabix_sce.suscripcion.id_plan IS 'LLAVE FORANEA DEL PLAN';
COMMENT ON COLUMN tecabix_sce.suscripcion.id_empresa IS 'EMPRESA AL QUE PERTENECE LA SUSCRIPCION';
COMMENT ON COLUMN tecabix_sce.suscripcion.vencimiento IS 'VENCIMIENTO DE LA SUSCRIPCION';
COMMENT ON COLUMN tecabix_sce.suscripcion.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.suscripcion.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.suscripcion.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';


ALTER TABLE tecabix_sce.suscripcion ADD CONSTRAINT fk_suscripcion_id_estatus FOREIGN KEY (id_estatus)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.suscripcion ADD CONSTRAINT fk_suscripcion_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.suscripcion ADD CONSTRAINT fk_suscripcion_id_empresa FOREIGN KEY (id_empresa)
REFERENCES tecabix_sce.persona_moral(id_persona_moral) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.suscripcion ADD CONSTRAINT fk_suscripcion_id_plan FOREIGN KEY (id_plan)
REFERENCES tecabix_sce.plan(id_plan) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;



CREATE SEQUENCE tecabix_sce.licencia_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.licencia_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.licencia(
	id_licencia bigint NOT NULL DEFAULT nextval('tecabix_sce.licencia_seq'::regclass),
	nombre character varying(40) NOT NULL,
	id_servicio integer NOT NULL,
	id_plantel bigint NOT NULL,
	id_usuario_modificado bigint NOT NULL,
	fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
	id_estatus integer NOT NULL,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_licencia_id_licencia PRIMARY KEY (id_licencia),
CONSTRAINT uq_licencia_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.licencia IS 'LICENCIAS DE CONEXION';
COMMENT ON COLUMN tecabix_sce.licencia.id_licencia IS 'IDENTIFICADOR UNICO DE LA LICENCIA';
COMMENT ON COLUMN tecabix_sce.licencia.nombre IS 'NOMBRE DEL EQUIPO QUE SE CONECTA';
COMMENT ON COLUMN tecabix_sce.licencia.id_servicio IS 'LLAVE FORANEA DEL SERVICIO';
COMMENT ON COLUMN tecabix_sce.licencia.id_plantel IS 'LLAVE FORANEA DE LA PLANTEL';
COMMENT ON COLUMN tecabix_sce.licencia.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.licencia.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.licencia.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';


ALTER TABLE tecabix_sce.licencia ADD CONSTRAINT fk_licencia_id_estatus FOREIGN KEY (id_estatus)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.licencia ADD CONSTRAINT fk_licencia_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.licencia ADD CONSTRAINT fk_licencia_id_plantel FOREIGN KEY (id_plantel)
REFERENCES tecabix_sce.plantel(id_plantel) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.licencia ADD CONSTRAINT fk_licencia_id_servicio FOREIGN KEY (id_servicio)
REFERENCES tecabix_sce.servicio(id_servicio) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

CREATE INDEX indx_licencia_nombre
    ON tecabix_sce.licencia USING btree
    (nombre COLLATE pg_catalog."default")
    TABLESPACE pg_default;




CREATE SEQUENCE tecabix_sce.sesion_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.sesion_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.sesion(
	id_sesion bigint NOT NULL DEFAULT nextval('tecabix_sce.sesion_seq'::regclass),
    id_usuario bigint NOT NULL,
	vencimiento timestamp without time zone NOT NULL DEFAULT now (),
	id_licencia bigint NOT NULL,
    peticiones_restantes integer NOT NULL DEFAULT 0,
	id_usuario_modificado bigint NOT NULL,
	fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
	id_estatus integer NOT NULL,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_sesion_id_sesion PRIMARY KEY (id_sesion),
CONSTRAINT uq_sesion_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.sesion IS 'SESIOB DE CONEXION';
COMMENT ON COLUMN tecabix_sce.sesion.id_sesion IS 'IDENTIFICADOR UNICO DE LA SESION';
COMMENT ON COLUMN tecabix_sce.sesion.id_usuario IS 'USUARIO QUE TIENE ACCESO A LA SESION';
COMMENT ON COLUMN tecabix_sce.sesion.vencimiento IS 'FECHA DE VENCIMIENTO DE LA SESION';
COMMENT ON COLUMN tecabix_sce.sesion.id_licencia IS 'LICENCIA QUE AUTORIZO LA SESION';
COMMENT ON COLUMN tecabix_sce.sesion.peticiones_restantes IS 'NUMERO DE PETICIONES RESTANTES ANTES DE INVALIDAR EL TOKEN';
COMMENT ON COLUMN tecabix_sce.sesion.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.sesion.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.sesion.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';

ALTER TABLE tecabix_sce.sesion ADD CONSTRAINT fk_sesion_id_estatus FOREIGN KEY (id_estatus)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.sesion ADD CONSTRAINT fk_sesion_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.sesion ADD CONSTRAINT fk_sesion_id_usuario FOREIGN KEY (id_usuario)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.sesion ADD CONSTRAINT fk_sesion_id_licencia FOREIGN KEY (id_licencia)
REFERENCES tecabix_sce.licencia(id_licencia) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;


CREATE SEQUENCE tecabix_sce.soporte_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.soporte_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.soporte(
	id_soporte bigint NOT NULL DEFAULT nextval('tecabix_sce.soporte_seq'::regclass),
    id_empresa bigint NOT NULL,
    id_tipo integer NOT NULL,
	asunto character varying(45) NOT NULL,
	descripcion character varying(500) NOT NULL,
	id_usuario_modificado bigint NOT NULL,
	fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
	id_estatus integer NOT NULL,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_soporte_id_soporte PRIMARY KEY (id_soporte),
CONSTRAINT uq_soporte_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.soporte IS 'SOPORTE';
COMMENT ON COLUMN tecabix_sce.soporte.id_soporte IS 'IDENTIFICADOR UNICO DEL SOPORTE';
COMMENT ON COLUMN tecabix_sce.soporte.id_empresa IS 'INSTITUCION QUE BRINDA EL SOPORTE DENTRO DE LA PLATAFORMA';
COMMENT ON COLUMN tecabix_sce.soporte.id_tipo IS 'TIPO DE SOPORTE, CATALOGO_TIPO = TIPO_SOPORTE';
COMMENT ON COLUMN tecabix_sce.soporte.descripcion IS 'DESCRIPCION DEL CATALOGO';
COMMENT ON COLUMN tecabix_sce.soporte.asunto IS 'ASUNTO DEL SOPORTE';
COMMENT ON COLUMN tecabix_sce.soporte.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.soporte.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.soporte.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';

ALTER TABLE tecabix_sce.soporte ADD CONSTRAINT fk_soporte_id_estatus FOREIGN KEY (id_estatus)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.soporte ADD CONSTRAINT fk_soporte_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.soporte ADD CONSTRAINT fk_soporte_id_tipo FOREIGN KEY (id_tipo)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.soporte ADD CONSTRAINT fk_soporte_id_empresa FOREIGN KEY (id_empresa)
REFERENCES tecabix_sce.persona_moral(id_persona_moral) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

CREATE INDEX indx_soporte_asunto
    ON tecabix_sce.soporte USING btree
    (asunto COLLATE pg_catalog."default")
    TABLESPACE pg_default;



CREATE SEQUENCE tecabix_sce.soporte_msj_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.soporte_msj_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.soporte_msj(
	id_soporte_msj bigint NOT NULL DEFAULT nextval('tecabix_sce.soporte_msj_seq'::regclass),
    id_soporte bigint NOT NULL,
	contenido character varying(500) NOT NULL,
	id_usuario_modificado bigint NOT NULL,
	fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
	id_estatus integer NOT NULL,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_soporte_msj_id_soporte_msj PRIMARY KEY (id_soporte_msj),
CONSTRAINT uq_soporte_msj_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.soporte_msj IS 'MENSAJE DE SOPORTE';
COMMENT ON COLUMN tecabix_sce.soporte_msj.id_soporte_msj IS 'IDENTIFICADOR UNICO DEL MENSAJE';
COMMENT ON COLUMN tecabix_sce.soporte_msj.id_soporte IS 'INSTITUCION DEL SOPORTE';
COMMENT ON COLUMN tecabix_sce.soporte_msj.contenido IS 'CONTENIDO DEL MENSAJE';
COMMENT ON COLUMN tecabix_sce.soporte_msj.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.soporte_msj.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.soporte_msj.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';

ALTER TABLE tecabix_sce.soporte_msj ADD CONSTRAINT fk_soporte_msj_id_estatus FOREIGN KEY (id_estatus)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.soporte_msj ADD CONSTRAINT fk_soporte_msj_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.soporte_msj ADD CONSTRAINT fk_soporte_msj_id_soporte FOREIGN KEY (id_soporte)
REFERENCES tecabix_sce.soporte(id_soporte) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;



CREATE SEQUENCE tecabix_sce.correo_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.correo_seq
    OWNER TO postgres;


CREATE TABLE tecabix_sce.correo(
    id_correo bigint NOT NULL DEFAULT nextval('tecabix_sce.correo_seq'::regclass),
    id_persona bigint NOT NULL,
    remitente character varying(35) NOT NULL,
    psw character varying(50) NOT NULL,
    smtp_servidor character varying(20) NOT NULL,
    smtp_port character varying(5) NOT NULL,
    id_tipo integer NOT NULL,
    vencimiento date NOT NULL DEFAULT now (),
    peticiones integer NOT NULL DEFAULT 450, 
    id_usuario_modificado bigint NOT NULL,
    fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
    id_estatus integer NOT NULL,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_correo_id_correo PRIMARY KEY (id_correo),
CONSTRAINT uq_correo_remitente UNIQUE (remitente),
CONSTRAINT uq_correo_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.correo IS 'CREDENCIALES DE EMAIL PARA CORREOS MASIVOS';
COMMENT ON COLUMN tecabix_sce.correo.id_correo IS 'IDENTIFICADOR UNICO DEL CORREO';
COMMENT ON COLUMN tecabix_sce.correo.id_persona IS 'IDENTIFICADOR UNICO DE LA PERSONA DEL CORREO';
COMMENT ON COLUMN tecabix_sce.correo.remitente IS 'CORREO';
COMMENT ON COLUMN tecabix_sce.correo.psw IS 'CONTRASEÑA DEL CORREO';
COMMENT ON COLUMN tecabix_sce.correo.smtp_servidor IS 'SERVIDOR DEL CORREO';
COMMENT ON COLUMN tecabix_sce.correo.id_tipo IS 'TIPO DE MENSAJES QUE SERAN ENVIADO, CATALOGO_TIPO = TIPO_DE_CORREO';
COMMENT ON COLUMN tecabix_sce.correo.vencimiento IS 'FECHA EN QUE ES VALIDO EL NUMERO DE PETICIONES RESTANTE';
COMMENT ON COLUMN tecabix_sce.correo.peticiones IS 'NUMERO DE PETICIONES QUE SE PUEDEN HACER ACTUALMENTE';
COMMENT ON COLUMN tecabix_sce.correo.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.correo.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.correo.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';


ALTER TABLE tecabix_sce.correo ADD CONSTRAINT fk_correo_id_estatus FOREIGN KEY (id_estatus)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.correo ADD CONSTRAINT fk_correo_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.correo ADD CONSTRAINT fk_correo_id_tipo FOREIGN KEY (id_tipo)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.correo ADD CONSTRAINT fk_correo_id_persona FOREIGN KEY (id_persona)
REFERENCES tecabix_sce.persona(id_persona) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

CREATE INDEX indx_correo_remitente
    ON tecabix_sce.correo USING btree
    (remitente COLLATE pg_catalog."default")
    TABLESPACE pg_default;



CREATE SEQUENCE tecabix_sce.correo_msj_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.correo_msj_seq
    OWNER TO postgres;


CREATE TABLE tecabix_sce.correo_msj(
    id_correo_msj bigint NOT NULL DEFAULT nextval('tecabix_sce.correo_msj_seq'::regclass),
    id_correo bigint NOT NULL,
    destinatario character varying(50) NOT NULL,
    asunto character varying(35) NOT NULL,
    mensaje character varying(500) NOT NULL,
    id_tipo integer NOT NULL,
    programado timestamp without time zone NOT NULL DEFAULT now (),
    id_usuario_modificado bigint NOT NULL,
    fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
    id_estatus integer NOT NULL,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_correo_msj_id_correo_msj PRIMARY KEY (id_correo_msj),
CONSTRAINT uq_correo_msj_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.correo_msj IS 'MENSAJE DEL CORREO';
COMMENT ON COLUMN tecabix_sce.correo_msj.id_correo_msj IS 'IDENTIFICADOR UNICO DEL MENSAJE DEL CORREO';
COMMENT ON COLUMN tecabix_sce.correo_msj.id_correo IS 'IDENTIFICADOR UNICO DEL REMITENTE';
COMMENT ON COLUMN tecabix_sce.correo_msj.destinatario IS 'DESTINATARIO';
COMMENT ON COLUMN tecabix_sce.correo_msj.asunto IS 'ASUNTO';
COMMENT ON COLUMN tecabix_sce.correo_msj.mensaje IS 'CUERRPO DEL CORREO';
COMMENT ON COLUMN tecabix_sce.correo_msj.id_tipo IS 'TIPO DE MENSAJES QUE SERAN ENVIADO, CATALOGO_TIPO = TIPO_DE_CORREO';
COMMENT ON COLUMN tecabix_sce.correo_msj.programado IS 'FECHA QUE ESTA PROGRAMADO EL ENVIO DEL MENSAJE';
COMMENT ON COLUMN tecabix_sce.correo_msj.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.correo_msj.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.correo_msj.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';


ALTER TABLE tecabix_sce.correo_msj ADD CONSTRAINT fk_correo_msj_id_estatus FOREIGN KEY (id_estatus)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.correo_msj ADD CONSTRAINT fk_correo_msj_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.correo_msj ADD CONSTRAINT fk_correo_msj_id_tipo FOREIGN KEY (id_tipo)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.correo_msj ADD CONSTRAINT fk_correo_msj_id_correo FOREIGN KEY (id_correo)
REFERENCES tecabix_sce.correo(id_correo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;



CREATE SEQUENCE tecabix_sce.correo_msj_item_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.correo_msj_item_seq
    OWNER TO postgres;


CREATE TABLE tecabix_sce.correo_msj_item(
    id_correo_msj_item bigint NOT NULL DEFAULT nextval('tecabix_sce.correo_msj_item_seq'::regclass),
    id_correo_msj bigint NOT NULL,
    id_tipo integer NOT NULL,
    dato character varying(200) NOT NULL,
    id_usuario_modificado bigint NOT NULL,
    fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
    id_estatus integer NOT NULL,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_correo_msj_item_id_correo_msj PRIMARY KEY (id_correo_msj),
CONSTRAINT uq_correo_msj_item_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.correo_msj_item IS 'ELEMENTO DEL CORREOO';
COMMENT ON COLUMN tecabix_sce.correo_msj_item.id_correo_msj_item IS 'IDENTIFICADOR UNICO DEL ITEM MENSAJE DEL CORREO';
COMMENT ON COLUMN tecabix_sce.correo_msj_item.id_correo_msj IS 'IDENTIFICADOR UNICO DEL REMITENTE';
COMMENT ON COLUMN tecabix_sce.correo_msj_item.dato IS 'VALOR DEL ITEM';
COMMENT ON COLUMN tecabix_sce.correo_msj_item.id_tipo IS 'TIPO DE ELEMNTO DEL MSJ, CATALOGO_TIPO = TIPO_ELEMENTO_CORREO';
COMMENT ON COLUMN tecabix_sce.correo_msj_item.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.correo_msj_item.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.correo_msj_item.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';


ALTER TABLE tecabix_sce.correo_msj_item ADD CONSTRAINT fk_correo_msj_item_id_estatus FOREIGN KEY (id_estatus)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.correo_msj_item ADD CONSTRAINT fk_correo_msj_item_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.correo_msj_item ADD CONSTRAINT fk_correo_msj_item_id_tipo FOREIGN KEY (id_tipo)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.correo_msj_item ADD CONSTRAINT fk_correo_msj_item_id_correo_msj FOREIGN KEY (id_correo_msj)
REFERENCES tecabix_sce.correo_msj(id_correo_msj) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;





CREATE SEQUENCE tecabix_sce.carrera_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.carrera_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.carrera(
	id_carrera bigint NOT NULL DEFAULT nextval('tecabix_sce.carrera_seq'::regclass),
	nombre character varying(45) NOT NULL,
	descripcion character varying(500) NOT NULL,
    id_facultad integer,
    id_empresa bigint NOT NULL,
    id_usuario_modificado bigint NOT NULL,
	fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
	id_estatus integer NOT NULL,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_carrera_id_carrera PRIMARY KEY (id_carrera),
CONSTRAINT uq_carrera_msj_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.carrera IS 'CARRERA';
COMMENT ON COLUMN tecabix_sce.carrera.id_carrera IS 'IDENTIFICADOR UNICO DE LA CARRERA';
COMMENT ON COLUMN tecabix_sce.carrera.nombre IS 'NOMBRE DE LA CARRERA';
COMMENT ON COLUMN tecabix_sce.carrera.descripcion IS 'DESCRIPCION DEL CATALOGO';
COMMENT ON COLUMN tecabix_sce.carrera.id_facultad IS 'FACULTAD DE LA CARRERA, CATALOGO_TIPO = FACULTAD';
COMMENT ON COLUMN tecabix_sce.carrera.id_empresa IS 'EMPRESA AL QUE PERTENECE LA CARRERA';
COMMENT ON COLUMN tecabix_sce.carrera.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.carrera.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.carrera.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';

ALTER TABLE tecabix_sce.carrera ADD CONSTRAINT fk_carrera_id_estatus FOREIGN KEY (id_estatus)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.carrera ADD CONSTRAINT fk_carrera_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.carrera ADD CONSTRAINT fk_carrera_id_facultad FOREIGN KEY (id_facultad)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.carrera ADD CONSTRAINT fk_carrera_id_empresa FOREIGN KEY (id_empresa)
REFERENCES tecabix_sce.persona_moral(id_persona_moral) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

CREATE INDEX indx_carrera_nombre
    ON tecabix_sce.carrera USING btree
    (nombre COLLATE pg_catalog."default")
    TABLESPACE pg_default;



CREATE SEQUENCE tecabix_sce.plan_estudio_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.plan_estudio_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.plan_estudio(
	id_plan_estudio bigint NOT NULL DEFAULT nextval('tecabix_sce.plan_estudio_seq'::regclass),
	id_carrera bigint NOT NULL,
    nombre character varying(45) NOT NULL,
	descripcion character varying(500) NOT NULL,
    id_tipo integer NOT NULL,
    inicio date NOT NULL DEFAULT now (),
    fin date NOT NULL DEFAULT now (),
    id_usuario_modificado bigint NOT NULL,
	fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
	id_estatus integer NOT NULL,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_plan_estudio_plan_estudio PRIMARY KEY (id_plan_estudio),
CONSTRAINT uq_plan_estudio_msj_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.plan_estudio IS 'PLAN DE ESTUDIO';
COMMENT ON COLUMN tecabix_sce.plan_estudio.id_plan_estudio IS 'IDENTIFICADOR UNICO DEL PLAN DE ESTUDIO';
COMMENT ON COLUMN tecabix_sce.plan_estudio.id_carrera IS 'IDENTIFICADOR UNICO DE LA CARRERA';
COMMENT ON COLUMN tecabix_sce.plan_estudio.nombre IS 'NOMBRE DEL PLAN DE ESTUDIO';
COMMENT ON COLUMN tecabix_sce.plan_estudio.descripcion IS 'DESCRIPCION DEL PLAN DE ESTUDIO';
COMMENT ON COLUMN tecabix_sce.plan_estudio.id_tipo IS 'TIPO DE PERIODO ACADEMICO, CATALOGO_TIPO = PERIODO_ACADEMICO';
COMMENT ON COLUMN tecabix_sce.plan_estudio.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.plan_estudio.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.plan_estudio.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';

ALTER TABLE tecabix_sce.plan_estudio ADD CONSTRAINT fk_plan_estudio_id_estatus FOREIGN KEY (id_estatus)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.plan_estudio ADD CONSTRAINT fk_plan_estudio_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.plan_estudio ADD CONSTRAINT fk_plan_estudio_id_carrera FOREIGN KEY (id_carrera)
REFERENCES tecabix_sce.carrera(id_carrera) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.plan_estudio ADD CONSTRAINT fk_plan_estudio_id_tipo FOREIGN KEY (id_tipo)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

CREATE INDEX indx_plan_estudio_nombre
    ON tecabix_sce.plan_estudio USING btree
    (nombre COLLATE pg_catalog."default")
    TABLESPACE pg_default;



CREATE SEQUENCE tecabix_sce.periodo_academico_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.periodo_academico_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.periodo_academico(
	id_periodo_academico bigint NOT NULL DEFAULT nextval('tecabix_sce.periodo_academico_seq'::regclass),
	id_plan_estudio bigint NOT NULL,
    nombre character varying(45) NOT NULL,
    numero smallint NOT NULL,
    inicio date NOT NULL DEFAULT now (),
    fin date NOT NULL DEFAULT now (),
    id_usuario_modificado bigint NOT NULL,
	fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
	id_estatus integer NOT NULL,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_periodo_academico_id_periodo_academico PRIMARY KEY (id_periodo_academico),
CONSTRAINT uq_periodo_academico_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.periodo_academico IS 'PERIODO ACADEMICO';
COMMENT ON COLUMN tecabix_sce.periodo_academico.id_periodo_academico IS 'IDENTIFICADOR UNICO DEL PERIODO ACADEMICO';
COMMENT ON COLUMN tecabix_sce.periodo_academico.id_plan_estudio IS 'IDENTIFICADOR UNICO DEL PLAN DE ESTUDIO';
COMMENT ON COLUMN tecabix_sce.periodo_academico.nombre IS 'NOMBRE DEL PERIODO ACADEMICO';
COMMENT ON COLUMN tecabix_sce.periodo_academico.numero IS 'NUMERO DEL PERIODO ACADEMICO';
COMMENT ON COLUMN tecabix_sce.periodo_academico.inicio IS 'INICIO DEL PERIODO ACADEMICO';
COMMENT ON COLUMN tecabix_sce.periodo_academico.fin IS 'FIN DEL PERIODO ACADEMICO';
COMMENT ON COLUMN tecabix_sce.periodo_academico.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.periodo_academico.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.periodo_academico.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';

ALTER TABLE tecabix_sce.periodo_academico ADD CONSTRAINT fk_periodo_academico_id_estatus FOREIGN KEY (id_estatus)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.periodo_academico ADD CONSTRAINT fk_periodo_academico_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.periodo_academico ADD CONSTRAINT fk_periodo_academico_id_plan_estudio FOREIGN KEY (id_plan_estudio)
REFERENCES tecabix_sce.plan_estudio(id_plan_estudio) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

CREATE INDEX indx_periodo_academico_nombre
    ON tecabix_sce.periodo_academico USING btree
    (nombre COLLATE pg_catalog."default")
    TABLESPACE pg_default;




CREATE SEQUENCE tecabix_sce.asignatura_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.asignatura_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.asignatura(
	id_asignatura bigint NOT NULL DEFAULT nextval('tecabix_sce.asignatura_seq'::regclass),
	nombre character varying(45) NOT NULL,
	descripcion character varying(500) NOT NULL,
    id_pre_asignatura bigint, 
    id_empresa bigint NOT NULL,
    id_usuario_modificado bigint NOT NULL,
	fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
	id_estatus integer NOT NULL,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_asignatura_id_asignatura PRIMARY KEY (id_asignatura),
CONSTRAINT uq_asignatura_academico_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.asignatura IS 'ASIGNATURA';
COMMENT ON COLUMN tecabix_sce.asignatura.id_asignatura IS 'IDENTIFICADOR UNICO DE LA ASIGNATURA';
COMMENT ON COLUMN tecabix_sce.asignatura.nombre IS 'NOMBRE DE LA ASIGNATURA';
COMMENT ON COLUMN tecabix_sce.asignatura.descripcion IS 'DESCRIPCION DEL ASIGNATURA';
COMMENT ON COLUMN tecabix_sce.asignatura.id_pre_asignatura IS 'ASIGNATURA QUE DEBE SER CURSADA PARA TOMAR ESTA ASIGNATURA';
COMMENT ON COLUMN tecabix_sce.asignatura.id_empresa IS 'EMPRESA AL QUE PERTENECE LA ASIGNATURA';
COMMENT ON COLUMN tecabix_sce.asignatura.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.asignatura.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.asignatura.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';

ALTER TABLE tecabix_sce.asignatura ADD CONSTRAINT fk_asignatura_id_estatus FOREIGN KEY (id_estatus)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.asignatura ADD CONSTRAINT fk_asignatura_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.asignatura ADD CONSTRAINT fk_asignatura_id_empresa FOREIGN KEY (id_empresa)
REFERENCES tecabix_sce.persona_moral(id_persona_moral) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.asignatura ADD CONSTRAINT fk_asignatura_id_pre_asignatura FOREIGN KEY (id_pre_asignatura)
REFERENCES tecabix_sce.asignatura(id_asignatura) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

CREATE INDEX indx_asignatura_nombre
    ON tecabix_sce.asignatura USING btree
    (nombre COLLATE pg_catalog."default")
    TABLESPACE pg_default;



CREATE SEQUENCE tecabix_sce.asignatura_periodo_academico_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.asignatura_periodo_academico_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.asignatura_periodo_academico(
	id_asignatura_periodo_academico bigint NOT NULL DEFAULT nextval('tecabix_sce.asignatura_periodo_academico_seq'::regclass),
	id_periodo_academico bigint NOT NULL,
    id_asignatura bigint NOT NULL,
    credito int NOT NULL DEFAULT 0,
    id_usuario_modificado bigint NOT NULL,
	fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
	id_estatus integer NOT NULL,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_asignatura_periodo_academico_id_asignatura_periodo_academico PRIMARY KEY (id_asignatura_periodo_academico),
CONSTRAINT uq_asignatura_periodo_academico_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.asignatura_periodo_academico IS 'RELACION DE ASIGNATURA Y PERIODO ACADEMICO';
COMMENT ON COLUMN tecabix_sce.asignatura_periodo_academico.id_asignatura_periodo_academico IS 'IDENTIFICADOR UNICO DE LA RELACION DE ASIGNATURA Y PERIODO ACADEMICO';
COMMENT ON COLUMN tecabix_sce.asignatura_periodo_academico.id_asignatura IS 'IDENTIFICADOR UNICO DE LA ASIGNATURA';
COMMENT ON COLUMN tecabix_sce.asignatura_periodo_academico.id_periodo_academico IS 'IDENTIFICADOR UNICO DEL PERIODO ACADEMICO';
COMMENT ON COLUMN tecabix_sce.asignatura_periodo_academico.credito IS 'CREDITOS DE LA MATERIA';
COMMENT ON COLUMN tecabix_sce.asignatura_periodo_academico.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.asignatura_periodo_academico.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.asignatura_periodo_academico.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';

ALTER TABLE tecabix_sce.asignatura_periodo_academico ADD CONSTRAINT fk_asignatura_periodo_academico_id_estatus FOREIGN KEY (id_estatus)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.asignatura_periodo_academico ADD CONSTRAINT fk_asignatura_periodo_academico_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.asignatura_periodo_academico ADD CONSTRAINT fk_asignatura_periodo_academico_id_periodo_academico FOREIGN KEY (id_periodo_academico)
REFERENCES tecabix_sce.periodo_academico(id_periodo_academico) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.asignatura_periodo_academico ADD CONSTRAINT fk_asignatura_periodo_academico_id_asignatura FOREIGN KEY (id_asignatura)
REFERENCES tecabix_sce.asignatura(id_asignatura) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;


CREATE SEQUENCE tecabix_sce.docente_seq
    INCREMENT 1
    START 4000123456788374
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.docente_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.docente(
	id_docente bigint NOT NULL DEFAULT nextval('tecabix_sce.docente_seq'::regclass),
	id_persona_fisica bigint NOT NULL,
    nombre character varying(45) NOT NULL,
    id_usuario_modificado bigint NOT NULL,
	fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
	id_estatus integer NOT NULL,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_docente_id_docente PRIMARY KEY (id_docente),
CONSTRAINT uq_docente_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.docente IS 'MAESTRO';
COMMENT ON COLUMN tecabix_sce.docente.id_docente IS 'IDENTIFICADOR UNICO DEL MAESTRO';
COMMENT ON COLUMN tecabix_sce.docente.id_persona_fisica IS 'IDENTIFICADOR UNICO DE LA PERSONA';
COMMENT ON COLUMN tecabix_sce.docente.nombre IS 'NOMBRE DEL MAESTRO CON PREFIJO DE SU GRADO ACADEMICO Y ESPECIALIDAD';
COMMENT ON COLUMN tecabix_sce.docente.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.docente.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.docente.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';

ALTER TABLE tecabix_sce.docente ADD CONSTRAINT fk_docente_id_estatus FOREIGN KEY (id_estatus)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.docente ADD CONSTRAINT fk_docente_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.docente ADD CONSTRAINT fk_docente_id_persona_fisica FOREIGN KEY (id_persona_fisica)
REFERENCES tecabix_sce.persona_fisica(id_persona_fisica) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

CREATE INDEX indx_docente_nombre
    ON tecabix_sce.docente USING btree
    (nombre COLLATE pg_catalog."default")
    TABLESPACE pg_default;



CREATE SEQUENCE tecabix_sce.grupo_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.grupo_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.grupo(
	id_grupo bigint NOT NULL DEFAULT nextval('tecabix_sce.grupo_seq'::regclass),
	id_periodo_academico bigint NOT NULL,
    nombre character varying(45) NOT NULL,
    id_usuario_modificado bigint NOT NULL,
	fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
	id_estatus integer NOT NULL,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_grupo_id_grupo PRIMARY KEY (id_grupo),
CONSTRAINT uq_grupo_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.grupo IS 'GRUPO';
COMMENT ON COLUMN tecabix_sce.grupo.id_grupo IS 'IDENTIFICADOR UNICO DEl GRUPO';
COMMENT ON COLUMN tecabix_sce.grupo.id_periodo_academico IS 'IDENTIFICADOR UNICO DEL PERIODO ACADEMICO';
COMMENT ON COLUMN tecabix_sce.grupo.nombre IS 'IDENTIFICADOR UNICO DEL PERIODO ACADEMICO';
COMMENT ON COLUMN tecabix_sce.grupo.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.grupo.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.grupo.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';

ALTER TABLE tecabix_sce.grupo ADD CONSTRAINT fk_grupo_id_estatus FOREIGN KEY (id_estatus)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.grupo ADD CONSTRAINT fk_grupo_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.grupo ADD CONSTRAINT fk_grupo_id_periodo_academico FOREIGN KEY (id_periodo_academico)
REFERENCES tecabix_sce.periodo_academico(id_periodo_academico) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

CREATE INDEX indx_grupo_nombre
    ON tecabix_sce.grupo USING btree
    (nombre COLLATE pg_catalog."default")
    TABLESPACE pg_default;



CREATE SEQUENCE tecabix_sce.clase_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.clase_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.clase(
	id_clase bigint NOT NULL DEFAULT nextval('tecabix_sce.clase_seq'::regclass),
	id_grupo bigint NOT NULL,
    id_docente bigint NOT NULL,
    id_asignatura bigint NOT NULL,
    id_usuario_modificado bigint NOT NULL,
	fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
	id_estatus integer NOT NULL,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_clase_id_clase PRIMARY KEY (id_clase),
CONSTRAINT uq_clase_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.clase IS 'CLASE';
COMMENT ON COLUMN tecabix_sce.clase.id_clase IS 'IDENTIFICADOR UNICO DE LA CLASE';
COMMENT ON COLUMN tecabix_sce.clase.id_grupo IS 'IDENTIFICADOR UNICO DEL GRUPO';
COMMENT ON COLUMN tecabix_sce.clase.id_docente IS 'IDENTIFICADOR UNICO DEL DOCENTE';
COMMENT ON COLUMN tecabix_sce.clase.id_asignatura IS 'IDENTIFICADOR UNICO DE LA MATERIA';
COMMENT ON COLUMN tecabix_sce.clase.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.clase.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.clase.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';

ALTER TABLE tecabix_sce.clase ADD CONSTRAINT fk_clase_id_estatus FOREIGN KEY (id_estatus)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.clase ADD CONSTRAINT fk_clase_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.clase ADD CONSTRAINT fk_clase_id_grupo FOREIGN KEY (id_grupo)
REFERENCES tecabix_sce.grupo(id_grupo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.clase ADD CONSTRAINT fk_clase_id_docente FOREIGN KEY (id_docente)
REFERENCES tecabix_sce.docente(id_docente) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.clase ADD CONSTRAINT fk_clase_id_asignatura FOREIGN KEY (id_asignatura)
REFERENCES tecabix_sce.asignatura(id_asignatura) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

CREATE SEQUENCE tecabix_sce.clase_horario_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.clase_horario_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.clase_horario(
	id_clase_horario bigint NOT NULL DEFAULT nextval('tecabix_sce.clase_horario_seq'::regclass),
	id_clase bigint NOT NULL,
    id_dia integer NOT NULL,
    inicio time NOT NULL DEFAULT now (),
    fin time NOT NULL DEFAULT now (),
    id_usuario_modificado bigint NOT NULL,
	fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
	id_estatus integer NOT NULL,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_clase_horario_id_clase_horario PRIMARY KEY (id_clase_horario),
CONSTRAINT uq_clase_horario_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.clase_horario IS 'HORARIOS DE CLASES';
COMMENT ON COLUMN tecabix_sce.clase_horario.id_clase_horario IS 'IDENTIFICADOR UNICO DEL HORARIO';
COMMENT ON COLUMN tecabix_sce.clase_horario.id_clase IS 'IDENTIFICADOR UNICO DE LA CLASE';
COMMENT ON COLUMN tecabix_sce.clase_horario.id_dia IS 'DIA DE LA SEMANA, CATALOGO_TIPO = DIA_DE_LA_SEMANA';
COMMENT ON COLUMN tecabix_sce.clase_horario.inicio IS 'HORA DE INICIO DE LA CLASE';
COMMENT ON COLUMN tecabix_sce.clase_horario.fin IS 'HORA EN QUE FINALIZA LA CLASE';
COMMENT ON COLUMN tecabix_sce.clase_horario.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.clase_horario.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.clase_horario.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';

ALTER TABLE tecabix_sce.clase_horario ADD CONSTRAINT fk_clase_horario_id_estatus FOREIGN KEY (id_estatus)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.clase_horario ADD CONSTRAINT fk_clase_horario_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.clase_horario ADD CONSTRAINT fk_clase_horario_id_dia FOREIGN KEY (id_dia)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.clase_horario ADD CONSTRAINT fk_clase_horario_id_clase FOREIGN KEY (id_clase)
REFERENCES tecabix_sce.clase(id_clase) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

CREATE SEQUENCE tecabix_sce.clase_asistencia_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.clase_asistencia_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.clase_asistencia(
	id_clase_asistencia bigint NOT NULL DEFAULT nextval('tecabix_sce.clase_asistencia_seq'::regclass),
	id_clase bigint NOT NULL,
    fecha date NOT NULL DEFAULT now (),
    id_usuario_modificado bigint NOT NULL,
	fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
	id_estatus integer NOT NULL,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_clase_asistencia_id_clase_asistencia PRIMARY KEY (id_clase_asistencia),
CONSTRAINT uq_clase_asistencia_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.clase_asistencia IS 'ASISTENCIA';
COMMENT ON COLUMN tecabix_sce.clase_asistencia.id_clase_asistencia IS 'IDENTIFICADOR UNICO DE LA ASISTENCIA';
COMMENT ON COLUMN tecabix_sce.clase_asistencia.id_clase IS 'IDENTIFICADOR UNICO DE LA CLASE';
COMMENT ON COLUMN tecabix_sce.clase_asistencia.fecha IS 'FECHA DE ASISTENCIA O DE LA CLASE';
COMMENT ON COLUMN tecabix_sce.clase_asistencia.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.clase_asistencia.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.clase_asistencia.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';

ALTER TABLE tecabix_sce.clase_asistencia ADD CONSTRAINT fk_clase_asistencia_id_estatus FOREIGN KEY (id_estatus)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.clase_asistencia ADD CONSTRAINT fk_clase_asistencia_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.clase_asistencia ADD CONSTRAINT fk_clase_asistencia_id_clase FOREIGN KEY (id_clase)
REFERENCES tecabix_sce.clase(id_clase) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

CREATE SEQUENCE tecabix_sce.clase_inasistencia_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.clase_inasistencia_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.clase_inasistencia(
	id_clase_inasistencia bigint NOT NULL DEFAULT nextval('tecabix_sce.clase_inasistencia_seq'::regclass),
	id_clase_asistencia bigint NOT NULL,
    observaciones character varying(45),
    justificado boolean NOT NULL DEFAULT FALSE,
    id_usuario_modificado bigint NOT NULL,
	fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
	id_estatus integer NOT NULL,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_clase_inasistencia_id_clase_inasistencia PRIMARY KEY (id_clase_inasistencia),
CONSTRAINT uq_clase_inasistencia_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.clase_inasistencia IS 'INASISTENCIA';
COMMENT ON COLUMN tecabix_sce.clase_inasistencia.id_clase_inasistencia IS 'IDENTIFICADOR UNICO DE LA INASISTENCIA';
COMMENT ON COLUMN tecabix_sce.clase_inasistencia.id_clase_asistencia IS 'IDENTIFICADOR UNICO DE LA ASISTENCIA';
COMMENT ON COLUMN tecabix_sce.clase_inasistencia.observaciones IS 'OBSERVACIONES DE LA INASISTENCIA';
COMMENT ON COLUMN tecabix_sce.clase_inasistencia.justificado IS 'SI FUE JUSTIFICADO LA INASISTENCIA';
COMMENT ON COLUMN tecabix_sce.clase_inasistencia.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.clase_inasistencia.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.clase_inasistencia.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';

ALTER TABLE tecabix_sce.clase_inasistencia ADD CONSTRAINT fk_clase_inasistencia_id_estatus FOREIGN KEY (id_estatus)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.clase_inasistencia ADD CONSTRAINT fk_clase_inasistencia_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.clase_inasistencia ADD CONSTRAINT fk_clase_inasistencia_id_clase_asistencia FOREIGN KEY (id_clase_asistencia)
REFERENCES tecabix_sce.clase_asistencia(id_clase_asistencia) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;



CREATE SEQUENCE tecabix_sce.alumno_seq
    INCREMENT 1
    START 1000123456788374
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.alumno_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.alumno(
	id_alumno bigint NOT NULL DEFAULT nextval('tecabix_sce.alumno_seq'::regclass),
	id_persona_fisica bigint NOT NULL,
    id_usuario_modificado bigint NOT NULL,
	fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
	id_estatus integer NOT NULL,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_alumno_id_alumno PRIMARY KEY (id_alumno),
CONSTRAINT uq_alumno_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.alumno IS 'ALUMNO';
COMMENT ON COLUMN tecabix_sce.alumno.id_alumno IS 'IDENTIFICADOR UNICO DEL ALUMNO';
COMMENT ON COLUMN tecabix_sce.alumno.id_persona_fisica IS 'IDENTIFICADOR UNICO DE LA PERSONA';
COMMENT ON COLUMN tecabix_sce.alumno.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.alumno.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.alumno.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';

ALTER TABLE tecabix_sce.alumno ADD CONSTRAINT fk_alumno_id_estatus FOREIGN KEY (id_estatus)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.alumno ADD CONSTRAINT fk_alumno_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.alumno ADD CONSTRAINT fk_alumno_id_persona_fisica FOREIGN KEY (id_persona_fisica)
REFERENCES tecabix_sce.persona_fisica(id_persona_fisica) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;


CREATE SEQUENCE tecabix_sce.plan_estudio_alumno_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.plan_estudio_alumno_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.plan_estudio_alumno(
	id_plan_estudio_alumno bigint NOT NULL DEFAULT nextval('tecabix_sce.plan_estudio_alumno_seq'::regclass),
	id_plan_estudio bigint NOT NULL,
    id_alumno bigint NOT NULL,
    id_usuario_modificado bigint NOT NULL,
	fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
	id_estatus integer NOT NULL,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_plan_estudio_alumno_id_plan_estudio_alumno PRIMARY KEY (id_plan_estudio_alumno),
CONSTRAINT uq_plan_estudio_alumno_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.plan_estudio_alumno IS 'RELACION ENTRE PLAN DE ESTUDIO Y ALUMNO';
COMMENT ON COLUMN tecabix_sce.plan_estudio_alumno.id_plan_estudio_alumno IS 'IDENTIFICADOR UNICO DEL PLAN DE ESTUDIO ALUMNO';
COMMENT ON COLUMN tecabix_sce.plan_estudio_alumno.id_plan_estudio IS 'IDENTIFICADOR UNICO DEL PLAN DE ESTUDIO';
COMMENT ON COLUMN tecabix_sce.plan_estudio_alumno.id_alumno IS 'IDENTIFICADOR UNICO DEL ALUMNO';
COMMENT ON COLUMN tecabix_sce.plan_estudio_alumno.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.plan_estudio_alumno.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.plan_estudio_alumno.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';

ALTER TABLE tecabix_sce.plan_estudio_alumno ADD CONSTRAINT fk_plan_estudio_alumno_id_estatus FOREIGN KEY (id_estatus)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.plan_estudio_alumno ADD CONSTRAINT fk_plan_estudio_alumno_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.plan_estudio_alumno ADD CONSTRAINT fk_plan_estudio_alumno_academico_id_plan_estudio FOREIGN KEY (id_plan_estudio)
REFERENCES tecabix_sce.plan_estudio(id_plan_estudio) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.plan_estudio_alumno ADD CONSTRAINT fk_plan_estudio_alumno_academico_id_alumno FOREIGN KEY (id_alumno)
REFERENCES tecabix_sce.alumno(id_alumno) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;


CREATE SEQUENCE tecabix_sce.materia_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.materia_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.materia(
	id_materia bigint NOT NULL DEFAULT nextval('tecabix_sce.materia_seq'::regclass),
	id_clase bigint NOT NULL,
    id_alumno bigint NOT NULL,
    id_usuario_modificado bigint NOT NULL,
	fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
	id_estatus integer NOT NULL,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_materia_id_materia PRIMARY KEY (id_materia),
CONSTRAINT uq_materia_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.materia IS 'MATERIA';
COMMENT ON COLUMN tecabix_sce.materia.id_materia IS 'IDENTIFICADOR UNICO DE LA MATERIA';
COMMENT ON COLUMN tecabix_sce.materia.id_clase IS 'IDENTIFICADOR UNICO DE LA CLASE';
COMMENT ON COLUMN tecabix_sce.materia.id_alumno IS 'IDENTIFICADOR UNICO DEL ALUMNO';
COMMENT ON COLUMN tecabix_sce.materia.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.materia.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.materia.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';

ALTER TABLE tecabix_sce.materia ADD CONSTRAINT fk_materia_id_estatus FOREIGN KEY (id_estatus)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.materia ADD CONSTRAINT fk_materia_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.materia ADD CONSTRAINT fk_materia_id_clase FOREIGN KEY (id_clase)
REFERENCES tecabix_sce.clase(id_clase) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.materia ADD CONSTRAINT fk_pmateria_id_alumno FOREIGN KEY (id_alumno)
REFERENCES tecabix_sce.alumno(id_alumno) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;


CREATE SEQUENCE tecabix_sce.calificacion_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce.calificacion_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce.calificacion(
	id_calificacion bigint NOT NULL DEFAULT nextval('tecabix_sce.calificacion_seq'::regclass),
	id_materia bigint NOT NULL,
    nota smallint NOT NULL,
    id_tipo integer NOT NULL,
    id_usuario_modificado bigint NOT NULL,
	fecha_modificado timestamp without time zone NOT NULL DEFAULT now (),
	id_estatus integer NOT NULL,
    clave uuid NOT NULL DEFAULT uuid_generate_v4 (),
CONSTRAINT pk_calificacion_id_calificacion PRIMARY KEY (id_calificacion),
CONSTRAINT uq_calificacion_clave UNIQUE (clave)
);
COMMENT ON TABLE tecabix_sce.calificacion IS 'CALIFICACION FINAL DE LA MATERIA';
COMMENT ON COLUMN tecabix_sce.calificacion.id_calificacion IS 'IDENTIFICADOR UNICO DE LA CALIFICACION';
COMMENT ON COLUMN tecabix_sce.calificacion.id_materia IS 'IDENTIFICADOR UNICO DE LA MATERIA';
COMMENT ON COLUMN tecabix_sce.calificacion.nota IS 'CALIFICACION';
COMMENT ON COLUMN tecabix_sce.calificacion.id_tipo IS 'CALIFICACION EMITIDA POR ORDINARIO O EXTRAORIDINARIO, CATALOGO_TIPO = TIPO_CALIFICACION';
COMMENT ON COLUMN tecabix_sce.calificacion.id_usuario_modificado IS 'ULTIMO USUARIO QUE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.calificacion.fecha_modificado IS 'ULTIMA FECHA QUE SE MODIFICO EL REGISTRO';
COMMENT ON COLUMN tecabix_sce.calificacion.id_estatus IS 'STATUS DEL REGISTRO, CATALOGO_TIPO = ESTATUS';

ALTER TABLE tecabix_sce.calificacion ADD CONSTRAINT fk_calificacion_id_estatus FOREIGN KEY (id_estatus)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.calificacion ADD CONSTRAINT fk_calificacion_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.calificacion ADD CONSTRAINT fk_calificacion_id_tipo FOREIGN KEY (id_tipo)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce.calificacion ADD CONSTRAINT fk_calificacion_id_materia FOREIGN KEY (id_materia)
REFERENCES tecabix_sce.materia(id_materia) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;




CREATE MATERIALIZED VIEW tecabix_sce.numero_maximo_registro AS 
	SELECT s.id_empresa, a.nombre, CAST (o.valor AS INTEGER)
		FROM tecabix_sce.suscripcion s 
		JOIN tecabix_sce.plan p ON (s.id_plan = p.id_plan) 
		JOIN tecabix_sce.plan_configuracion c ON (p.id_plan = c.id_plan) 
		JOIN tecabix_sce.configuracion o ON (c.id_configuracion = o.id_configuracion)
		JOIN tecabix_sce.catalogo a ON (o.id_tipo = a.id_catalogo)
		WHERE a.nombre LIKE 'MAX_REG_%';

