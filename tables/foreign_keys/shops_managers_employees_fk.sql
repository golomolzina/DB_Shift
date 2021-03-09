alter table shops_managers
add constraint shops_managers_employees_fk foreign key (manager_id)
references employees (id);