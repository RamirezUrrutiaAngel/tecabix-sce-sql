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