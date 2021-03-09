

do $$
begin
	call shop.add_discount(
            p_date_from :='2021-02-02 00:00:00',
    p_date_to := '2021-06-02 00:00:00',
    p_type_discount := 1, --определяет маркетолог
    p_percent := 10,       --определяет маркетолог
    p_fixed_price :=NULL, ----определяет маркетолог
    p_product_id :=1

        );
end
$$ language plpgsql
