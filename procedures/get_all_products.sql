--8  get all products kinds
create or replace procedure get_all_products(--8
    p_products inout products_info[])
    language plpgsql
as
$$
declare v_products_show products_info[];
begin
    -- сделаю проще: select array_agg((sp.id, sp.group_id, sp.price, COUNT(sp.quantity_type_id) as ssum, sp.name, sp.min_price)::products_info)
     select array_agg((sp.id, sp.group_id, sp.price, sp.quantity_type_id, sp.name, sp.min_price)::products_info)
     into p_products--v_products_show
    from shop.products sp
    group by  sp.name;--, sp.price;

    --не показывает содержимое никак!
    select * from v_products_show;
    p_products := v_products_show;

    commit; --обязательно!!!
end;
$$;

alter procedure shop.get_all_products(
    inout products_info[]) owner to postgres;


do $$
    declare
        a shop.products_info[]; --
begin
        call shop.get_all_products( a );
       select * from a; --посмотреть хочется, что в таблице. Если верить документации, то должно работать.
end
$$ language plpgsql
