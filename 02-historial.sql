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
CREATE SCHEMA tecabix_sce_historial
    AUTHORIZATION postgres;

CREATE SEQUENCE tecabix_sce_historial.catalogo_tipo_historial_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce_historial.catalogo_tipo_historial_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce_historial.catalogo_tipo_historial(
	id_catalogo_tipo_historial bigint NOT NULL DEFAULT nextval('tecabix_sce_historial.catalogo_tipo_historial_seq'::regclass),
	id_catalogo_tipo bigint NOT NULL,
    fecha timestamp without time zone NOT NULL DEFAULT now (),
    id_accion bigint NOT NULL,
    id_usuario_modificado bigint NOT NULL,
	descripcion character varying(150) NOT NULL,
CONSTRAINT pk_catalogo_tipo_historial_id_catalogo_tipo_historial PRIMARY KEY (id_catalogo_tipo_historial)
);
COMMENT ON TABLE tecabix_sce_historial.catalogo_tipo_historial IS 'HISTORIAL Del tipo de CATALOGO';
COMMENT ON COLUMN tecabix_sce_historial.catalogo_tipo_historial.id_catalogo_tipo_historial IS 'IDENTIFICADOR UNICO DEL HISTORIAL Del tipo deL CATALOGO';
COMMENT ON COLUMN tecabix_sce_historial.catalogo_tipo_historial.id_catalogo_tipo IS 'IDENTIFICADOR UNICO Del tipo deL CATALOGO';
COMMENT ON COLUMN tecabix_sce_historial.catalogo_tipo_historial.fecha IS 'FECHA EN QUE SE REALIZO LA ACCION';
COMMENT ON COLUMN tecabix_sce_historial.catalogo_tipo_historial.id_accion IS 'TIPO DE ACCION QUE SE REALIZO, CATALOGO_TIPO = CRUD';
COMMENT ON COLUMN tecabix_sce_historial.catalogo_tipo_historial.id_usuario_modificado IS 'USUARIO QUE REALIZO LA ACCION';
COMMENT ON COLUMN tecabix_sce_historial.catalogo_tipo_historial.descripcion IS 'DESCRIPCION DE LA ACCION';

ALTER TABLE tecabix_sce_historial.catalogo_tipo_historial ADD CONSTRAINT fk_catalogo_tipo_historial_id_accion FOREIGN KEY (id_accion)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce_historial.catalogo_tipo_historial ADD CONSTRAINT fk_catalogo_tipo_historial_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;


CREATE SEQUENCE tecabix_sce_historial.catalogo_historial_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce_historial.catalogo_historial_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce_historial.catalogo_historial(
	id_catalogo_historial bigint NOT NULL DEFAULT nextval('tecabix_sce_historial.catalogo_historial_seq'::regclass),
	id_catalogo bigint NOT NULL,
    fecha timestamp without time zone NOT NULL DEFAULT now (),
    id_accion bigint NOT NULL,
    id_usuario_modificado bigint NOT NULL,
	descripcion character varying(150) NOT NULL,
CONSTRAINT pk_catalogo_historial_id_catalogo_historial PRIMARY KEY (id_catalogo_historial)
);
COMMENT ON TABLE tecabix_sce_historial.catalogo_historial IS 'HISTORIAL DEL CATALOGO';
COMMENT ON COLUMN tecabix_sce_historial.catalogo_historial.id_catalogo_historial IS 'IDENTIFICADOR UNICO DEL HISTORIAL DEL CATALOGO';
COMMENT ON COLUMN tecabix_sce_historial.catalogo_historial.id_catalogo IS 'IDENTIFICADOR UNICO DEL CATALOGO';
COMMENT ON COLUMN tecabix_sce_historial.catalogo_historial.fecha IS 'FECHA EN QUE SE REALIZO LA ACCION';
COMMENT ON COLUMN tecabix_sce_historial.catalogo_historial.id_accion IS 'TIPO DE ACCION QUE SE REALIZO, CATALOGO_TIPO = CRUD';
COMMENT ON COLUMN tecabix_sce_historial.catalogo_historial.id_usuario_modificado IS 'USUARIO QUE REALIZO LA ACCION';
COMMENT ON COLUMN tecabix_sce_historial.catalogo_historial.descripcion IS 'DESCRIPCION DE LA ACCION';

ALTER TABLE tecabix_sce_historial.catalogo_historial ADD CONSTRAINT fk_catalogo_historial_id_accion FOREIGN KEY (id_accion)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce_historial.catalogo_historial ADD CONSTRAINT fk_catalogo_historial_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;



CREATE SEQUENCE tecabix_sce_historial.authority_historial_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce_historial.authority_historial_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce_historial.authority_historial(
	id_authority_historial bigint NOT NULL DEFAULT nextval('tecabix_sce_historial.authority_historial_seq'::regclass),
	id_authority bigint NOT NULL,
    fecha timestamp without time zone NOT NULL DEFAULT now (),
    id_accion bigint NOT NULL,
    id_usuario_modificado bigint NOT NULL,
	descripcion character varying(150) NOT NULL,
CONSTRAINT pk_authority_historial_id_authority_historial PRIMARY KEY (id_authority_historial)
);
COMMENT ON TABLE tecabix_sce_historial.authority_historial IS 'HISTORIAL DEL CATALOGO';
COMMENT ON COLUMN tecabix_sce_historial.authority_historial.id_authority_historial IS 'IDENTIFICADOR UNICO DEL HISTORIAL DEL AUTHORITY';
COMMENT ON COLUMN tecabix_sce_historial.authority_historial.id_authority IS 'IDENTIFICADOR UNICO DEL AUTHORITY';
COMMENT ON COLUMN tecabix_sce_historial.authority_historial.fecha IS 'FECHA EN QUE SE REALIZO LA ACCION';
COMMENT ON COLUMN tecabix_sce_historial.authority_historial.id_accion IS 'TIPO DE ACCION QUE SE REALIZO, CATALOGO_TIPO = CRUD';
COMMENT ON COLUMN tecabix_sce_historial.authority_historial.id_usuario_modificado IS 'USUARIO QUE REALIZO LA ACCION';
COMMENT ON COLUMN tecabix_sce_historial.authority_historial.descripcion IS 'DESCRIPCION DE LA ACCION';

ALTER TABLE tecabix_sce_historial.authority_historial ADD CONSTRAINT fk_authority_historial_id_accion FOREIGN KEY (id_accion)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce_historial.authority_historial ADD CONSTRAINT fk_authority_historial_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;



CREATE SEQUENCE tecabix_sce_historial.perfil_historial_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce_historial.perfil_historial_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce_historial.perfil_historial(
	id_perfil_historial bigint NOT NULL DEFAULT nextval('tecabix_sce_historial.perfil_historial_seq'::regclass),
	id_perfil bigint NOT NULL,
    fecha timestamp without time zone NOT NULL DEFAULT now (),
    id_accion bigint NOT NULL,
    id_usuario_modificado bigint NOT NULL,
	descripcion character varying(150) NOT NULL,
CONSTRAINT pk_perfil_historial_id_perfil_historial PRIMARY KEY (id_perfil_historial)
);
COMMENT ON TABLE tecabix_sce_historial.perfil_historial IS 'HISTORIAL DEL PERFIL';
COMMENT ON COLUMN tecabix_sce_historial.perfil_historial.id_perfil_historial IS 'IDENTIFICADOR UNICO DEL HISTORIAL DEL PERFIL';
COMMENT ON COLUMN tecabix_sce_historial.perfil_historial.id_perfil IS 'IDENTIFICADOR UNICO DEL PERFIL';
COMMENT ON COLUMN tecabix_sce_historial.perfil_historial.fecha IS 'FECHA EN QUE SE REALIZO LA ACCION';
COMMENT ON COLUMN tecabix_sce_historial.perfil_historial.id_accion IS 'TIPO DE ACCION QUE SE REALIZO, CATALOGO_TIPO = CRUD';
COMMENT ON COLUMN tecabix_sce_historial.perfil_historial.id_usuario_modificado IS 'USUARIO QUE REALIZO LA ACCION';
COMMENT ON COLUMN tecabix_sce_historial.perfil_historial.descripcion IS 'DESCRIPCION DE LA ACCION';

ALTER TABLE tecabix_sce_historial.perfil_historial ADD CONSTRAINT fk_perfil_historial_id_accion FOREIGN KEY (id_accion)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce_historial.perfil_historial ADD CONSTRAINT fk_perfil_historial_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;


CREATE SEQUENCE tecabix_sce_historial.configuracion_historial_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce_historial.configuracion_historial_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce_historial.configuracion_historial(
	id_configuracion_historial bigint NOT NULL DEFAULT nextval('tecabix_sce_historial.configuracion_historial_seq'::regclass),
	id_configuracion bigint NOT NULL,
    fecha timestamp without time zone NOT NULL DEFAULT now (),
    id_accion bigint NOT NULL,
    id_usuario_modificado bigint NOT NULL,
	descripcion character varying(150) NOT NULL,
CONSTRAINT pk_configuracion_historial_id_configuracion_historial PRIMARY KEY (id_configuracion_historial)
);
COMMENT ON TABLE tecabix_sce_historial.configuracion_historial IS 'HISTORIAL DEL LA CONFIGURACION';
COMMENT ON COLUMN tecabix_sce_historial.configuracion_historial.id_configuracion_historial IS 'IDENTIFICADOR UNICO DEL HISTORIAL DE LA CONFIGURACION';
COMMENT ON COLUMN tecabix_sce_historial.configuracion_historial.id_configuracion IS 'IDENTIFICADOR UNICO DE LA CONFIGURACION';
COMMENT ON COLUMN tecabix_sce_historial.configuracion_historial.fecha IS 'FECHA EN QUE SE REALIZO LA ACCION';
COMMENT ON COLUMN tecabix_sce_historial.configuracion_historial.id_accion IS 'TIPO DE ACCION QUE SE REALIZO, CATALOGO_TIPO = CRUD';
COMMENT ON COLUMN tecabix_sce_historial.configuracion_historial.id_usuario_modificado IS 'USUARIO QUE REALIZO LA ACCION';
COMMENT ON COLUMN tecabix_sce_historial.configuracion_historial.descripcion IS 'DESCRIPCION DE LA ACCION';

ALTER TABLE tecabix_sce_historial.configuracion_historial ADD CONSTRAINT fk_configuracion_historial_id_accion FOREIGN KEY (id_accion)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce_historial.configuracion_historial ADD CONSTRAINT fk_configuracion_historial_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;


CREATE SEQUENCE tecabix_sce_historial.usuario_historial_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce_historial.usuario_historial_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce_historial.usuario_historial(
	id_usuario_historial bigint NOT NULL DEFAULT nextval('tecabix_sce_historial.usuario_historial_seq'::regclass),
	id_usuario bigint NOT NULL,
    fecha timestamp without time zone NOT NULL DEFAULT now (),
    id_accion bigint NOT NULL,
    id_usuario_modificado bigint NOT NULL,
	descripcion character varying(150) NOT NULL,
CONSTRAINT pk_usuario_historial_id_usuario_historial PRIMARY KEY (id_usuario_historial)
);
COMMENT ON TABLE tecabix_sce_historial.usuario_historial IS 'HISTORIAL DEL USUARIO';
COMMENT ON COLUMN tecabix_sce_historial.usuario_historial.id_usuario_historial IS 'IDENTIFICADOR UNICO DEL HISTORIAL DEL USUARIO';
COMMENT ON COLUMN tecabix_sce_historial.usuario_historial.id_usuario IS 'IDENTIFICADOR UNICO DEL USUARIO';
COMMENT ON COLUMN tecabix_sce_historial.usuario_historial.fecha IS 'FECHA EN QUE SE REALIZO LA ACCION';
COMMENT ON COLUMN tecabix_sce_historial.usuario_historial.id_accion IS 'TIPO DE ACCION QUE SE REALIZO, CATALOGO_TIPO = CRUD';
COMMENT ON COLUMN tecabix_sce_historial.usuario_historial.id_usuario_modificado IS 'USUARIO QUE REALIZO LA ACCION';
COMMENT ON COLUMN tecabix_sce_historial.usuario_historial.descripcion IS 'DESCRIPCION DE LA ACCION';

ALTER TABLE tecabix_sce_historial.usuario_historial ADD CONSTRAINT fk_usuario_historial_id_accion FOREIGN KEY (id_accion)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce_historial.usuario_historial ADD CONSTRAINT fk_usuario_historial_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;




CREATE SEQUENCE tecabix_sce_historial.persona_moral_historial_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce_historial.persona_moral_historial_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce_historial.persona_moral_historial(
	id_persona_moral_historial bigint NOT NULL DEFAULT nextval('tecabix_sce_historial.persona_moral_historial_seq'::regclass),
	id_persona_moral bigint NOT NULL,
    fecha timestamp without time zone NOT NULL DEFAULT now (),
    id_accion bigint NOT NULL,
    id_usuario_modificado bigint NOT NULL,
	descripcion character varying(150) NOT NULL,
CONSTRAINT pk_persona_moral_historial_id_persona_moral_historial PRIMARY KEY (id_persona_moral_historial)
);
COMMENT ON TABLE tecabix_sce_historial.persona_moral_historial IS 'HISTORIAL DE LA PERSONA MORAL';
COMMENT ON COLUMN tecabix_sce_historial.persona_moral_historial.id_persona_moral_historial IS 'IDENTIFICADOR UNICO DEL HISTORIAL DE LA PERSONA MORAL';
COMMENT ON COLUMN tecabix_sce_historial.persona_moral_historial.id_persona_moral IS 'IDENTIFICADOR UNICO DE LA PERSONA MORAL';
COMMENT ON COLUMN tecabix_sce_historial.persona_moral_historial.fecha IS 'FECHA EN QUE SE REALIZO LA ACCION';
COMMENT ON COLUMN tecabix_sce_historial.persona_moral_historial.id_accion IS 'TIPO DE ACCION QUE SE REALIZO, CATALOGO_TIPO = CRUD';
COMMENT ON COLUMN tecabix_sce_historial.persona_moral_historial.id_usuario_modificado IS 'USUARIO QUE REALIZO LA ACCION';
COMMENT ON COLUMN tecabix_sce_historial.persona_moral_historial.descripcion IS 'DESCRIPCION DE LA ACCION';

ALTER TABLE tecabix_sce_historial.persona_moral_historial ADD CONSTRAINT fk_persona_moral_historial_id_accion FOREIGN KEY (id_accion)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce_historial.persona_moral_historial ADD CONSTRAINT fk_persona_moral_historial_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;



CREATE SEQUENCE tecabix_sce_historial.persona_fisica_historial_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce_historial.persona_fisica_historial_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce_historial.persona_fisica_historial(
	id_persona_fisica_historial bigint NOT NULL DEFAULT nextval('tecabix_sce_historial.persona_fisica_historial_seq'::regclass),
	id_persona_fisica bigint NOT NULL,
    fecha timestamp without time zone NOT NULL DEFAULT now (),
    id_accion bigint NOT NULL,
    id_usuario_modificado bigint NOT NULL,
	descripcion character varying(150) NOT NULL,
CONSTRAINT pk_persona_fisica_historial_id_persona_fisica_historial PRIMARY KEY (id_persona_fisica_historial)
);
COMMENT ON TABLE tecabix_sce_historial.persona_fisica_historial IS 'HISTORIAL DE LA PERSONA FISICA';
COMMENT ON COLUMN tecabix_sce_historial.persona_fisica_historial.id_persona_fisica_historial IS 'IDENTIFICADOR UNICO DEL HISTORIAL DE LA PERSONA FISICA';
COMMENT ON COLUMN tecabix_sce_historial.persona_fisica_historial.id_persona_fisica IS 'IDENTIFICADOR UNICO DE LA PERSONA FISICA';
COMMENT ON COLUMN tecabix_sce_historial.persona_fisica_historial.fecha IS 'FECHA EN QUE SE REALIZO LA ACCION';
COMMENT ON COLUMN tecabix_sce_historial.persona_fisica_historial.id_accion IS 'TIPO DE ACCION QUE SE REALIZO, CATALOGO_TIPO = CRUD';
COMMENT ON COLUMN tecabix_sce_historial.persona_fisica_historial.id_usuario_modificado IS 'USUARIO QUE REALIZO LA ACCION';
COMMENT ON COLUMN tecabix_sce_historial.persona_fisica_historial.descripcion IS 'DESCRIPCION DE LA ACCION';

ALTER TABLE tecabix_sce_historial.persona_fisica_historial ADD CONSTRAINT fk_persona_fisica_historial_id_accion FOREIGN KEY (id_accion)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce_historial.persona_fisica_historial ADD CONSTRAINT fk_persona_fisica_historial_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;


CREATE SEQUENCE tecabix_sce_historial.departamento_historial_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce_historial.departamento_historial_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce_historial.departamento_historial(
	id_departamento_historial bigint NOT NULL DEFAULT nextval('tecabix_sce_historial.departamento_historial_seq'::regclass),
	id_departamento bigint NOT NULL,
    fecha timestamp without time zone NOT NULL DEFAULT now (),
    id_accion bigint NOT NULL,
    id_usuario_modificado bigint NOT NULL,
	descripcion character varying(150) NOT NULL,
CONSTRAINT pk_departamento_historial_id_departamento_historial PRIMARY KEY (id_departamento_historial)
);
COMMENT ON TABLE tecabix_sce_historial.departamento_historial IS 'HISTORIAL DEL DEPARTAMENTO';
COMMENT ON COLUMN tecabix_sce_historial.departamento_historial.id_departamento_historial IS 'IDENTIFICADOR UNICO DEL HISTORIAL DEL DEPARTAMENTO';
COMMENT ON COLUMN tecabix_sce_historial.departamento_historial.id_departamento IS 'IDENTIFICADOR UNICO DEL DEPARTAMENTO';
COMMENT ON COLUMN tecabix_sce_historial.departamento_historial.fecha IS 'FECHA EN QUE SE REALIZO LA ACCION';
COMMENT ON COLUMN tecabix_sce_historial.departamento_historial.id_accion IS 'TIPO DE ACCION QUE SE REALIZO, CATALOGO_TIPO = CRUD';
COMMENT ON COLUMN tecabix_sce_historial.departamento_historial.id_usuario_modificado IS 'USUARIO QUE REALIZO LA ACCION';
COMMENT ON COLUMN tecabix_sce_historial.departamento_historial.descripcion IS 'DESCRIPCION DE LA ACCION';

ALTER TABLE tecabix_sce_historial.departamento_historial ADD CONSTRAINT fk_departamento_historial_id_accion FOREIGN KEY (id_accion)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce_historial.departamento_historial ADD CONSTRAINT fk_departamento_historial_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;


CREATE SEQUENCE tecabix_sce_historial.puesto_historial_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce_historial.puesto_historial_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce_historial.puesto_historial(
	id_puesto_historial bigint NOT NULL DEFAULT nextval('tecabix_sce_historial.puesto_historial_seq'::regclass),
	id_puesto bigint NOT NULL,
    fecha timestamp without time zone NOT NULL DEFAULT now (),
    id_accion bigint NOT NULL,
    id_usuario_modificado bigint NOT NULL,
	descripcion character varying(150) NOT NULL,
CONSTRAINT pk_puesto_historial_id_puesto_historial PRIMARY KEY (id_puesto_historial)
);
COMMENT ON TABLE tecabix_sce_historial.puesto_historial IS 'HISTORIAL DEL PUESTO';
COMMENT ON COLUMN tecabix_sce_historial.puesto_historial.id_puesto_historial IS 'IDENTIFICADOR UNICO DEL HISTORIAL DEL PUESTO';
COMMENT ON COLUMN tecabix_sce_historial.puesto_historial.id_puesto IS 'IDENTIFICADOR UNICO DEL PUESTO';
COMMENT ON COLUMN tecabix_sce_historial.puesto_historial.fecha IS 'FECHA EN QUE SE REALIZO LA ACCION';
COMMENT ON COLUMN tecabix_sce_historial.puesto_historial.id_accion IS 'TIPO DE ACCION QUE SE REALIZO, CATALOGO_TIPO = CRUD';
COMMENT ON COLUMN tecabix_sce_historial.puesto_historial.id_usuario_modificado IS 'USUARIO QUE REALIZO LA ACCION';
COMMENT ON COLUMN tecabix_sce_historial.puesto_historial.descripcion IS 'DESCRIPCION DE LA ACCION';

ALTER TABLE tecabix_sce_historial.puesto_historial ADD CONSTRAINT fk_puesto_historial_id_accion FOREIGN KEY (id_accion)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce_historial.puesto_historial ADD CONSTRAINT fk_puesto_historial_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;



CREATE SEQUENCE tecabix_sce_historial.trabajador_historial_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce_historial.puesto_historial_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce_historial.trabajador_historial(
	id_trabajador_historial bigint NOT NULL DEFAULT nextval('tecabix_sce_historial.trabajador_historial_seq'::regclass),
	id_trabajador bigint NOT NULL,
    fecha timestamp without time zone NOT NULL DEFAULT now (),
    id_accion bigint NOT NULL,
    id_usuario_modificado bigint NOT NULL,
	descripcion character varying(150) NOT NULL,
CONSTRAINT pk_trabajador_historial_id_trabajador_historial PRIMARY KEY (id_trabajador_historial)
);
COMMENT ON TABLE tecabix_sce_historial.trabajador_historial IS 'HISTORIAL DEL TRABAJADOR';
COMMENT ON COLUMN tecabix_sce_historial.trabajador_historial.id_trabajador_historial IS 'IDENTIFICADOR UNICO DEL HISTORIAL DEL TRABAJADOR';
COMMENT ON COLUMN tecabix_sce_historial.trabajador_historial.id_trabajador IS 'IDENTIFICADOR UNICO DEL TRABAJADRO';
COMMENT ON COLUMN tecabix_sce_historial.trabajador_historial.fecha IS 'FECHA EN QUE SE REALIZO LA ACCION';
COMMENT ON COLUMN tecabix_sce_historial.trabajador_historial.id_accion IS 'TIPO DE ACCION QUE SE REALIZO, CATALOGO_TIPO = CRUD';
COMMENT ON COLUMN tecabix_sce_historial.trabajador_historial.id_usuario_modificado IS 'USUARIO QUE REALIZO LA ACCION';
COMMENT ON COLUMN tecabix_sce_historial.trabajador_historial.descripcion IS 'DESCRIPCION DE LA ACCION';

ALTER TABLE tecabix_sce_historial.trabajador_historial ADD CONSTRAINT fk_trabajador_historial_id_accion FOREIGN KEY (id_accion)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce_historial.trabajador_historial ADD CONSTRAINT fk_trabajador_historial_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;



CREATE SEQUENCE tecabix_sce_historial.plantel_historial_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce_historial.plantel_historial_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce_historial.plantel_historial(
	id_plantel_historial bigint NOT NULL DEFAULT nextval('tecabix_sce_historial.plantel_historial_seq'::regclass),
	id_plantel bigint NOT NULL,
    fecha timestamp without time zone NOT NULL DEFAULT now (),
    id_accion bigint NOT NULL,
    id_usuario_modificado bigint NOT NULL,
	descripcion character varying(150) NOT NULL,
CONSTRAINT pk_plantel_historial_id_plantel_historial PRIMARY KEY (id_plantel_historial)
);
COMMENT ON TABLE tecabix_sce_historial.plantel_historial IS 'HISTORIAL DEL PLANTEL';
COMMENT ON COLUMN tecabix_sce_historial.plantel_historial.id_plantel_historial IS 'IDENTIFICADOR UNICO DEL HISTORIAL DEL PLANTEL';
COMMENT ON COLUMN tecabix_sce_historial.plantel_historial.id_plantel IS 'IDENTIFICADOR UNICO DEL PLANTEL';
COMMENT ON COLUMN tecabix_sce_historial.plantel_historial.fecha IS 'FECHA EN QUE SE REALIZO LA ACCION';
COMMENT ON COLUMN tecabix_sce_historial.plantel_historial.id_accion IS 'TIPO DE ACCION QUE SE REALIZO, CATALOGO_TIPO = CRUD';
COMMENT ON COLUMN tecabix_sce_historial.plantel_historial.id_usuario_modificado IS 'USUARIO QUE REALIZO LA ACCION';
COMMENT ON COLUMN tecabix_sce_historial.plantel_historial.descripcion IS 'DESCRIPCION DE LA ACCION';

ALTER TABLE tecabix_sce_historial.plantel_historial ADD CONSTRAINT fk_plantel_historial_id_accion FOREIGN KEY (id_accion)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce_historial.plantel_historial ADD CONSTRAINT fk_plantel_historial_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;



CREATE SEQUENCE tecabix_sce_historial.banco_historial_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce_historial.banco_historial_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce_historial.banco_historial(
	id_banco_historial bigint NOT NULL DEFAULT nextval('tecabix_sce_historial.banco_historial_seq'::regclass),
	id_banco bigint NOT NULL,
    fecha timestamp without time zone NOT NULL DEFAULT now (),
    id_accion bigint NOT NULL,
    id_usuario_modificado bigint NOT NULL,
	descripcion character varying(150) NOT NULL,
CONSTRAINT pk_banco_historial_id_banco_historial PRIMARY KEY (id_banco_historial)
);
COMMENT ON TABLE tecabix_sce_historial.banco_historial IS 'HISTORIAL DEL banco';
COMMENT ON COLUMN tecabix_sce_historial.banco_historial.id_banco_historial IS 'IDENTIFICADOR UNICO DEL HISTORIAL DEL BANCO';
COMMENT ON COLUMN tecabix_sce_historial.banco_historial.id_banco IS 'IDENTIFICADOR UNICO DEL BANCO';
COMMENT ON COLUMN tecabix_sce_historial.banco_historial.fecha IS 'FECHA EN QUE SE REALIZO LA ACCION';
COMMENT ON COLUMN tecabix_sce_historial.banco_historial.id_accion IS 'TIPO DE ACCION QUE SE REALIZO, CATALOGO_TIPO = CRUD';
COMMENT ON COLUMN tecabix_sce_historial.banco_historial.id_usuario_modificado IS 'USUARIO QUE REALIZO LA ACCION';
COMMENT ON COLUMN tecabix_sce_historial.banco_historial.descripcion IS 'DESCRIPCION DE LA ACCION';

ALTER TABLE tecabix_sce_historial.banco_historial ADD CONSTRAINT fk_banco_historial_id_accion FOREIGN KEY (id_accion)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce_historial.banco_historial ADD CONSTRAINT fk_banco_historial_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;



CREATE SEQUENCE tecabix_sce_historial.estado_historial_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce_historial.estado_historial_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce_historial.estado_historial(
	id_estado_historial bigint NOT NULL DEFAULT nextval('tecabix_sce_historial.estado_historial_seq'::regclass),
	id_estado bigint NOT NULL,
    fecha timestamp without time zone NOT NULL DEFAULT now (),
    id_accion bigint NOT NULL,
    id_usuario_modificado bigint NOT NULL,
	descripcion character varying(150) NOT NULL,
CONSTRAINT pk_estado_historial_id_estado_historial PRIMARY KEY (id_estado_historial)
);
COMMENT ON TABLE tecabix_sce_historial.estado_historial IS 'HISTORIAL DEL ESTADO';
COMMENT ON COLUMN tecabix_sce_historial.estado_historial.id_estado_historial IS 'IDENTIFICADOR UNICO DEL HISTORIAL DEL ESTADO';
COMMENT ON COLUMN tecabix_sce_historial.estado_historial.id_estado IS 'IDENTIFICADOR UNICO DEL ESTADO';
COMMENT ON COLUMN tecabix_sce_historial.estado_historial.fecha IS 'FECHA EN QUE SE REALIZO LA ACCION';
COMMENT ON COLUMN tecabix_sce_historial.estado_historial.id_accion IS 'TIPO DE ACCION QUE SE REALIZO, CATALOGO_TIPO = CRUD';
COMMENT ON COLUMN tecabix_sce_historial.estado_historial.id_usuario_modificado IS 'USUARIO QUE REALIZO LA ACCION';
COMMENT ON COLUMN tecabix_sce_historial.estado_historial.descripcion IS 'DESCRIPCION DE LA ACCION';

ALTER TABLE tecabix_sce_historial.estado_historial ADD CONSTRAINT fk_estado_historial_id_accion FOREIGN KEY (id_accion)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce_historial.estado_historial ADD CONSTRAINT fk_estado_historial_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;



CREATE SEQUENCE tecabix_sce_historial.municipio_historial_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce_historial.municipio_historial_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce_historial.municipio_historial(
	id_municipio_historial bigint NOT NULL DEFAULT nextval('tecabix_sce_historial.municipio_historial_seq'::regclass),
	id_municipio bigint NOT NULL,
    fecha timestamp without time zone NOT NULL DEFAULT now (),
    id_accion bigint NOT NULL,
    id_usuario_modificado bigint NOT NULL,
	descripcion character varying(150) NOT NULL,
CONSTRAINT pk_municipio_historial_id_municipio_historial PRIMARY KEY (id_municipio_historial)
);
COMMENT ON TABLE tecabix_sce_historial.municipio_historial IS 'HISTORIAL DEL MUNICIPIO';
COMMENT ON COLUMN tecabix_sce_historial.municipio_historial.id_municipio_historial IS 'IDENTIFICADOR UNICO DEL HISTORIAL DEL MUNICIPIO';
COMMENT ON COLUMN tecabix_sce_historial.municipio_historial.id_municipio IS 'IDENTIFICADOR UNICO DEL MUNICIPIO';
COMMENT ON COLUMN tecabix_sce_historial.municipio_historial.fecha IS 'FECHA EN QUE SE REALIZO LA ACCION';
COMMENT ON COLUMN tecabix_sce_historial.municipio_historial.id_accion IS 'TIPO DE ACCION QUE SE REALIZO, CATALOGO_TIPO = CRUD';
COMMENT ON COLUMN tecabix_sce_historial.municipio_historial.id_usuario_modificado IS 'USUARIO QUE REALIZO LA ACCION';
COMMENT ON COLUMN tecabix_sce_historial.municipio_historial.descripcion IS 'DESCRIPCION DE LA ACCION';

ALTER TABLE tecabix_sce_historial.municipio_historial ADD CONSTRAINT fk_municipio_historial_id_accion FOREIGN KEY (id_accion)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce_historial.municipio_historial ADD CONSTRAINT fk_municipio_historial_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;



CREATE SEQUENCE tecabix_sce_historial.plan_historial_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce_historial.plan_historial_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce_historial.plan_historial(
	id_plan_historial bigint NOT NULL DEFAULT nextval('tecabix_sce_historial.plan_historial_seq'::regclass),
	id_plan bigint NOT NULL,
    fecha timestamp without time zone NOT NULL DEFAULT now (),
    id_accion bigint NOT NULL,
    id_usuario_modificado bigint NOT NULL,
	descripcion character varying(150) NOT NULL,
CONSTRAINT pk_plan_historial_id_plan_historial PRIMARY KEY (id_plan_historial)
);
COMMENT ON TABLE tecabix_sce_historial.plan_historial IS 'HISTORIAL DEL PLAN';
COMMENT ON COLUMN tecabix_sce_historial.plan_historial.id_plan_historial IS 'IDENTIFICADOR UNICO DEL HISTORIAL DEL PLAN';
COMMENT ON COLUMN tecabix_sce_historial.plan_historial.id_plan IS 'IDENTIFICADOR UNICO DEL PLAN';
COMMENT ON COLUMN tecabix_sce_historial.plan_historial.fecha IS 'FECHA EN QUE SE REALIZO LA ACCION';
COMMENT ON COLUMN tecabix_sce_historial.plan_historial.id_accion IS 'TIPO DE ACCION QUE SE REALIZO, CATALOGO_TIPO = CRUD';
COMMENT ON COLUMN tecabix_sce_historial.plan_historial.id_usuario_modificado IS 'USUARIO QUE REALIZO LA ACCION';
COMMENT ON COLUMN tecabix_sce_historial.plan_historial.descripcion IS 'DESCRIPCION DE LA ACCION';

ALTER TABLE tecabix_sce_historial.plan_historial ADD CONSTRAINT fk_plan_historial_id_accion FOREIGN KEY (id_accion)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce_historial.plan_historial ADD CONSTRAINT fk_plan_historial_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;



CREATE SEQUENCE tecabix_sce_historial.servicio_historial_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce_historial.servicio_historial_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce_historial.servicio_historial(
	id_servicio_historial bigint NOT NULL DEFAULT nextval('tecabix_sce_historial.servicio_historial_seq'::regclass),
	id_servicio bigint NOT NULL,
    fecha timestamp without time zone NOT NULL DEFAULT now (),
    id_accion bigint NOT NULL,
    id_usuario_modificado bigint NOT NULL,
	descripcion character varying(150) NOT NULL,
CONSTRAINT pk_servicio_historial_id_servicio_historial PRIMARY KEY (id_servicio_historial)
);
COMMENT ON TABLE tecabix_sce_historial.servicio_historial IS 'HISTORIAL DEL SERVICIO';
COMMENT ON COLUMN tecabix_sce_historial.servicio_historial.id_servicio_historial IS 'IDENTIFICADOR UNICO DEL HISTORIAL DEL SERVICIO';
COMMENT ON COLUMN tecabix_sce_historial.servicio_historial.id_servicio IS 'IDENTIFICADOR UNICO DEL SERVICIO';
COMMENT ON COLUMN tecabix_sce_historial.servicio_historial.fecha IS 'FECHA EN QUE SE REALIZO LA ACCION';
COMMENT ON COLUMN tecabix_sce_historial.servicio_historial.id_accion IS 'TIPO DE ACCION QUE SE REALIZO, CATALOGO_TIPO = CRUD';
COMMENT ON COLUMN tecabix_sce_historial.servicio_historial.id_usuario_modificado IS 'USUARIO QUE REALIZO LA ACCION';
COMMENT ON COLUMN tecabix_sce_historial.servicio_historial.descripcion IS 'DESCRIPCION DE LA ACCION';

ALTER TABLE tecabix_sce_historial.servicio_historial ADD CONSTRAINT fk_servicio_historial_id_accion FOREIGN KEY (id_accion)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce_historial.servicio_historial ADD CONSTRAINT fk_servicio_historial_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;




CREATE SEQUENCE tecabix_sce_historial.plan_servicio_historial_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce_historial.plan_servicio_historial_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce_historial.plan_servicio_historial(
	id_plan_servicio_historial bigint NOT NULL DEFAULT nextval('tecabix_sce_historial.plan_servicio_historial_seq'::regclass),
	id_plan_servicio bigint NOT NULL,
    fecha timestamp without time zone NOT NULL DEFAULT now (),
    id_accion bigint NOT NULL,
    id_usuario_modificado bigint NOT NULL,
	descripcion character varying(150) NOT NULL,
CONSTRAINT pk_plan_servicio_historial_id_plan_servicio_historial PRIMARY KEY (id_plan_servicio_historial)
);
COMMENT ON TABLE tecabix_sce_historial.plan_servicio_historial IS 'HISTORIAL DEL PLAN SERVICIO';
COMMENT ON COLUMN tecabix_sce_historial.plan_servicio_historial.id_plan_servicio_historial IS 'IDENTIFICADOR UNICO DEL HISTORIAL DEL PLAN SERVICIO';
COMMENT ON COLUMN tecabix_sce_historial.plan_servicio_historial.id_plan_servicio IS 'IDENTIFICADOR UNICO DEL PLAN SERVICIO';
COMMENT ON COLUMN tecabix_sce_historial.plan_servicio_historial.fecha IS 'FECHA EN QUE SE REALIZO LA ACCION';
COMMENT ON COLUMN tecabix_sce_historial.plan_servicio_historial.id_accion IS 'TIPO DE ACCION QUE SE REALIZO, CATALOGO_TIPO = CRUD';
COMMENT ON COLUMN tecabix_sce_historial.plan_servicio_historial.id_usuario_modificado IS 'USUARIO QUE REALIZO LA ACCION';
COMMENT ON COLUMN tecabix_sce_historial.plan_servicio_historial.descripcion IS 'DESCRIPCION DE LA ACCION';

ALTER TABLE tecabix_sce_historial.plan_servicio_historial ADD CONSTRAINT fk_plan_servicio_historial_id_accion FOREIGN KEY (id_accion)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce_historial.plan_servicio_historial ADD CONSTRAINT fk_plan_servicio_historial_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;



CREATE SEQUENCE tecabix_sce_historial.correo_historial_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
    ALTER SEQUENCE tecabix_sce_historial.correo_historial_seq
    OWNER TO postgres;

CREATE TABLE tecabix_sce_historial.correo_historial(
	id_correo_historial bigint NOT NULL DEFAULT nextval('tecabix_sce_historial.correo_historial_seq'::regclass),
	id_correo bigint NOT NULL,
    fecha timestamp without time zone NOT NULL DEFAULT now (),
    id_accion bigint NOT NULL,
    id_usuario_modificado bigint NOT NULL,
	descripcion character varying(150) NOT NULL,
CONSTRAINT pk_correo_historial_id_correo_historial PRIMARY KEY (id_correo_historial)
);
COMMENT ON TABLE tecabix_sce_historial.correo_historial IS 'HISTORIAL DE LA correo';
COMMENT ON COLUMN tecabix_sce_historial.correo_historial.id_correo_historial IS 'IDENTIFICADOR UNICO DEL HISTORIAL DEL correo';
COMMENT ON COLUMN tecabix_sce_historial.correo_historial.id_correo IS 'IDENTIFICADOR UNICO DE LA correo';
COMMENT ON COLUMN tecabix_sce_historial.correo_historial.fecha IS 'FECHA EN QUE SE REALIZO LA ACCION';
COMMENT ON COLUMN tecabix_sce_historial.correo_historial.id_accion IS 'TIPO DE ACCION QUE SE REALIZO, CATALOGO_TIPO = CRUD';
COMMENT ON COLUMN tecabix_sce_historial.correo_historial.id_usuario_modificado IS 'USUARIO QUE REALIZO LA ACCION';
COMMENT ON COLUMN tecabix_sce_historial.correo_historial.descripcion IS 'DESCRIPCION DE LA ACCION';

ALTER TABLE tecabix_sce_historial.correo_historial ADD CONSTRAINT fk_correo_historial_id_accion FOREIGN KEY (id_accion)
REFERENCES tecabix_sce.catalogo(id_catalogo) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE tecabix_sce_historial.correo_historial ADD CONSTRAINT fk_correo_historial_id_usuario_modificado FOREIGN KEY (id_usuario_modificado)
REFERENCES tecabix_sce.usuario(id_usuario) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;


/************************************ TRIGGER ************************************/




/******** CATALOGO TIPO ********/

CREATE FUNCTION tecabix_sce.trg_catalogo_tipo_after_insert() RETURNS TRIGGER AS $$ 
DECLARE
    item_aux        RECORD;
    var_insert      bigint;
BEGIN
    SELECT id_catalogo INTO var_insert FROM tecabix_sce.catalogo WHERE nombre = 'CREAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
    
    INSERT INTO tecabix_sce_historial.catalogo_tipo_historial (id_catalogo_tipo, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_catalogo_tipo,var_insert, NEW.id_usuario_modificado, 'Se creo un nuevo registro '|| NEW.nombre);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


/**/
CREATE FUNCTION tecabix_sce.trg_catalogo_tipo_after_update() RETURNS TRIGGER AS $$ 
DECLARE
    item_aux        RECORD;
    var_update      bigint;
    id_aux_1        character varying(45);
    id_aux_2        character varying(45);
BEGIN
    SELECT id_catalogo INTO var_update FROM tecabix_sce.catalogo WHERE nombre = 'ACTUALIZAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
    
    IF OLD.nombre != NEW.nombre THEN
        INSERT INTO tecabix_sce_historial.catalogo_tipo_historial (id_catalogo_tipo, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_catalogo_tipo,var_update, NEW.id_usuario_modificado, 'Se actualizo el nombre de '|| OLD.nombre || ' a ' || NEW.nombre);
    END IF;

    IF OLD.id_estatus != NEW.id_estatus THEN
        SELECT nombre INTO id_aux_1 FROM tecabix_sce.catalogo WHERE id_catalogo = OLD.id_estatus;
        SELECT nombre INTO id_aux_2 FROM tecabix_sce.catalogo WHERE id_catalogo = NEW.id_estatus;
        INSERT INTO tecabix_sce_historial.catalogo_tipo_historial (id_catalogo_tipo, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_catalogo_tipo,var_update, NEW.id_usuario_modificado, 'Se actualizo el estatus de '|| id_aux_1 || ' a ' || id_aux_2);
    END IF;

    IF OLD.descripcion != NEW.descripcion THEN
        INSERT INTO tecabix_sce_historial.catalogo_tipo_historial (id_catalogo_tipo, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_catalogo_tipo,var_update, NEW.id_usuario_modificado, 'Se actualizo la descripción');
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;



/**/
CREATE FUNCTION tecabix_sce.trg_catalogo_tipo_after_delete() RETURNS TRIGGER AS $$ 
DECLARE
    item_aux        RECORD;
    var_delete      bigint;
    id_aux_1        bigint;
    id_aux_2        bigint;
BEGIN
    SELECT id_catalogo INTO var_delete FROM tecabix_sce.catalogo WHERE nombre = 'ELIMINAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
    
    INSERT INTO tecabix_sce_historial.catalogo_tipo_historial (id_catalogo_tipo, id_accion, id_usuario_modificado, descripcion) 
        VALUES(OLD.id_catalogo_tipo,var_delete, OLD.id_usuario_modificado, 'Se elimino el registro '|| OLD.nombre);

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_catalogo_tipo_after_delete
    AFTER DELETE
    ON tecabix_sce.catalogo_tipo
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_catalogo_tipo_after_delete();



/******** CATALOGO ********/

CREATE FUNCTION tecabix_sce.trg_catalogo_after_insert() RETURNS TRIGGER AS $$ 
DECLARE
    item_aux        RECORD;
    var_insert      bigint;
BEGIN
    SELECT id_catalogo INTO var_insert FROM tecabix_sce.catalogo WHERE nombre = 'CREAR' AND id_catalogo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
    
    INSERT INTO tecabix_sce_historial.catalogo_historial (id_catalogo, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_catalogo,var_insert, NEW.id_usuario_modificado, 'Se creo un nuevo registro '|| NEW.nombre);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


/**/
CREATE FUNCTION tecabix_sce.trg_catalogo_after_update() RETURNS TRIGGER AS $$ 
DECLARE
    item_aux        RECORD;
    var_update      bigint;
    id_aux_1        character varying(45);
    id_aux_2        character varying(45);
BEGIN
    SELECT id_catalogo INTO var_update FROM tecabix_sce.catalogo WHERE nombre = 'ACTUALIZAR' AND id_catalogo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
    
    IF OLD.nombre != NEW.nombre THEN
        INSERT INTO tecabix_sce_historial.catalogo_historial (id_catalogo, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_catalogo,var_update, NEW.id_usuario_modificado, 'Se actualizo el nombre de '|| OLD.nombre || ' a ' || NEW.nombre);
    END IF;

    IF OLD.id_estatus != NEW.id_estatus THEN
        SELECT nombre INTO id_aux_1 FROM tecabix_sce.catalogo WHERE id_catalogo = OLD.id_estatus;
        SELECT nombre INTO id_aux_2 FROM tecabix_sce.catalogo WHERE id_catalogo = NEW.id_estatus;
        INSERT INTO tecabix_sce_historial.catalogo_historial (id_catalogo, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_catalogo,var_update, NEW.id_usuario_modificado, 'Se actualizo el estatus de '|| id_aux_1 || ' a ' || id_aux_2);
    END IF;

    IF OLD.descripcion != NEW.descripcion THEN
        INSERT INTO tecabix_sce_historial.catalogo_historial (id_catalogo, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_catalogo,var_update, NEW.id_usuario_modificado, 'Se actualizo la descripción');
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;



/**/
CREATE FUNCTION tecabix_sce.trg_catalogo_after_delete() RETURNS TRIGGER AS $$ 
DECLARE
    item_aux        RECORD;
    var_delete      bigint;
    id_aux_1        bigint;
    id_aux_2        bigint;
BEGIN
    SELECT id_catalogo INTO var_delete FROM tecabix_sce.catalogo WHERE nombre = 'ELIMINAR' AND id_catalogo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
    
    INSERT INTO tecabix_sce_historial.catalogo_historial (id_catalogo, id_accion, id_usuario_modificado, descripcion) 
        VALUES(OLD.id_catalogo,var_delete, OLD.id_usuario_modificado, 'Se elimino el registro '|| OLD.nombre);

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_catalogo_after_delete
    AFTER DELETE
    ON tecabix_sce.catalogo
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_catalogo_after_delete();


/******** AUTHORITY ********/
CREATE FUNCTION tecabix_sce.trg_authority_before_delate() RETURNS TRIGGER AS $$ 
DECLARE
    item_aux        RECORD;
BEGIN

    DELETE FROM tecabix_sce.perfil_authority  WHERE id_authority = OLD.id_authority;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_authority_before_delate
    BEFORE DELETE
    ON tecabix_sce.authority
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_authority_before_delate();

/**/
CREATE FUNCTION tecabix_sce.trg_authority_after_insert() RETURNS TRIGGER AS $$ 
DECLARE
    item_aux        RECORD;
    var_insert      bigint;
BEGIN
    SELECT id_catalogo INTO var_insert FROM tecabix_sce.catalogo WHERE nombre = 'CREAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
    
    INSERT INTO tecabix_sce_historial.authority_historial (id_authority, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_authority,var_insert, NEW.id_usuario_modificado, 'Se creo un nuevo registro '|| NEW.nombre );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_authority_after_insert
    AFTER INSERT
    ON tecabix_sce.authority
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_authority_after_insert();

/**/
CREATE FUNCTION tecabix_sce.trg_authority_after_update() RETURNS TRIGGER AS $$ 
DECLARE
    item_aux        RECORD;
    var_update      bigint;
    id_aux_1        character varying(45);
    id_aux_2        character varying(45);
BEGIN
    SELECT id_catalogo INTO var_update FROM tecabix_sce.catalogo WHERE nombre = 'ACTUALIZAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
    
    IF OLD.nombre != NEW.nombre THEN
        INSERT INTO tecabix_sce_historial.authority_historial (id_authority, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_authority,var_update, NEW.id_usuario_modificado, 'Se actualizo el nombre de '|| OLD.nombre || ' a ' || NEW.nombre);
    END IF;

    IF OLD.id_estatus != NEW.id_estatus THEN
        SELECT nombre INTO id_aux_1 FROM tecabix_sce.catalogo WHERE id_catalogo = OLD.id_estatus;
        SELECT nombre INTO id_aux_2 FROM tecabix_sce.catalogo WHERE id_catalogo = NEW.id_estatus;
        INSERT INTO tecabix_sce_historial.authority_historial (id_authority, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_authority,var_update, NEW.id_usuario_modificado, 'Se actualizo el estatus de '|| id_aux_1 || ' a ' || id_aux_2);
    END IF;

    IF OLD.descripcion != NEW.descripcion THEN
        INSERT INTO tecabix_sce_historial.authority_historial (id_authority, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_authority,var_update, NEW.id_usuario_modificado, 'Se actualizo la descripción');
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_authority_after_update
    AFTER UPDATE
    ON tecabix_sce.authority
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_authority_after_update();

/**/
CREATE FUNCTION tecabix_sce.trg_authority_after_delete() RETURNS TRIGGER AS $$ 
DECLARE
    item_aux        RECORD;
    var_delete      bigint;
    id_aux_1        bigint;
    id_aux_2        bigint;
BEGIN
    SELECT id_catalogo INTO var_delete FROM tecabix_sce.catalogo WHERE nombre = 'ELIMINAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
    
    INSERT INTO tecabix_sce_historial.authority_historial (id_authority, id_accion, id_usuario_modificado, descripcion) 
        VALUES(OLD.id_authority,var_delete, OLD.id_usuario_modificado, 'Se elimino el registro');

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_authority_after_delete
    AFTER DELETE
    ON tecabix_sce.authority
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_authority_after_delete();


/******** PERFIL ********/
CREATE FUNCTION tecabix_sce.trg_perfil_before_delate() RETURNS TRIGGER AS $$ 
DECLARE
	item_aux 		RECORD;
BEGIN
	FOR item_aux IN SELECT * FROM tecabix_sce.usuario WHERE id_perfil = OLD.id_perfil LOOP
		UPDATE tecabix_sce.usuario SET id_perfil = NULL WHERE id_usuario = item_aux.id_usuario;
	END LOOP;

    FOR item_aux IN SELECT * FROM tecabix_sce.perfil_authority WHERE id_perfil = OLD.id_perfil LOOP
		DELETE FROM tecabix_sce.perfil_authority  WHERE id_perfil_authority = item_aux.id_perfil_authority;
	END LOOP;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_perfil_before_delate
    BEFORE DELETE
    ON tecabix_sce.perfil
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_perfil_before_delate();

/**/
CREATE FUNCTION tecabix_sce.trg_perfil_after_insert() RETURNS TRIGGER AS $$ 
DECLARE
	item_aux 		RECORD;
    var_insert      bigint;
BEGIN
    SELECT id_catalogo INTO var_insert FROM tecabix_sce.catalogo WHERE nombre = 'CREAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
	
	INSERT INTO tecabix_sce_historial.perfil_historial (id_perfil, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_perfil,var_insert, NEW.id_usuario_modificado, 'Se creo un nuevo registro' );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_perfil_after_insert
    AFTER INSERT
    ON tecabix_sce.perfil
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_perfil_after_insert();

/**/
CREATE FUNCTION tecabix_sce.trg_perfil_after_update() RETURNS TRIGGER AS $$ 
DECLARE
	item_aux 		RECORD;
    var_update      bigint;
    id_aux_1		character varying(45);
    id_aux_2		character varying(45);
BEGIN
    SELECT id_catalogo INTO var_update FROM tecabix_sce.catalogo WHERE nombre = 'ACTUALIZAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
	
    IF OLD.nombre != NEW.nombre THEN
        INSERT INTO tecabix_sce_historial.perfil_historial (id_perfil, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_perfil,var_update, NEW.id_usuario_modificado, 'Se actualizo el nombre de '|| OLD.nombre || ' a ' || NEW.nombre);
    END IF;

    IF OLD.id_estatus != NEW.id_estatus THEN
        SELECT nombre INTO id_aux_1 FROM tecabix_sce.catalogo WHERE id_catalogo = OLD.id_estatus;
        SELECT nombre INTO id_aux_2 FROM tecabix_sce.catalogo WHERE id_catalogo = NEW.id_estatus;
        INSERT INTO tecabix_sce_historial.perfil_historial (id_perfil, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_perfil,var_update, NEW.id_usuario_modificado, 'Se actualizo el estatus de '|| id_aux_1 || ' a ' || id_aux_2);
    END IF;

    IF OLD.descripcion != NEW.descripcion THEN
        INSERT INTO tecabix_sce_historial.perfil_historial (id_perfil, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_perfil,var_update, NEW.id_usuario_modificado, 'Se actualizo la descripción');
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_perfil_after_update
    AFTER UPDATE
    ON tecabix_sce.perfil
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_perfil_after_update();

/**/
CREATE FUNCTION tecabix_sce.trg_perfil_after_delete() RETURNS TRIGGER AS $$ 
DECLARE
	item_aux 		RECORD;
    var_delete      bigint;
    id_aux_1		bigint;
    id_aux_2		bigint;
BEGIN
    SELECT id_catalogo INTO var_delete FROM tecabix_sce.catalogo WHERE nombre = 'ELIMINAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
	
    INSERT INTO tecabix_sce_historial.perfil_historial (id_perfil, id_accion, id_usuario_modificado, descripcion) 
        VALUES(OLD.id_perfil,var_delete, OLD.id_usuario_modificado, 'Se elimino el registro');

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_perfil_after_delete
    AFTER DELETE
    ON tecabix_sce.perfil
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_perfil_after_delete();

/******** configuracion ********/

CREATE FUNCTION tecabix_sce.trg_configuracion_after_insert() RETURNS TRIGGER AS $$ 
DECLARE
	item_aux 		RECORD;
    var_insert      bigint;
BEGIN
    SELECT id_catalogo INTO var_insert FROM tecabix_sce.catalogo WHERE nombre = 'CREAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
	
	INSERT INTO tecabix_sce_historial.configuracion_historial (id_configuracion, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_configuracion,var_insert, NEW.id_usuario_modificado, 'Se creo un nuevo registro' );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_configuracion_after_insert
    AFTER INSERT
    ON tecabix_sce.configuracion
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_configuracion_after_insert();


/**/
CREATE FUNCTION tecabix_sce.trg_configuracion_after_update() RETURNS TRIGGER AS $$ 
DECLARE
	item_aux 		RECORD;
    var_update      bigint;
    id_aux_1		character varying(45);
    id_aux_2		character varying(45);
BEGIN
    SELECT id_catalogo INTO var_update FROM tecabix_sce.catalogo WHERE nombre = 'ACTUALIZAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
	
    IF OLD.id_tipo != NEW.id_tipo THEN
        INSERT INTO tecabix_sce_historial.configuracion_historial (id_configuracion, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_configuracion,var_update, NEW.id_usuario_modificado, 'Se actualizo el tipo de variable de '|| OLD.id_tipo || ' a ' || NEW.id_tipo);
    END IF;
    IF OLD.valor != NEW.valor THEN
        INSERT INTO tecabix_sce_historial.configuracion_historial (id_configuracion, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_configuracion,var_update, NEW.id_usuario_modificado, 'Se actualizo el valor de'|| OLD.valor || ' a ' || NEW.valor);
    END IF;

    IF OLD.id_estatus != NEW.id_estatus THEN
        SELECT nombre INTO id_aux_1 FROM tecabix_sce.catalogo WHERE id_catalogo = OLD.id_estatus;
        SELECT nombre INTO id_aux_2 FROM tecabix_sce.catalogo WHERE id_catalogo = NEW.id_estatus;
        INSERT INTO tecabix_sce_historial.configuracion_historial (id_configuracion, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_configuracion,var_update, NEW.id_usuario_modificado, 'Se actualizo el estatus de '|| id_aux_1 || ' a ' || id_aux_2);
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_configuracion_after_update
    AFTER UPDATE
    ON tecabix_sce.configuracion
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_configuracion_after_update();



/******** usuario ********/

CREATE FUNCTION tecabix_sce.trg_usuario_after_insert() RETURNS TRIGGER AS $$ 
DECLARE
	item_aux 		RECORD;
    var_insert      bigint;
BEGIN
    SELECT id_catalogo INTO var_insert FROM tecabix_sce.catalogo WHERE nombre = 'CREAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
	IF NEW.id_usuario_modificado IS NOT NULL THEN
        INSERT INTO tecabix_sce_historial.usuario_historial (id_usuario, id_accion, id_usuario_modificado, descripcion) 
            VALUES(NEW.id_usuario,var_insert, NEW.id_usuario_modificado, 'Se creo un nuevo registro' );
    ELSE  
        INSERT INTO tecabix_sce_historial.usuario_historial (id_usuario, id_accion, id_usuario_modificado, descripcion) 
            VALUES(NEW.id_usuario,var_insert, NEW.id_usuario, 'Se creo un nuevo registro' );
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;



/**/
CREATE FUNCTION tecabix_sce.trg_usuario_after_update() RETURNS TRIGGER AS $$ 
DECLARE
    var_update      bigint;
    id_aux_1		character varying(45);
    id_aux_2		character varying(45);
BEGIN
    SELECT id_catalogo INTO var_update FROM tecabix_sce.catalogo WHERE nombre = 'ACTUALIZAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
	
    IF OLD.nombre != NEW.nombre THEN
        INSERT INTO tecabix_sce_historial.usuario_historial (id_usuario, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_usuario,var_update, NEW.id_usuario_modificado, 'Se actualizo el nombre de '|| OLD.nombre || ' a ' || NEW.nombre);
    END IF;

    IF OLD.psw != NEW.psw THEN
        INSERT INTO tecabix_sce_historial.usuario_historial (id_usuario, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_usuario,var_update, NEW.id_usuario_modificado, 'Se actualizo la CONTRASEÑA');
    END IF;

    IF OLD.correo != NEW.correo THEN
        INSERT INTO tecabix_sce_historial.usuario_historial (id_usuario, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_usuario,var_update, NEW.id_usuario_modificado, 'Se actualizo el CORREO DE '|| OLD.correo || ' a ' || NEW.correo);
    END IF;

    IF NEW.id_perfil IS NOT NULL THEN
        IF OLD.id_perfil != NEW.id_perfil THEN
            SELECT nombre INTO id_aux_1 FROM tecabix_sce.perfil WHERE id_perfil = OLD.id_perfil;
            SELECT nombre INTO id_aux_2 FROM tecabix_sce.perfil WHERE id_perfil = NEW.id_perfil;

            INSERT INTO tecabix_sce_historial.usuario_historial (id_usuario, id_accion, id_usuario_modificado, descripcion) 
            VALUES(NEW.id_usuario,var_update, NEW.id_usuario_modificado, 'Se actualizo el PERFIL DE '|| id_aux_1 || ' a ' || id_aux_2);
        END IF;
    END IF;

    IF OLD.id_estatus != NEW.id_estatus THEN
        SELECT nombre INTO id_aux_1 FROM tecabix_sce.catalogo WHERE id_catalogo = OLD.id_estatus;
        SELECT nombre INTO id_aux_2 FROM tecabix_sce.catalogo WHERE id_catalogo = NEW.id_estatus;
        INSERT INTO tecabix_sce_historial.usuario_historial (id_usuario, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_usuario,var_update, NEW.id_usuario_modificado, 'Se actualizo el estatus de '|| id_aux_1 || ' a ' || id_aux_2);
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;



/******** trabajador ********/
CREATE FUNCTION tecabix_sce.trg_trabajador_before_delate() RETURNS TRIGGER AS $$ 
DECLARE
	item_aux 		RECORD;
    var_activo		bigint;
BEGIN

    SELECT id_catalogo INTO var_activo FROM tecabix_sce.catalogo WHERE nombre = 'ELIMINADO' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'ESTATUS');

    IF var_activo != OLD.id_estatus THEN
        RETURN NULL;
    END IF;

	FOR item_aux IN SELECT * FROM tecabix_sce.trabajador WHERE id_jefe = OLD.id_trabajador LOOP
		UPDATE tecabix_sce.trabajador SET id_jefe = OLD.id_jefe WHERE id_trabajador = item_aux.id_trabajador;
	END LOOP;

    FOR item_aux IN SELECT * FROM tecabix_sce.plantel WHERE id_gerente = OLD.id_trabajador LOOP
		UPDATE tecabix_sce.plantel SET id_gerente = OLD.id_jefe WHERE id_plantel = item_aux.id_plantel;
	END LOOP;

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_trabajador_before_delate
    BEFORE DELETE
    ON tecabix_sce.trabajador
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_trabajador_before_delate();

/******** persona_fisica ********/
CREATE FUNCTION tecabix_sce.trg_persona_fisica_before_delate() RETURNS TRIGGER AS $$ 
DECLARE
	item_aux 		RECORD;
    var_activo		bigint;
BEGIN

    SELECT id_catalogo INTO var_activo FROM tecabix_sce.catalogo WHERE nombre = 'ELIMINADO' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'ESTATUS');

    IF var_activo != OLD.id_estatus THEN
        RETURN NULL;
    END IF;

	DELETE FROM  tecabix_sce.trabajador WHERE id_persona_fisica = OLD.id_persona_fisica;
    
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_persona_fisica_before_delate
    BEFORE DELETE
    ON tecabix_sce.persona_fisica
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_persona_fisica_before_delate();

/******** persona_moral ********/

CREATE FUNCTION tecabix_sce.trg_persona_moral_after_insert() RETURNS TRIGGER AS $$ 
DECLARE
	item_aux 		RECORD;
    var_insert      bigint;
BEGIN
    SELECT id_catalogo INTO var_insert FROM tecabix_sce.catalogo WHERE nombre = 'CREAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
	
	INSERT INTO tecabix_sce_historial.persona_moral_historial (id_persona_moral, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_persona_moral,var_insert, NEW.id_usuario_modificado, 'Se creo un nuevo registro' );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_persona_moral_after_insert
    AFTER INSERT
    ON tecabix_sce.persona_moral
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_persona_moral_after_insert();

/**/
CREATE FUNCTION tecabix_sce.trg_persona_moral_after_update() RETURNS TRIGGER AS $$ 
DECLARE
	item_aux 		RECORD;
    var_update      bigint;
    id_aux_1		character varying(45);
    id_aux_2		character varying(45);
BEGIN
    SELECT id_catalogo INTO var_update FROM tecabix_sce.catalogo WHERE nombre = 'ACTUALIZAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
	
    IF OLD.razon_social != NEW.razon_social THEN
        INSERT INTO tecabix_sce_historial.persona_moral_historial (id_persona_moral, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_persona_moral,var_update, NEW.id_usuario_modificado, 'Se actualizo el nombre de '|| OLD.razon_social || ' a ' || NEW.razon_social);
    END IF;

    IF OLD.rfc != NEW.rfc THEN
        INSERT INTO tecabix_sce_historial.persona_moral_historial (id_persona_moral, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_persona_moral,var_update, NEW.id_usuario_modificado, 'Se actualizo el RFC DE '|| OLD.rfc || ' a ' || NEW.rfc);
    END IF;

    IF OLD.fundada != NEW.fundada THEN
        INSERT INTO tecabix_sce_historial.persona_moral_historial (id_persona_moral, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_persona_moral,var_update, NEW.id_usuario_modificado, 'Se actualizo la FECHA DE FUNDACION DE '|| OLD.fundada || ' a ' || NEW.fundada);
    END IF;

    IF OLD.id_estatus != NEW.id_estatus THEN
        SELECT nombre INTO id_aux_1 FROM tecabix_sce.catalogo WHERE id_catalogo = OLD.id_estatus;
        SELECT nombre INTO id_aux_2 FROM tecabix_sce.catalogo WHERE id_catalogo = NEW.id_estatus;
        INSERT INTO tecabix_sce_historial.persona_moral_historial (id_persona_moral, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_persona_moral,var_update, NEW.id_usuario_modificado, 'Se actualizo el estatus de '|| id_aux_1 || ' a ' || id_aux_2);
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_persona_moral_after_update
    AFTER UPDATE
    ON tecabix_sce.persona_moral
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_persona_moral_after_update();

/******** persona_moral ********/

CREATE FUNCTION tecabix_sce.trg_persona_fisica_after_insert() RETURNS TRIGGER AS $$ 
DECLARE
	item_aux 		RECORD;
    var_insert      bigint;
BEGIN
    SELECT id_catalogo INTO var_insert FROM tecabix_sce.catalogo WHERE nombre = 'CREAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
	
	INSERT INTO tecabix_sce_historial.persona_fisica_historial (id_persona_fisica, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_persona_fisica,var_insert, NEW.id_usuario_modificado, 'Se creo un nuevo registro' );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_persona_fisica_after_insert
    AFTER INSERT
    ON tecabix_sce.persona_fisica
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_persona_fisica_after_insert();


/**/
CREATE FUNCTION tecabix_sce.trg_persona_fisica_after_update() RETURNS TRIGGER AS $$ 
DECLARE
	item_aux 		RECORD;
    var_update      bigint;
    id_aux_1		character varying(45);
    id_aux_2		character varying(45);
BEGIN
    SELECT id_catalogo INTO var_update FROM tecabix_sce.catalogo WHERE nombre = 'ACTUALIZAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
	
    IF OLD.nombre != NEW.nombre THEN
        INSERT INTO tecabix_sce_historial.persona_fisica_historial (id_persona_fisica, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_persona_fisica,var_update, NEW.id_usuario_modificado, 'Se actualizo el nombre de '|| OLD.nombre || ' a ' || NEW.nombre);
    END IF;

    IF OLD.apellido_paterno != NEW.apellido_paterno THEN
        INSERT INTO tecabix_sce_historial.persona_fisica_historial (id_persona_fisica, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_persona_fisica,var_update, NEW.id_usuario_modificado, 'Se actualizo el APELLIDO PATERNO DE '|| OLD.apellido_paterno || ' a ' || NEW.apellido_paterno);
    END IF;

    IF OLD.apellido_materno != NEW.apellido_materno THEN
        INSERT INTO tecabix_sce_historial.persona_fisica_historial (id_persona_fisica, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_persona_fisica,var_update, NEW.id_usuario_modificado, 'Se actualizo el APELLIDO MATERNO DE '|| OLD.apellido_materno || ' a ' || NEW.apellido_materno);
    END IF;

    IF NEW.id_sexo IS NOT NULL THEN
        IF OLD.id_estatus != NEW.id_estatus THEN
            SELECT nombre INTO id_aux_1 FROM tecabix_sce.catalogo WHERE id_catalogo = OLD.id_sexo;
            SELECT nombre INTO id_aux_2 FROM tecabix_sce.catalogo WHERE id_catalogo = NEW.id_sexo;
            INSERT INTO tecabix_sce_historial.persona_fisica_historial (id_persona_fisica, id_accion, id_usuario_modificado, descripcion) 
            VALUES(NEW.id_persona_fisica,var_update, NEW.id_usuario_modificado, 'Se actualizo el SEXO DE '|| id_aux_1 || ' a ' || id_aux_2);
        END IF;
    END IF;

    IF OLD.fecha_nacimiento != NEW.fecha_nacimiento THEN
        INSERT INTO tecabix_sce_historial.persona_fisica_historial (id_persona_fisica, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_persona_fisica,var_update, NEW.id_usuario_modificado, 'Se actualizo la FECHA DE NACIMIENTO DE '|| OLD.fecha_nacimiento || ' a ' || NEW.fecha_nacimiento);
    END IF;

    IF OLD.id_estatus != NEW.id_estatus THEN
        SELECT nombre INTO id_aux_1 FROM tecabix_sce.catalogo WHERE id_catalogo = OLD.id_estatus;
        SELECT nombre INTO id_aux_2 FROM tecabix_sce.catalogo WHERE id_catalogo = NEW.id_estatus;
        INSERT INTO tecabix_sce_historial.persona_fisica_historial (id_persona_fisica, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_persona_fisica,var_update, NEW.id_usuario_modificado, 'Se actualizo el estatus de '|| id_aux_1 || ' a ' || id_aux_2);
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_persona_fisica_after_update
    AFTER UPDATE
    ON tecabix_sce.persona_fisica
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_persona_fisica_after_update();


/******** departamento ********/

CREATE FUNCTION tecabix_sce.trg_departamento_after_insert() RETURNS TRIGGER AS $$ 
DECLARE
	item_aux 		RECORD;
    var_insert      bigint;
BEGIN
    SELECT id_catalogo INTO var_insert FROM tecabix_sce.catalogo WHERE nombre = 'CREAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
	
	INSERT INTO tecabix_sce_historial.departamento_historial (id_departamento, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_departamento,var_insert, NEW.id_usuario_modificado, 'Se creo un nuevo registro' );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_departamento_after_insert
    AFTER INSERT
    ON tecabix_sce.departamento
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_departamento_after_insert();


/**/
CREATE FUNCTION tecabix_sce.trg_departamento_after_update() RETURNS TRIGGER AS $$ 
DECLARE
	item_aux 		RECORD;
    var_update      bigint;
    id_aux_1		character varying(45);
    id_aux_2		character varying(45);
BEGIN
    SELECT id_catalogo INTO var_update FROM tecabix_sce.catalogo WHERE nombre = 'ACTUALIZAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
	
    IF OLD.nombre != NEW.nombre THEN
        INSERT INTO tecabix_sce_historial.departamento_historial (id_departamento, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_departamento,var_update, NEW.id_usuario_modificado, 'Se actualizo el nombre de '|| OLD.nombre || ' a ' || NEW.nombre);
    END IF;

    IF OLD.descripcion != NEW.descripcion THEN
        INSERT INTO tecabix_sce_historial.departamento_historial (id_departamento, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_departamento,var_update, NEW.id_usuario_modificado, 'Se actualizo la descripción');
    END IF;

    IF OLD.id_estatus != NEW.id_estatus THEN
        SELECT nombre INTO id_aux_1 FROM tecabix_sce.catalogo WHERE id_catalogo = OLD.id_estatus;
        SELECT nombre INTO id_aux_2 FROM tecabix_sce.catalogo WHERE id_catalogo = NEW.id_estatus;
        INSERT INTO tecabix_sce_historial.departamento_historial (id_departamento, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_departamento,var_update, NEW.id_usuario_modificado, 'Se actualizo el estatus de '|| id_aux_1 || ' a ' || id_aux_2);
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_departamento_after_update
    AFTER UPDATE
    ON tecabix_sce.departamento
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_departamento_after_update();


/******** puesto ********/

CREATE FUNCTION tecabix_sce.trg_puesto_after_insert() RETURNS TRIGGER AS $$ 
DECLARE
	item_aux 		RECORD;
    var_insert      bigint;
BEGIN
    SELECT id_catalogo INTO var_insert FROM tecabix_sce.catalogo WHERE nombre = 'CREAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
	
	INSERT INTO tecabix_sce_historial.puesto_historial (id_puesto, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_puesto,var_insert, NEW.id_usuario_modificado, 'Se creo un nuevo registro' );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_puesto_after_insert
    AFTER INSERT
    ON tecabix_sce.puesto
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_puesto_after_insert();


/**/
CREATE FUNCTION tecabix_sce.trg_puesto_after_update() RETURNS TRIGGER AS $$ 
DECLARE
	item_aux 		RECORD;
    var_update      bigint;
    id_aux_1		character varying(45);
    id_aux_2		character varying(45);
BEGIN
    SELECT id_catalogo INTO var_update FROM tecabix_sce.catalogo WHERE nombre = 'ACTUALIZAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
	
    IF OLD.nombre != NEW.nombre THEN
        INSERT INTO tecabix_sce_historial.puesto_historial (id_puesto, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_puesto,var_update, NEW.id_usuario_modificado, 'Se actualizo el nombre de '|| OLD.nombre || ' a ' || NEW.nombre);
    END IF;

    IF OLD.descripcion != NEW.descripcion THEN
        INSERT INTO tecabix_sce_historial.puesto_historial (id_puesto, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_puesto,var_update, NEW.id_usuario_modificado, 'Se actualizo la descripción');
    END IF;

    IF OLD.id_departamento != NEW.id_departamento THEN
        SELECT nombre INTO id_aux_1 FROM tecabix_sce.departamento WHERE id_departamento = OLD.id_estatus;
        SELECT nombre INTO id_aux_2 FROM tecabix_sce.departamento WHERE id_departamento = NEW.id_estatus;
        INSERT INTO tecabix_sce_historial.puesto_historial (id_puesto, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_puesto,var_update, NEW.id_usuario_modificado, 'Se actualizo el departamento de '|| id_aux_1 || ' a ' || id_aux_2);
    END IF;

    IF OLD.id_estatus != NEW.id_estatus THEN
        SELECT nombre INTO id_aux_1 FROM tecabix_sce.catalogo WHERE id_catalogo = OLD.id_estatus;
        SELECT nombre INTO id_aux_2 FROM tecabix_sce.catalogo WHERE id_catalogo = NEW.id_estatus;
        INSERT INTO tecabix_sce_historial.puesto_historial (id_puesto, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_puesto,var_update, NEW.id_usuario_modificado, 'Se actualizo el estatus de '|| id_aux_1 || ' a ' || id_aux_2);
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_puesto_after_update
    AFTER UPDATE
    ON tecabix_sce.puesto
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_puesto_after_update();

/******** plantel ********/

CREATE FUNCTION tecabix_sce.trg_plantel_after_insert() RETURNS TRIGGER AS $$ 
DECLARE
	item_aux 		RECORD;
    var_insert      bigint;
BEGIN
    SELECT id_catalogo INTO var_insert FROM tecabix_sce.catalogo WHERE nombre = 'CREAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
	
	INSERT INTO tecabix_sce_historial.plantel_historial (id_plantel, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_plantel,var_insert, NEW.id_usuario_modificado, 'Se creo un nuevo registro' );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_plantel_after_insert
    AFTER INSERT
    ON tecabix_sce.plantel
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_plantel_after_insert();


/**/
CREATE FUNCTION tecabix_sce.trg_plantel_after_update() RETURNS TRIGGER AS $$ 
DECLARE
	item_aux 		RECORD;
    var_update      bigint;
    id_aux_1		character varying(45);
    id_aux_2		character varying(45);
BEGIN
    SELECT id_catalogo INTO var_update FROM tecabix_sce.catalogo WHERE nombre = 'ACTUALIZAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
	
    IF OLD.nombre != NEW.nombre THEN
        INSERT INTO tecabix_sce_historial.plantel_historial (id_plantel, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_plantel,var_update, NEW.id_usuario_modificado, 'Se actualizo el nombre de '|| OLD.nombre || ' a ' || NEW.nombre);
    END IF;

    IF OLD.id_gerente != NEW.id_gerente THEN
        SELECT nombre INTO id_aux_1 FROM tecabix_sce.persona_fisica WHERE id_persona_fisica IN (SELECT id_persona_fisica FROM tecabix_sce.trabajador WHERE id_trabajador = OLD.id_gerente);        
        SELECT nombre INTO id_aux_2 FROM tecabix_sce.persona_fisica WHERE id_persona_fisica IN (SELECT id_persona_fisica FROM tecabix_sce.trabajador WHERE id_trabajador = NEW.id_gerente);        
        INSERT INTO tecabix_sce_historial.plantel_historial (id_plantel, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_plantel,var_update, NEW.id_usuario_modificado, 'Se actualizo el GERENTE DE '|| id_aux_1 || ' CON ID DE TRABAJADOR'|| OLD.id_gerente ||' a ' || id_aux_2 || ' CON ID DE TRABAJADOR'|| NEW.id_gerente);
    END IF;

    IF OLD.id_estatus != NEW.id_estatus THEN
        SELECT nombre INTO id_aux_1 FROM tecabix_sce.catalogo WHERE id_catalogo = OLD.id_estatus;
        SELECT nombre INTO id_aux_2 FROM tecabix_sce.catalogo WHERE id_catalogo = NEW.id_estatus;
        INSERT INTO tecabix_sce_historial.plantel_historial (id_plantel, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_plantel,var_update, NEW.id_usuario_modificado, 'Se actualizo el estatus de '|| id_aux_1 || ' a ' || id_aux_2);
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_plantel_after_update
    AFTER UPDATE
    ON tecabix_sce.plantel
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_plantel_after_update();


/******** BANCO ********/
CREATE FUNCTION tecabix_sce.trg_banco_after_insert() RETURNS TRIGGER AS $$ 
DECLARE
	item_aux 		RECORD;
    var_insert      bigint;
BEGIN
    SELECT id_catalogo INTO var_insert FROM tecabix_sce.catalogo WHERE nombre = 'CREAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
	
	INSERT INTO tecabix_sce_historial.banco_historial (id_banco, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_banco,var_insert, NEW.id_usuario_modificado, 'Se creo un nuevo registro '|| NEW.nombre );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_banco_after_insert
    AFTER INSERT
    ON tecabix_sce.banco
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_banco_after_insert();

/**/
CREATE FUNCTION tecabix_sce.trg_banco_after_update() RETURNS TRIGGER AS $$ 
DECLARE
	item_aux 		RECORD;
    var_update      bigint;
    id_aux_1		character varying(45);
    id_aux_2		character varying(45);
BEGIN
    SELECT id_catalogo INTO var_update FROM tecabix_sce.catalogo WHERE nombre = 'ACTUALIZAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
	
    IF OLD.nombre != NEW.nombre THEN
        INSERT INTO tecabix_sce_historial.banco_historial (id_banco, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_banco,var_update, NEW.id_usuario_modificado, 'Se actualizo el nombre de '|| OLD.nombre || ' a ' || NEW.nombre);
    END IF;

    IF OLD.id_estatus != NEW.id_estatus THEN
        SELECT nombre INTO id_aux_1 FROM tecabix_sce.catalogo WHERE id_catalogo = OLD.id_estatus;
        SELECT nombre INTO id_aux_2 FROM tecabix_sce.catalogo WHERE id_catalogo = NEW.id_estatus;
        INSERT INTO tecabix_sce_historial.banco_historial (id_banco, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_banco,var_update, NEW.id_usuario_modificado, 'Se actualizo el estatus de '|| id_aux_1 || ' a ' || id_aux_2);
    END IF;

    IF OLD.razon_social != NEW.razon_social THEN
        INSERT INTO tecabix_sce_historial.banco_historial (id_banco, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_banco,var_update, NEW.id_usuario_modificado, 'Se actualizo la RAZON SOCIAL DE '|| OLD.razon_social || ' a ' || NEW.razon_social);
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_banco_after_update
    AFTER UPDATE
    ON tecabix_sce.banco
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_banco_after_update();

/**/
CREATE FUNCTION tecabix_sce.trg_banco_after_delete() RETURNS TRIGGER AS $$ 
DECLARE
	item_aux 		RECORD;
    var_delete      bigint;
    id_aux_1		bigint;
    id_aux_2		bigint;
BEGIN
    SELECT id_catalogo INTO var_delete FROM tecabix_sce.catalogo WHERE nombre = 'ELIMINAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
	
    INSERT INTO tecabix_sce_historial.banco_historial (id_banco, id_accion, id_usuario_modificado, descripcion) 
        VALUES(OLD.id_banco,var_delete, OLD.id_usuario_modificado, 'Se elimino el registro');

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_banco_after_delete
    AFTER DELETE
    ON tecabix_sce.banco
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_banco_after_delete();


/******** estado ********/
CREATE FUNCTION tecabix_sce.trg_estado_after_insert() RETURNS TRIGGER AS $$ 
DECLARE
	item_aux 		RECORD;
    var_insert      bigint;
BEGIN
    SELECT id_catalogo INTO var_insert FROM tecabix_sce.catalogo WHERE nombre = 'CREAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
	
	INSERT INTO tecabix_sce_historial.estado_historial (id_estado, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_estado,var_insert, NEW.id_usuario_modificado, 'Se creo un nuevo registro '|| upper(NEW.nombre) );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_estado_after_insert
    AFTER INSERT
    ON tecabix_sce.estado
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_estado_after_insert();

/**/
CREATE FUNCTION tecabix_sce.trg_estado_after_update() RETURNS TRIGGER AS $$ 
DECLARE
	item_aux 		RECORD;
    var_update      bigint;
    id_aux_1		character varying(45);
    id_aux_2		character varying(45);
BEGIN
    SELECT id_catalogo INTO var_update FROM tecabix_sce.catalogo WHERE nombre = 'ACTUALIZAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
	
    IF OLD.nombre != NEW.nombre THEN
        INSERT INTO tecabix_sce_historial.estado_historial (id_estado, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_estado,var_update, NEW.id_usuario_modificado, 'Se actualizo el nombre de '|| OLD.nombre || ' a ' || NEW.nombre);
    END IF;

    IF OLD.id_estatus != NEW.id_estatus THEN
        SELECT nombre INTO id_aux_1 FROM tecabix_sce.catalogo WHERE id_catalogo = OLD.id_estatus;
        SELECT nombre INTO id_aux_2 FROM tecabix_sce.catalogo WHERE id_catalogo = NEW.id_estatus;
        INSERT INTO tecabix_sce_historial.estado_historial (id_estado, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_estado,var_update, NEW.id_usuario_modificado, 'Se actualizo el estatus de '|| id_aux_1 || ' a ' || id_aux_2);
    END IF;

    IF OLD.abreviatura != NEW.abreviatura THEN
        INSERT INTO tecabix_sce_historial.estado_historial (id_estado, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_estado,var_update, NEW.id_usuario_modificado, 'Se actualizo la ABREVIACION DE '|| OLD.abreviatura || ' a ' || NEW.abreviatura);
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_estado_after_update
    AFTER UPDATE
    ON tecabix_sce.estado
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_estado_after_update();

/**/
CREATE FUNCTION tecabix_sce.trg_estado_after_delete() RETURNS TRIGGER AS $$ 
DECLARE
	item_aux 		RECORD;
    var_delete      bigint;
    id_aux_1		bigint;
    id_aux_2		bigint;
BEGIN
    SELECT id_catalogo INTO var_delete FROM tecabix_sce.catalogo WHERE nombre = 'ELIMINAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
	
    INSERT INTO tecabix_sce_historial.estado_historial (id_estado, id_accion, id_usuario_modificado, descripcion) 
        VALUES(OLD.id_estado,var_delete, OLD.id_usuario_modificado, 'Se elimino el registro');

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_estado_after_delete
    AFTER DELETE
    ON tecabix_sce.estado
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_estado_after_delete();



/******** municipio ********/
CREATE FUNCTION tecabix_sce.trg_municipio_after_insert() RETURNS TRIGGER AS $$ 
DECLARE
	item_aux 		RECORD;
    var_insert      bigint;
BEGIN
    SELECT id_catalogo INTO var_insert FROM tecabix_sce.catalogo WHERE nombre = 'CREAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
	
	INSERT INTO tecabix_sce_historial.municipio_historial (id_municipio, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_municipio,var_insert, NEW.id_usuario_modificado, 'Se creo un nuevo registro '|| upper(NEW.nombre) );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_municipio_after_insert
    AFTER INSERT
    ON tecabix_sce.municipio
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_municipio_after_insert();

/**/
CREATE FUNCTION tecabix_sce.trg_municipio_after_update() RETURNS TRIGGER AS $$ 
DECLARE
	item_aux 		RECORD;
    var_update      bigint;
    id_aux_1		character varying(45);
    id_aux_2		character varying(45);
BEGIN
    SELECT id_catalogo INTO var_update FROM tecabix_sce.catalogo WHERE nombre = 'ACTUALIZAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
	
    IF OLD.nombre != NEW.nombre THEN
        INSERT INTO tecabix_sce_historial.municipio_historial (id_municipio, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_municipio,var_update, NEW.id_usuario_modificado, 'Se actualizo el nombre de '|| OLD.nombre || ' a ' || NEW.nombre);
    END IF;

    IF OLD.id_estatus != NEW.id_estatus THEN
        SELECT nombre INTO id_aux_1 FROM tecabix_sce.catalogo WHERE id_catalogo = OLD.id_estatus;
        SELECT nombre INTO id_aux_2 FROM tecabix_sce.catalogo WHERE id_catalogo = NEW.id_estatus;
        INSERT INTO tecabix_sce_historial.municipio_historial (id_municipio, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_municipio,var_update, NEW.id_usuario_modificado, 'Se actualizo el estatus de '|| id_aux_1 || ' a ' || id_aux_2);
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_municipio_after_update
    AFTER UPDATE
    ON tecabix_sce.municipio
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_municipio_after_update();

/**/
CREATE FUNCTION tecabix_sce.trg_municipio_after_delete() RETURNS TRIGGER AS $$ 
DECLARE
	item_aux 		RECORD;
    var_delete      bigint;
    id_aux_1		bigint;
    id_aux_2		bigint;
BEGIN
    SELECT id_catalogo INTO var_delete FROM tecabix_sce.catalogo WHERE nombre = 'ELIMINAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
	
    INSERT INTO tecabix_sce_historial.municipio_historial (id_municipio, id_accion, id_usuario_modificado, descripcion) 
        VALUES(OLD.id_municipio,var_delete, OLD.id_usuario_modificado, 'Se elimino el registro');

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_municipio_after_delete
    AFTER DELETE
    ON tecabix_sce.municipio
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_municipio_after_delete();



/******** plan ********/
CREATE FUNCTION tecabix_sce.trg_plan_after_insert() RETURNS TRIGGER AS $$ 
DECLARE
	item_aux 		RECORD;
    var_insert      bigint;
BEGIN
    SELECT id_catalogo INTO var_insert FROM tecabix_sce.catalogo WHERE nombre = 'CREAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
	
	INSERT INTO tecabix_sce_historial.plan_historial (id_plan, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_plan,var_insert, NEW.id_usuario_modificado, 'Se creo un nuevo registro '|| NEW.nombre );
    REFRESH MATERIALIZED VIEW tecabix_sce.numero_maximo_registro;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_plan_after_insert
    AFTER INSERT
    ON tecabix_sce.plan
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_plan_after_insert();

/**/
CREATE FUNCTION tecabix_sce.trg_plan_after_update() RETURNS TRIGGER AS $$ 
DECLARE
	item_aux 		RECORD;
    var_update      bigint;
    id_aux_1		character varying(45);
    id_aux_2		character varying(45);
BEGIN
    SELECT id_catalogo INTO var_update FROM tecabix_sce.catalogo WHERE nombre = 'ACTUALIZAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
	
    IF OLD.nombre != NEW.nombre THEN
        INSERT INTO tecabix_sce_historial.plan_historial (id_plan, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_plan,var_update, NEW.id_usuario_modificado, 'Se actualizo el nombre de '|| OLD.nombre || ' a ' || NEW.nombre);
    END IF;

    IF OLD.id_estatus != NEW.id_estatus THEN
        SELECT nombre INTO id_aux_1 FROM tecabix_sce.catalogo WHERE id_catalogo = OLD.id_estatus;
        SELECT nombre INTO id_aux_2 FROM tecabix_sce.catalogo WHERE id_catalogo = NEW.id_estatus;
        INSERT INTO tecabix_sce_historial.plan_historial (id_plan, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_plan,var_update, NEW.id_usuario_modificado, 'Se actualizo el estatus de '|| id_aux_1 || ' a ' || id_aux_2);
    END IF;

    IF OLD.precio != NEW.precio THEN
        SELECT nombre INTO id_aux_2 FROM tecabix_sce.catalogo WHERE id_catalogo = NEW.id_estatus;
        INSERT INTO tecabix_sce_historial.plan_historial (id_plan, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_plan,var_update, NEW.id_usuario_modificado, 'Se actualizo el PRECIO DE '|| OLD.precio || ' a ' || NEW.precio);
    END IF;
    REFRESH MATERIALIZED VIEW tecabix_sce.numero_maximo_registro;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_plan_after_update
    AFTER UPDATE
    ON tecabix_sce.plan
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_plan_after_update();

/**/
CREATE FUNCTION tecabix_sce.trg_plan_after_delete() RETURNS TRIGGER AS $$ 
DECLARE
	item_aux 		RECORD;
    var_delete      bigint;
    id_aux_1		bigint;
    id_aux_2		bigint;
BEGIN
    SELECT id_catalogo INTO var_delete FROM tecabix_sce.catalogo WHERE nombre = 'ELIMINAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
	
    INSERT INTO tecabix_sce_historial.plan_historial (id_plan, id_accion, id_usuario_modificado, descripcion) 
        VALUES(OLD.id_plan,var_delete, OLD.id_usuario_modificado, 'Se elimino el registro');
    REFRESH MATERIALIZED VIEW tecabix_sce.numero_maximo_registro;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_plan_after_delete
    AFTER DELETE
    ON tecabix_sce.plan
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_plan_after_delete();



/******** servicio ********/
CREATE FUNCTION tecabix_sce.trg_servicio_after_insert() RETURNS TRIGGER AS $$ 
DECLARE
	item_aux 		RECORD;
    var_insert      bigint;
BEGIN
    SELECT id_catalogo INTO var_insert FROM tecabix_sce.catalogo WHERE nombre = 'CREAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
	
	INSERT INTO tecabix_sce_historial.servicio_historial (id_servicio, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_servicio,var_insert, NEW.id_usuario_modificado, 'Se creo un nuevo registro '|| NEW.nombre );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_servicio_after_insert
    AFTER INSERT
    ON tecabix_sce.servicio
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_servicio_after_insert();

/**/
CREATE FUNCTION tecabix_sce.trg_servicio_after_update() RETURNS TRIGGER AS $$ 
DECLARE
	item_aux 		RECORD;
    var_update      bigint;
    id_aux_1		character varying(45);
    id_aux_2		character varying(45);
BEGIN
    SELECT id_catalogo INTO var_update FROM tecabix_sce.catalogo WHERE nombre = 'ACTUALIZAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
	
    IF OLD.nombre != NEW.nombre THEN
        INSERT INTO tecabix_sce_historial.servicio_historial (id_servicio, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_servicio,var_update, NEW.id_usuario_modificado, 'Se actualizo el nombre de '|| OLD.nombre || ' a ' || NEW.nombre);
    END IF;

    IF OLD.id_estatus != NEW.id_estatus THEN
        SELECT nombre INTO id_aux_1 FROM tecabix_sce.catalogo WHERE id_catalogo = OLD.id_estatus;
        SELECT nombre INTO id_aux_2 FROM tecabix_sce.catalogo WHERE id_catalogo = NEW.id_estatus;
        INSERT INTO tecabix_sce_historial.servicio_historial (id_servicio, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_servicio,var_update, NEW.id_usuario_modificado, 'Se actualizo el estatus de '|| id_aux_1 || ' a ' || id_aux_2);
    END IF;

    IF OLD.id_tipo != NEW.id_tipo THEN
        SELECT nombre INTO id_aux_1 FROM tecabix_sce.catalogo WHERE id_catalogo = OLD.id_tipo;
        SELECT nombre INTO id_aux_2 FROM tecabix_sce.catalogo WHERE id_catalogo = NEW.id_tipo;
        INSERT INTO tecabix_sce_historial.servicio_historial (id_servicio, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_servicio,var_update, NEW.id_usuario_modificado, 'Se actualizo el tipo de '|| id_aux_1 || ' a ' || id_aux_2);
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_servicio_after_update
    AFTER UPDATE
    ON tecabix_sce.servicio
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_servicio_after_update();

/**/
CREATE FUNCTION tecabix_sce.trg_servicio_after_delete() RETURNS TRIGGER AS $$ 
DECLARE
	item_aux 		RECORD;
    var_delete      bigint;
    id_aux_1		bigint;
    id_aux_2		bigint;
BEGIN
    SELECT id_catalogo INTO var_delete FROM tecabix_sce.catalogo WHERE nombre = 'ELIMINAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
	
    INSERT INTO tecabix_sce_historial.servicio_historial (id_servicio, id_accion, id_usuario_modificado, descripcion) 
        VALUES(OLD.id_servicio,var_delete, OLD.id_usuario_modificado, 'Se elimino el registro');

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_servicio_after_delete
    AFTER DELETE
    ON tecabix_sce.servicio
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_servicio_after_delete();



/******** plan_servicio ********/
CREATE FUNCTION tecabix_sce.trg_plan_servicio_after_insert() RETURNS TRIGGER AS $$ 
DECLARE
	item_aux 		RECORD;
    var_insert      bigint;
BEGIN
    SELECT id_catalogo INTO var_insert FROM tecabix_sce.catalogo WHERE nombre = 'CREAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
	
	INSERT INTO tecabix_sce_historial.plan_servicio_historial (id_plan_servicio, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_plan_servicio,var_insert, NEW.id_usuario_modificado, 'Se creo un nuevo registro');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_plan_servicio_after_insert
    AFTER INSERT
    ON tecabix_sce.plan_servicio
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_plan_servicio_after_insert();

/**/
CREATE FUNCTION tecabix_sce.trg_plan_servicio_after_update() RETURNS TRIGGER AS $$ 
DECLARE
	item_aux 		RECORD;
    var_update      bigint;
    id_aux_1		character varying(45);
    id_aux_2		character varying(45);
BEGIN
    SELECT id_catalogo INTO var_update FROM tecabix_sce.catalogo WHERE nombre = 'ACTUALIZAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
	
    IF OLD.numero_licencias != NEW.numero_licencias THEN
        INSERT INTO tecabix_sce_historial.plan_servicio_historial (id_plan_servicio, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_plan_servicio,var_update, NEW.id_usuario_modificado, 'Se actualizo el numero de licencias de  '|| OLD.numero_licencias || ' a ' || NEW.numero_licencias);
    END IF;

    IF OLD.id_estatus != NEW.id_estatus THEN
        SELECT nombre INTO id_aux_1 FROM tecabix_sce.catalogo WHERE id_catalogo = OLD.id_estatus;
        SELECT nombre INTO id_aux_2 FROM tecabix_sce.catalogo WHERE id_catalogo = NEW.id_estatus;
        INSERT INTO tecabix_sce_historial.plan_servicio_historial (id_plan_servicio, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_plan_servicio,var_update, NEW.id_usuario_modificado, 'Se actualizo el estatus de '|| id_aux_1 || ' a ' || id_aux_2);
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_plan_servicio_after_update
    AFTER UPDATE
    ON tecabix_sce.plan_servicio
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_plan_servicio_after_update();

/**/
CREATE FUNCTION tecabix_sce.trg_plan_servicio_after_delete() RETURNS TRIGGER AS $$ 
DECLARE
	item_aux 		RECORD;
    var_delete      bigint;
    id_aux_1		bigint;
    id_aux_2		bigint;
BEGIN
    SELECT id_catalogo INTO var_delete FROM tecabix_sce.catalogo WHERE nombre = 'ELIMINAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
	
    INSERT INTO tecabix_sce_historial.plan_servicio_historial (id_plan_servicio, id_accion, id_usuario_modificado, descripcion) 
        VALUES(OLD.id_plan_servicio,var_delete, OLD.id_usuario_modificado, 'Se elimino el registro');

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_plan_servicio_after_delete
    AFTER DELETE
    ON tecabix_sce.plan_servicio
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_plan_servicio_after_delete();


/******** correo ********/
CREATE FUNCTION tecabix_sce.trg_correo_after_insert() RETURNS TRIGGER AS $$ 
DECLARE
	item_aux 		RECORD;
    var_insert      bigint;
BEGIN
    SELECT id_catalogo INTO var_insert FROM tecabix_sce.catalogo WHERE nombre = 'CREAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
	
	INSERT INTO tecabix_sce_historial.correo_historial (id_correo, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_correo,var_insert, NEW.id_usuario_modificado, 'Se creo un nuevo registro '|| upper(NEW.remitente) );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_correo_after_insert
    AFTER INSERT
    ON tecabix_sce.correo
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_correo_after_insert();

/**/
CREATE FUNCTION tecabix_sce.trg_correo_after_update() RETURNS TRIGGER AS $$ 
DECLARE
	item_aux 		RECORD;
    var_update      bigint;
    id_aux_1		character varying(45);
    id_aux_2		character varying(45);
BEGIN
    SELECT id_catalogo INTO var_update FROM tecabix_sce.catalogo WHERE nombre = 'ACTUALIZAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
	
    IF OLD.remitente != NEW.remitente THEN
        INSERT INTO tecabix_sce_historial.correo_historial (id_correo, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_correo,var_update, NEW.id_usuario_modificado, 'Se actualizo el remitente de '|| OLD.remitente || ' a ' || NEW.remitente);
    END IF;

    IF OLD.id_estatus != NEW.id_estatus THEN
        SELECT nombre INTO id_aux_1 FROM tecabix_sce.catalogo WHERE id_catalogo = OLD.id_estatus;
        SELECT nombre INTO id_aux_2 FROM tecabix_sce.catalogo WHERE id_catalogo = NEW.id_estatus;
        INSERT INTO tecabix_sce_historial.correo_historial (id_correo, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_correo,var_update, NEW.id_usuario_modificado, 'Se actualizo el estatus de '|| id_aux_1 || ' a ' || id_aux_2);
    END IF;

    IF OLD.psw != NEW.psw THEN
        INSERT INTO tecabix_sce_historial.correo_historial (id_correo, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_correo,var_update, NEW.id_usuario_modificado, 'Se actualizo la contraseña');
    END IF;

    IF OLD.smtp_servidor != NEW.smtp_servidor THEN
        INSERT INTO tecabix_sce_historial.correo_historial (id_correo, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_correo,var_update, NEW.id_usuario_modificado, 'Se actualizo el smtp servidor de '|| upper(OLD.smtp_servidor) || ' a ' || upper(NEW.smtp_servidor));
    END IF;

    IF OLD.smtp_port != NEW.smtp_port THEN
        INSERT INTO tecabix_sce_historial.correo_historial (id_correo, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_correo,var_update, NEW.id_usuario_modificado, 'Se actualizo el smtp port DE '|| OLD.smtp_port || ' a ' || NEW.smtp_port);
    END IF;

    IF OLD.id_tipo != NEW.id_tipo THEN
        SELECT nombre INTO id_aux_1 FROM tecabix_sce.catalogo WHERE id_catalogo = OLD.id_tipo;
        SELECT nombre INTO id_aux_2 FROM tecabix_sce.catalogo WHERE id_catalogo = NEW.id_tipo;
        INSERT INTO tecabix_sce_historial.correo_historial (id_correo, id_accion, id_usuario_modificado, descripcion) 
        VALUES(NEW.id_correo,var_update, NEW.id_usuario_modificado, 'Se actualizo el tipo de '|| id_aux_1 || ' a ' || id_aux_2);
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_correo_after_update
    AFTER UPDATE
    ON tecabix_sce.correo
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_correo_after_update();

/**/
CREATE FUNCTION tecabix_sce.trg_correo_after_delete() RETURNS TRIGGER AS $$ 
DECLARE
	item_aux 		RECORD;
    var_delete      bigint;
    id_aux_1		bigint;
    id_aux_2		bigint;
BEGIN
    SELECT id_catalogo INTO var_delete FROM tecabix_sce.catalogo WHERE nombre = 'ELIMINAR' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'CRUD');
	
    INSERT INTO tecabix_sce_historial.correo_historial (id_correo, id_accion, id_usuario_modificado, descripcion) 
        VALUES(OLD.id_correo,var_delete, OLD.id_usuario_modificado, 'Se elimino el registro');

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_correo_after_delete
    AFTER DELETE
    ON tecabix_sce.correo
    FOR EACH ROW
    EXECUTE PROCEDURE tecabix_sce.trg_correo_after_delete();


