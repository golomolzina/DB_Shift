alter table discounts
add constraint discounts_products_fk foreign key (product_id)
references products (id);