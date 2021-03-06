do $$
    declare
        v_quantity double precision;
begin
    v_quantity = 5.5;
	call shop.put_product_to_shop(2, 1, 3, v_quantity);
end
$$;
--p_shop_id in integer,
--p_product_id in integer,
--p_product_quantity_type_id in integer,
--p_product_quantity in double precision