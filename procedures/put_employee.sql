-- 2 новый сотрудник
create or replace procedure put_employee(
    p_employee_f in character varying,
    p_employee_i in character varying,
    p_employee_o in character varying,
    p_employee_pos in character varying,
    p_manager_id in integer,
    p_shop_id in double precision)
    language plpgsql
as
$$
begin
        insert into employee (id, f, i, o, position, manager_id, shop_id)
        values (
                default,
                p_employee_f,
                p_employee_i,
                p_employee_o,
                p_employee_pos,
                p_manager_id,
                p_shop_id
                    );
        commit;
    end;
$$;

alter procedure put_employee(varchar, varchar, varchar, varchar, integer, double precision) owner to postgres;

