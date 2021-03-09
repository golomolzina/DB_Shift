alter table products
add constraint products_product_groups_fk foreign key (group_id)
references product_groups (id);