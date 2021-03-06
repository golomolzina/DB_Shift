-- auto-generated definition
create table product_groups
(
    id              integer,
    group_name      varchar(100),
    parent_group_id integer
);

alter table product_groups
    owner to postgres;

