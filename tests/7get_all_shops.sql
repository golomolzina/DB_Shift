
do $$
    declare
        a shop.shops_info[]; --
begin
       /* a[1].id := default;
        a[1].address  :='';
        a[1].name  :='';
        a[1].manager_id = 2;*/
    call shop.get_all_shops(
         a
        );
       select * from a; --посмотреть хочется, что в таблице. Если верить документации, то должно работать.
end
$$ language plpgsql
