create or replace procedure get_products_from_shop(p_shop_id integer, INOUT p_products_id integer[], INOUT p_quantities double precision[])
    language plpgsql
as
$$
begin
    select array_agg(se.product_id),
           array_agg(se.quantity)
      into p_products_id,
           p_quantities
      from shop.shops_warehouse se
     where se.shop_id = p_shop_id;
end;
$$;

alter procedure get_products_from_shop(integer, inout integer[], inout double precision[]) owner to postgres;