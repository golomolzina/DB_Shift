alter table shop_warehouses
add constraint shop_warehouses_shops_fk foreign key (shop_id)
references shops (id);