--7  get all shops
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

create or replace procedure add_discount(--6

    p_date_from in timestamp,
    p_date_to in timestamp,
    p_type_discount in int, --определяет маркетолог
    p_percent in int,       --определяет маркетолог
    p_fixed_price in int, ----определяет маркетолог
    p_product_id in integer)
    language plpgsql
as
$$
declare
    v_found_id integer;
    v_sum_product double precision;
    v_updated_rows_cnt integer;
    v_my_discount discount_info;
begin
    --product.price будет по скидке с учетом типа товара.
    --сейчас собственно акцию добавляем.
    RAISE NOTICE 'Бла бла бла  = %', p_date_from ;

     -- текущая дата не из указанного промежутка, то применять эту скидку не будем
    if ((current_date > p_date_to) or (current_date < p_date_from)) --CURDATE( )
    then
        RAISE exception 'акция не своевременна. Поставьте другую напоминалку';
        return;
    end if;

    select sp.group_id
    into v_found_id--v_my_discount.group_id
    from shop.products sp
    where sp.id = p_product_id;

    --v_my_discount.id = def
    v_my_discount.date_from := p_date_from;
    v_my_discount.date_to = p_date_to;
    v_my_discount.product_id = p_product_id;
    v_my_discount.group_id = v_found_id;
    v_my_discount.type_id = p_type_discount;
    v_my_discount.percent = p_percent;
    v_my_discount.fixed_sum = p_fixed_price;


    --разбираем типы акций:
    if ((p_type_discount = 3)and(p_fixed_price = NULL)) --на этот товар и процент
    then
        --установить на этот товар цену согласно величине скидки.
        update products set price = price - p_percent * price /100
        where (products.id = p_product_id)
          and (( price - p_percent * price/100) > shop.products.min_price);
    end if;


    if ((p_type_discount = 3)and(p_percent = NULL)) --на этот товар и fix
    then
        --установить на этот товар цену согласно величине скидки.
        update products  set price = p_fixed_price
        where (products.id = p_product_id) and (p_fixed_price > products.min_price);
    end if;

    --разбираем 2 типы акций:
    if ((p_type_discount = 2)and(p_fixed_price = NULL)) --на этот товар и процент
    then
        --установить на этот товар цену согласно величине скидки.
        update products set price = price - p_percent * price/100
        where (products.group_id = (v_my_discount).group_id) and ( price - p_percent * price > products.min_price);
    end if;


    if ((p_type_discount = 2)and(p_percent = NULL)) --на этот товар и fix
    then
        --установить на этот товар цену согласно величине скидки.
        update products  set price = p_fixed_price
        where (products.group_id = (v_my_discount).group_id) and (p_fixed_price > products.min_price);
    end if;

      --разбираем 1 тип акций на всё:
    if ((p_type_discount = 1)and(p_fixed_price = NULL)) --на этот товар и процент
    then
        --установить на этот товар цену согласно величине скидки.
        update products set price = price - p_percent * price/100
        where  price - p_percent * price > products.min_price;
    end if;


    if ((p_type_discount = 1)and(p_percent = NULL)) --на этот товар и fix
    then
        --установить на этот товар цену согласно величине скидки.
        update products  set price = p_fixed_price
        where p_fixed_price > products.min_price;
    end if;
    -- все _________
    insert into discounts ( id,type_id, product_id, group_id , --надо найти
        from_date ,  to_date ,  percent , fixed_sum) values
    (
     default,
     p_type_discount, --1\2\3
     p_product_id,
     v_my_discount.group_id,
     p_date_from,
     p_date_to,
     p_percent,
     p_fixed_price
          );

    commit; --обязательно!!!
end;
$$;

alter procedure add_discount(
     timestamp,
    timestamp,
    int, --определяет маркетолог
    int,       --определяет маркетолог
    int, ----определяет маркетолог
    integer) owner to postgres;


do $$
begin
	call shop.add_discount(
            p_date_from :='2021-02-02 00:00:00',
    p_date_to := '2021-06-02 00:00:00',
    p_type_discount := 1, --определяет маркетолог
    p_percent := 10,       --определяет маркетолог
    p_fixed_price :=NULL, ----определяет маркетолог
    p_product_id :=1

        );
end
$$ language plpgsql
