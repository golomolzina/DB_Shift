--11.1  Написать процедуру для наполнения cотрудниками
create or replace procedure insert_staff(--11.1
    )
    language plpgsql
as
$$
--declare v_disconts discount_info[];
begin
      
    commit;
end;
$$;

alter procedure shop.get_all_discounts(
    inout discount_info[]) owner to postgres;


do $$
    declare
        a shop.discount_info[]; --
begin
        call shop.get_all_discounts( a );
       --select * from a; --посмотреть хочется, что в таблице. Если верить документации, то должно работать.
end
$$ language plpgsql
