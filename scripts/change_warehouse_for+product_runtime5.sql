
do $$
begin
	call shop.change_warehouse_for_product(
            p_whouse_from_id :=1, --key
            p_shop_whouse_from_id :=1 ,--key

            p_product_id :=100,
            p_whouse_to_id :=33,
            p_shop_whouse_to_id :=3,
            p_quantity := 5.2
        );
end
$$ language plpgsql
