insert into product_groups (id, group_name, parent_group_id
       )
       values
       (
        1,
        'штучные',
        null);
insert into product_groups (id, group_name, parent_group_id
       )
       values
       (
        2,
        'рулонные',
        null);
insert into product_groups (id, group_name, parent_group_id
       )
       values
       (
        3,
        'шт_бакалея',
        1);
insert into product_groups (id, group_name, parent_group_id
       )
       values
       (
        4,
        'шт_напитки',
        1);
insert into product_groups (id, group_name, parent_group_id
       )
       values
       (
        5,
        'шт_молочные продукты',
        1);
insert into product_groups (id, group_name, parent_group_id
       )
       values
       (
        6,
        'рассыпное',
        null);
insert into product_groups (id, group_name, parent_group_id
       )
       values
       (
        7,
        'рас_конфеты',
        6);
insert into product_groups (id, group_name, parent_group_id
       )
       values
       (
        8,
        'рас_замороженные ягоды',
        6);
insert into product_groups (id, group_name, parent_group_id
       )
       values
       (
        9,
        'рул_ткани',
        2);
insert into product_groups (id, group_name, parent_group_id
       )
       values
       (
        10,
        'рул_клеенка',
        2);

insert into shop.product_groups (id, group_name, parent_group_id) values (11, 'Бытовая техника', null);
insert into shop.product_groups (id, group_name, parent_group_id) values (12, 'Товары для кухни', 11);
insert into shop.product_groups (id, group_name, parent_group_id) values (13, 'Чайники', 12);
insert into shop.product_groups (id, group_name, parent_group_id) values (14, 'Электроплиты', 12);
insert into shop.product_groups (id, group_name, parent_group_id) values (15, 'Посудомоечные машины', 12);
insert into shop.product_groups (id, group_name, parent_group_id) values (16, 'Компьютеры и периферия', null);
insert into shop.product_groups (id, group_name, parent_group_id) values (17, 'Компьютеры', 16);
insert into shop.product_groups (id, group_name, parent_group_id) values (18, 'Моноблоки', 17);
insert into shop.product_groups (id, group_name, parent_group_id) values (19, 'Ноутбуки', 17);
insert into shop.product_groups (id, group_name, parent_group_id) values (20, 'Периферия', 16);
insert into shop.product_groups (id, group_name, parent_group_id) values (21, 'Мониторы', 20);
insert into shop.product_groups (id, group_name, parent_group_id) values (22, 'Клавиатуры', 20);
insert into shop.product_groups (id, group_name, parent_group_id) values (23, 'Мыши', 20);

		set lc_monetary to "ru-RU.utf8";