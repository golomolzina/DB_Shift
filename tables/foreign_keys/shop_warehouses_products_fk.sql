alter table shop_warehouses
add constraint shop_warehouses_products_fk foreign key (product_id)
references products (id);