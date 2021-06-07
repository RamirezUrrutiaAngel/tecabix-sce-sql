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

CREATE FUNCTION tecabix_sce.sesion_find_by_token(arg_token uuid) RETURNS SETOF tecabix_sce.sesion AS $$ 
DECLARE
    var_activo      bigint;
    var_eliminado   bigint;
    var_count       bigint;
    var_sesion      tecabix_sce.sesion%ROWTYPE;
    var_servicio    tecabix_sce.servicio%ROWTYPE;
BEGIN
    SELECT id_catalogo INTO var_activo FROM tecabix_sce.catalogo WHERE nombre = 'ACTIVO' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'ESTATUS');

    SELECT * INTO var_sesion
	FROM tecabix_sce.sesion s 
	WHERE s.clave = arg_token AND s.peticiones_restantes > 0 AND s.id_estatus = var_activo ;

    IF var_sesion IS NOT NULL THEN
        IF var_sesion.vencimiento > NOW() THEN
            var_sesion.peticiones_restantes := var_sesion.peticiones_restantes - 1;
            UPDATE tecabix_sce.sesion SET
                peticiones_restantes = var_sesion.peticiones_restantes
                WHERE id_sesion = var_sesion.id_sesion;
            RETURN NEXT var_sesion;
        ELSE
            SELECT id_catalogo INTO var_eliminado FROM tecabix_sce.catalogo WHERE nombre = 'ELIMINADO' AND id_catalogo_tipo IN (SELECT id_catalogo_tipo FROM tecabix_sce.catalogo_tipo WHERE nombre = 'ESTATUS');

            SELECT b.* INTO var_servicio
                FROM tecabix_sce.licencia a 
                JOIN tecabix_sce.servicio b ON a.id_servicio = b.id_servicio
                JOIN tecabix_sce.catalogo c ON b.id_tipo = c.id_catalogo
                JOIN tecabix_sce.catalogo_tipo d ON c.id_catalogo_tipo = d.id_catalogo_tipo
                WHERE a.id_estatus = var_activo AND b.id_estatus = var_activo  AND c.nombre = 'MULTIUSUARIO' AND d.nombre = 'TIPO_DE_SERVICIO' AND a.id_licencia = var_sesion.id_licencia;
            
            IF var_servicio IS NOT NULL THEN

                SELECT COUNT (*) INTO var_count
                    FROM tecabix_sce.licencia a 
                    JOIN tecabix_sce.plantel e ON a.id_plantel = e.id_plantel
                    JOIN tecabix_sce.suscripcion i ON e.id_empresa = i.id_empresa
                    WHERE i.id_estatus = var_activo AND i.vencimiento > NOW() AND a.id_licencia = var_sesion.id_licencia;

                IF var_count > 0 THEN
                    var_sesion.vencimiento := DATE(now()) + time '23:59:59';
                    var_sesion.peticiones_restantes := var_servicio.peticiones;
                    UPDATE tecabix_sce.sesion  SET
                        vencimiento = var_sesion.vencimiento , 
                        peticiones_restantes = var_sesion.peticiones_restantes
                        WHERE id_sesion = var_sesion.id_sesion;
                    
                    RETURN NEXT var_sesion;
                    RETURN;
                END IF;
            END IF;
            UPDATE tecabix_sce.sesion SET
                id_estatus = var_eliminado
                WHERE id_sesion = var_sesion.id_sesion;
        END IF;
    END IF;
    RETURN;

END;
$$ LANGUAGE plpgsql;




CREATE FUNCTION tecabix_sce.departamento_can_insert(arg_id_empresa bigint) RETURNS boolean AS $$ 
DECLARE
    num         bigint;
    num_max     bigint;
BEGIN
    SELECT COUNT(*) INTO num FROM tecabix_sce.departamento d WHERE d.id_empresa = arg_id_empresa;
    SELECT n.valor INTO num_max FROM tecabix_sce.numero_maximo_registro n WHERE n.id_empresa = arg_id_empresa AND nombre = 'MAX_REG_DEPARTAMENTO';
    RETURN num < num_max;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION tecabix_sce.puesto_can_insert(arg_id_empresa bigint) RETURNS boolean AS $$ 
DECLARE
    num         bigint;
    num_max     bigint;
BEGIN
    SELECT COUNT(*) INTO num FROM tecabix_sce.puesto a JOIN tecabix_sce.departamento b ON a.id_departamento = b.id_departamento WHERE b.id_empresa = arg_id_empresa;
    SELECT n.valor INTO num_max FROM tecabix_sce.numero_maximo_registro n WHERE n.id_empresa = arg_id_empresa AND nombre = 'MAX_REG_PUESTO';
    RETURN num < num_max;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION tecabix_sce.plantel_can_insert(arg_id_empresa bigint) RETURNS boolean AS $$ 
DECLARE
    num         bigint;
    num_max     bigint;
BEGIN
    SELECT COUNT(*) INTO num FROM tecabix_sce.plantel a WHERE a.id_empresa = arg_id_empresa;
    SELECT n.valor INTO num_max FROM tecabix_sce.numero_maximo_registro n WHERE n.id_empresa = arg_id_empresa AND nombre = 'MAX_REG_PLANTEL';
    RETURN num < num_max;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION tecabix_sce.perfil_can_insert(arg_id_empresa bigint) RETURNS boolean AS $$ 
DECLARE
    num         bigint;
    num_max     bigint;
BEGIN
    SELECT COUNT(*) INTO num FROM tecabix_sce.perfil a WHERE a.id_empresa = arg_id_empresa;
    SELECT n.valor INTO num_max FROM tecabix_sce.numero_maximo_registro n WHERE n.id_empresa = arg_id_empresa AND nombre = 'MAX_REG_PERFIL';
    RETURN num < num_max;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION tecabix_sce.trabajador_can_insert(arg_id_empresa bigint) RETURNS boolean AS $$ 
DECLARE
    num         bigint;
    num_max     bigint;
BEGIN
    SELECT COUNT(*) INTO num FROM tecabix_sce.trabajador a WHERE a.id_empresa = arg_id_empresa;
    SELECT n.valor INTO num_max FROM tecabix_sce.numero_maximo_registro n WHERE n.id_empresa = arg_id_empresa AND nombre = 'MAX_REG_TRABAJADOR';
    RETURN num < num_max;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION tecabix_sce.turno_can_insert(arg_id_empresa bigint) RETURNS boolean AS $$ 
DECLARE
    num         bigint;
    num_max     bigint;
BEGIN
    SELECT COUNT(*) INTO num FROM tecabix_sce.turno a WHERE a.id_empresa = arg_id_empresa;
    SELECT n.valor INTO num_max FROM tecabix_sce.numero_maximo_registro n WHERE n.id_empresa = arg_id_empresa AND nombre = 'MAX_REG_TURNO';
    RETURN num < num_max;
END;
$$ LANGUAGE plpgsql;