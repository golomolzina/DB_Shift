alter table discounts
add constraint discounts_discount_types_fk foreign key (type_id)
references discounts_types (id);