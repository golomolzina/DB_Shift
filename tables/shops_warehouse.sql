-- auto-generated definition
create table shops_warehouse
(
    id         integer primary key ,
    shop_id    integer,
    product_id integer,
    quantity   double precision
);

alter table shops_warehouse
    owner to postgres;

