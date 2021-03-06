do $$
begin
	call shop.put_product_to_shop( 1, varchar('Ленин'), 'Леонид', 'Леонтьевич', 'зам.продавцв', 2, 2);
end
$$ language plpgsql;