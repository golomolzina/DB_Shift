drop type discount_info;

create type discount_info as (
id integer,
date_from timestamp,
date_to   timestamp,
product_id integer,
group_id integer,
type_id integer, --тип скидки  - на весь товар или на группу - задает маркетолог
percent double precision, -- тип расчета процентом или фиксированной ценой > min_price
fixed_sum numeric(5,2) );


alter type discount_info owner to postgres;
