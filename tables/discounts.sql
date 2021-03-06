-- auto-generated definition
create table discounts
(
    id         integer,
    type_id    integer,
    product_id integer,
    group_id   integer,
    from_date  timestamp,
    to_date    timestamp,
    percent    integer,
    fixed_sum  money
);

alter table discounts
    owner to postgres;

