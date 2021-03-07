---3 add_product_to_warehouse
do $$
begin
	call shop.add_product_to_warehouse(

	     p_shop_id := 3,
    p_product_id := 1,
    p_quantity   :=777.56);
end
$$ language plpgsql