---3 add_product_to_warehouse
do $$
begin
	call shop.put_employee(
	 p_employee_f :='Ivannov',
                p_employee_i:='Inan',
                p_employee_o:='Inkovich',
                p_employee_pos:='разнорабочий',
                p_manager_id :=3,
                p_shop_id:=2
	    );
end
$$ language plpgsql