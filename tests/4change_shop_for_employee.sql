-- тест 4 функции, но тоже ругается, что serial заполняю default или просто не упоминаю. Не хочет в это поле null

do $$
    begin
CALL shop.change_shop_for_employee(
	p_employee_id := 6,
 			p_shop_to_id := 2
 );
end;
    $$
language plpgsql;
