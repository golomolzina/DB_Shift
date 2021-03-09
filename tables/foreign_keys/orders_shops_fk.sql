alter table orders
add constraint orders_shops_fk foreign key (shop_id)
references shops (id);