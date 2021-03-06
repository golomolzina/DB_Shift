-- auto-generated definition
create table products
(
    id               integer,
    group_id         integer,
    price            money,
    quantity_type_id integer,
    name             varchar(100)
);

alter table products
    owner to postgres;

