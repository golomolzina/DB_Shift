do $$
    declare a varchar;

begin
a := 'Ленин';
	call shop.put_product_to_shop( 1, a, CAST('Леонид' as varchar), CAST('Леонидовский' as varchar), CAST('зам.' as varchar), 2, 2);
end
$$ language plpgsql;