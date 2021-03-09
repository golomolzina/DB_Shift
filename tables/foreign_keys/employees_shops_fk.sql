alter table employee
add constraint employee_shops_fk foreign key (shop_id)
references shops (id);