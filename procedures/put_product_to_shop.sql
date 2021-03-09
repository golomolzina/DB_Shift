create or replace procedure put_product_to_shop(
p_shop_id in integer,
p_product_id in integer,
p_product_quantity_type_id in integer,
p_product_quantity in double precision
)
    as
$$
begin

        raise notice 'реальный тип меры  - (%)', p_product_quantity_type_id;
        IF (p_product_quantity_type_id = 1 ) then
        insert into shop.shops_warehouse (id, shop_id, product_id, quantity)
        values (
                default,
                p_shop_id,
                p_product_id,
                ROUND(p_product_quantity)
             );
        ELSE
        insert into shop.shops_warehouse (id, shop_id, product_id, quantity)
        values (
                default,
                p_shop_id,
                p_product_id,
                p_product_quantity
             );

        END IF;
        commit;
    end;
$$ language plpgsql;

alter procedure put_product_to_shop() owner to postgres;

do $$
    declare
        v_product_id integer;
        v_shop_id integer;
        v_quantity double precision;
begin
    v_quantity := 5.5;
	call put_product_to_shop(2, 1, 3, v_quantity);
end
$$;
