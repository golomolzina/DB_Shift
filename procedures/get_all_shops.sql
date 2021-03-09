--7  get all shops
create or replace procedure get_all_shops(--7
    p_shops inout shops_info[])
    language plpgsql
as
$$
--declare
begin
    select array_agg((ss.id, ss.name, se.manager_id, ss.address)::shops_info)
    into p_shops
    from shop.shops ss , shop.shops_managers sm, shop.employee se
    where (se.shop_id = ss.id) and (se.position ='директор')
    group by  ss.id;

    --select * from p_shops;

    commit; --обязательно!!!
end;
$$;

alter procedure shop.get_all_shops(
    inout shops_info[]) owner to postgres;


do $$
    declare
        a shop.shops_info[]; --
begin
       /* a[1].id := default;
        a[1].address  :='';
        a[1].name  :='';
        a[1].manager_id = 2;*/
    call shop.get_all_shops(
         a
        );
       select * from a; --посмотреть хочется, что в таблице. Если верить документации, то должно работать.
end
$$ language plpgsql
