alter table shops_managers
add constraint shops_managers_shops_fk foreign key (shop_id)
references shops (id);