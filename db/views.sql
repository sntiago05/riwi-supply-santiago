-- Stock por producto
CREATE VIEW vw_riwi_stock_by_product AS
SELECT
    p.id,
    p.name AS product,
    c.name AS category,
    p.unit_measure,
    i.stock
FROM riwi_inventory i
         JOIN riwi_products p
              ON i.product_id = p.id
         JOIN riwi_categories c
              ON p.category_id = c.id;

--Compras por proveedor
CREATE VIEW vw_riwi_supplier_purchases AS
SELECT
    s.id,
    s.name AS supplier,
    c.name AS city,
    COUNT(p.id) AS purchases,
    COALESCE(SUM(p.total_amount),0) AS total_amount
FROM riwi_suppliers s
         LEFT JOIN riwi_cities c
                   ON s.city_id = c.id
         LEFT JOIN riwi_purchases p
                   ON p.supplier_id = s.id
GROUP BY s.id,s.name,c.name;

-- Valor del inventario
CREATE VIEW vw_riwi_inventory_value AS
SELECT
    w.id,
    w.name AS warehouse,
    city.name AS city,
    SUM(i.stock * p.unit_price) AS inventory_value
FROM riwi_inventory i
         JOIN riwi_products p
              ON p.id=i.product_id
         JOIN riwi_warehouses w
              ON w.id=i.warehouse_id
         JOIN riwi_cities city
              ON city.id=w.city_id
GROUP BY w.id,w.name,city.name;

--Movimientos de inventario
CREATE VIEW vw_riwi_inventory_movements AS
SELECT
    m.id,
    p.name AS product,
    w.name AS warehouse,
    m.movement_type,
    m.quantity,
    m.movement_date
FROM riwi_inventory_movements m
         JOIN riwi_products p
              ON p.id=m.product_id
         JOIN riwi_warehouses w
              ON w.id=m.warehouse_id;

-- Productos comprados
CREATE VIEW vw_riwi_purchase_details AS
SELECT
    pur.id AS purchase_id,
    pur.purchase_date,
    s.name AS supplier,
    pr.name AS product,
    cat.name AS category,
    det.quantity,
    det.unit_price,
    det.quantity * det.unit_price AS subtotal
FROM riwi_purchase_detail det
         JOIN riwi_products pr
              ON det.product_id=pr.id
         JOIN riwi_categories cat
              ON pr.category_id=cat.id
         JOIN riwi_purchases pur
              ON det.purchase_id=pur.id
         JOIN riwi_suppliers s
              ON pur.supplier_id=s.id;
