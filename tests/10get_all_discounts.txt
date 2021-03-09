--10
do $$
    declare
        a shop.discount_info[]; --
begin
        call shop.get_all_discounts( a );
       --select * from a; --посмотреть хочется, что в таблице. Если верить документации, то должно работать.
end
$$ language plpgsql
