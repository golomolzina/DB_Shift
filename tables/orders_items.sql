-- auto-generated definition
create table orders_items
(
    id               integer,
    order_id         integer,
    product_id       integer,
    quantity         integer,
    quantity_type_id integer,
    amount           money,
    discount         money,
    total_sum        money
);

alter table orders_items
    owner to postgres;

