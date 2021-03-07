---3 add_product_to_warehouse

create or replace procedure add_product_to_warehouse(
    p_shop_id    in integer,
    p_product_id in integer,
    p_quantity   in double precision
) as $$
declare
    v_quantity_type    varchar;
    v_updated_rows_cnt integer;
begin
    --проверка типа измерения (штуки не могут быть дробными)
    select qt.type
      into v_quantity_type
      from shop.products       p,
           shop.quantity_types qt
     where p.id  = p_product_id
       and qt.id = p.quantity_type_id;
    if v_quantity_type = 'штуки' and (p_quantity - round(p_quantity)) > 0 then
        raise exception 'количество данного товара не может быть дробным';
    end if;

    -- пытаемся обновить количество товара на складе магазина
    update shop.shops_warehouse sw
       set quantity = sw.quantity + p_quantity
     where sw.shop_id    = p_shop_id
       and sw.product_id = p_product_id;

    -- если такого товара на складе магазина еще нет, добавим его
    get diagnostics v_updated_rows_cnt = row_count;
    if v_updated_rows_cnt = 0 then
        insert into shops_warehouse(shop_id, product_id, quantity)
        values (p_shop_id, p_product_id, p_quantity);
    end if;

    commit; --обязательно!!!
end;
$$ language plpgsql