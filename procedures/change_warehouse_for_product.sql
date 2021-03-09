--5  Написать процедуру перемещения товара с одного склада (ид склада+ид магазина) на другой (ид склада + ид маг.)
create or replace procedure change_warehouse_for_product(--5
    p_whouse_from_id in integer, --key
    p_shop_whouse_from_id in integer,--key
    p_product_id in integer,
    p_whouse_to_id in integer,
    p_shop_whouse_to_id in integer,
    p_quantity in double precision)
    language plpgsql
as
$$
declare
    v_rows_cnt integer;
    v_quantity integer[]; -- позиций такого товара может быть много
    v_sum_product double precision;
    v_updated_rows_cnt integer;
begin
--считаем сколько строк такого товара в этом складе-магазине
    select sum(ss.quantity), count(*)
      into v_quantity, v_rows_cnt
      from shop.shops_warehouse ss
     where (ss.id  = p_whouse_from_id) and--7
            (ss.shop_id = p_shop_whouse_from_id) and --3
            (ss.product_id= p_product_id); --1
    RAISE NOTICE 'Бла бла бла 7= % , 3 = %, %, %', p_whouse_from_id, p_shop_whouse_from_id, v_quantity, v_rows_cnt ;
  --проверка, нашелся ли такой отвар по id
    if v_rows_cnt = 0 then
        raise exception 'этого товара на этом складе нет';
    else if (v_sum_product >= p_quantity) then --его достаточно в сумме, то весь перенесем в новый склад
            begin
            --update shop.shops_warehouse sw set sw. ;--id же нельзя заменять...
            insert into shop.shops_warehouse (id, shop_id, quantity)  VALUES
            (
                p_whouse_to_id, --навязанный id наверняка ругнется default
                p_shop_whouse_to_id,
                p_quantity
                --вставили одним товаром в to
            );
            --удаляем все найденнные вхождения from. Заменим единой записьью с остатком:

            delete from shop.shops_warehouse sw where
                ((sw.id = p_whouse_from_id) and (sw.shop_id = p_shop_whouse_from_id) and (sw.product_id = p_product_id));

                --проверка что удалились с ключевым полем whouse_from_ shop_whouse_from
                -- если такого товара на складе магазина еще нет, добавим его
            get diagnostics v_updated_rows_cnt = row_count;
                if v_updated_rows_cnt > 0 then
                    insert into shop.shops_warehouse(id, shop_id, product_id, quantity) VALUES
                (
                 p_whouse_from_id,
                 p_shop_whouse_from_id,
                 p_product_id,
                 v_sum_product - p_quantity); --разность!!!
                end if;
            end;
        else
            raise exception 'этого товара на этом складе не достаточно';
        end if;
        --
    end if;

    commit; --обязательно!!!
end;
$$;

alter procedure change_warehouse_for_product(
    integer, --key
    integer,--key
    integer,
    integer,
    integer,
    double precision) owner to postgres;


do $$
begin
	call shop.change_warehouse_for_product(
            p_whouse_from_id :=7, --key
            p_shop_whouse_from_id :=3 ,--key

            p_product_id :=1,
            p_whouse_to_id :=33,
            p_shop_whouse_to_id :=3,
            p_quantity := 77.2
        );
end
$$ language plpgsql