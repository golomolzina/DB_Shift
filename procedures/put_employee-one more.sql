--2 добавить нового сотрудника
create or replace procedure put_employee(

p_employee_f in varchar,
p_employee_i in varchar,
p_employee_o in varchar,
p_employee_pos in varchar,
p_manager_id in integer,
p_shop_id in double precision
)
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
$$ language plpgsql;

alter procedure put_employee(p_employee_f in varchar,
p_employee_i in varchar,
p_employee_o in varchar,
p_employee_pos in varchar,
p_manager_id in integer,
p_shop_id in double precision
) owner to postgres;

do $$
    declare
v_employee_f  varchar;
v_employee_i  varchar;
v_employee_o  varchar;
v_employee_pos  varchar;
v_manager_id  integer;
v_shop_id  double precision;
begin

v_employee_f  :='Иваненко';
v_employee_i   :='Иван';
v_employee_o   :='Новенкович';
v_employee_pos :='зам.продавца';
v_manager_id  := 3;
v_shop_id := 3;
	call put_employee(v_employee_f,
                v_employee_i,
                v_employee_o,
                v_employee_pos,
                v_manager_id,
                v_shop_id
                );
end
$$;
