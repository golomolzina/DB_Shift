alter table products
add constraint products_quantity_types_fk foreign key (quantity_type_id)
references quantity_types (id);