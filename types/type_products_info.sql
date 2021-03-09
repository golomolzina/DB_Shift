create type products_info as (
     
id               integer,
    group_id         integer,
    price            money,
    quantity_type_id integer,
    name             varchar(100),
    min_price        integer
);