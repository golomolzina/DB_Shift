-- auto-generated definition
create table orders
(
    id           integer primary key,
    shop_id      integer,
    employee_id  integer,
    total_amount integer,
    date         timestamp
);

alter table orders
    owner to postgres;

