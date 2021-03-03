alter table orders_items
add constraint orders_items_orders_fk foreign key (order_id)
references orders (id)
