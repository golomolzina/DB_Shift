drop type shops_info;

create type shops_info as (
id integer,
name varchar(20),
manager_id integer,
address varchar(20)
);


alter type shops_info owner to postgres;
