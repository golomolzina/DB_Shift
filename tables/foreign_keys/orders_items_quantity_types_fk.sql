alter table orders_items
add constraint orders_items_quantity_types_fk foreign key (quantity_type_id)
references quantity_types (id);