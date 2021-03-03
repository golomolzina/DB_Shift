insert into discounts (id, type_id, product_id, group_id, from_date, to_date, percent, fixed_sum)
values (
        default,
        1,
    2,
    3,
    '2021-01-03',
    '2021-02-03',
    20,
    null
       );
insert into discounts (id, type_id, product_id, group_id, from_date, to_date, percent, fixed_sum)
values (
        default,
        1,
    1,
    3,
    '2021-01-03',
    '2021-04-13',
    15,
    null
       );
insert into discounts (id, type_id, product_id, group_id, from_date, to_date, percent, fixed_sum)
values (
        default,
        2, --тип fixprice
    2,
    1,
    '2021-02-23',
    '2021-03-08',
    null,
    300
       );