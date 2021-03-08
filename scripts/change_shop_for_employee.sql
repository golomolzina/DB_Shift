
---4 Написать процедуру перемещения сотрудника на работу в другой магазин
--
create or replace procedure change_shop_for_employee(
    p_employee_id in integer,
    p_shop_to_id in integer)
    language plpgsql
as
$$
declare
    v_shop_from    varchar;
    v_job_name varchar;
    v_updated_rows_cnt integer;
begin

    select count (*)
      into v_updated_rows_cnt
      from shop.employee se
     where se.id  = p_employee_id;

    if v_updated_rows_cnt = 0 then
        raise exception 'сотрудник не может быть переведен. Отсутствует';
    else
        --заменяем ему значение поля shop_id
        update shop.employee set shop_id = p_shop_to_id where id = p_employee_id;
    end if;

    commit; --обязательно!!!
end;
$$;

alter procedure change_shop_for_employee(integer, integer) owner to postgres;



do $$
begin
	call shop.change_shop_for_employee(
	     p_employee_id := 6,
    p_shop_to_id := 3
    );
end
$$ language plpgsql