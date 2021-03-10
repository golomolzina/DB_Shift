--10  Написать процедуру для получения всех скидок за определенный период
create or replace procedure get_all_discounts(--10
    p_date_from in timestamp,
    p_date_to in timestamp,
    p_disconts inout discount_info[])
    language plpgsql
as
$$
declare v_disconts discount_info[];
begin
     select array_agg((d.id, d.from_date, d.to_date, d.product_id, d.group_id, type_id, percent, fixed_sum)::discount_info)
     into p_disconts--v_products_show
    from shop.discounts d
     where (p_date_to between d.from_date and d.to_date )
     or (p_date_from between d.from_date and d.to_date );
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
