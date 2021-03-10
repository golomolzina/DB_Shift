-- auto-generated definition
create table employee
(
    id         serial not null
        constraint employee_pkey
            primary key,
    f          varchar,
    i          varchar,
    o          varchar,
    position   varchar,
    manager_id integer,
    shop_id    integer
);
--все таблицы сощздать, потом ключи внешние!!!

alter table employee
    owner to postgres;

