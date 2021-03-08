-- тест 4 функции, но тоже ругается, что serial заполняю default или просто не упоминаю. Не хочет в это поле null

do $$
    begin
CALL shop.put_employee(
	p_employee_f := 'Ivanoff',
 		p_employee_i := 'Ivan',
 		p_employee_o := 'Ioannovitsh',
 		p_employee_pos := 'разнорабочий',
 		p_manager_id := 3,
 		p_shop_id := 3
 );
end;
    $$
language plpgsql;
