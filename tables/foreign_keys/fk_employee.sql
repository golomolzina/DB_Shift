alter table shop.employee ADD
    constraint employees_shops_fk
    FOREIGN KEY(shop_id)
   REFERENCES shops(id);
