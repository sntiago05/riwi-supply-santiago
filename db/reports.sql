--stock actual
SELECT *
FROM vw_riwi_stock_by_product
ORDER BY stock;

--producto mas comprado
SELECT
    product,
    SUM(quantity) total_quantity
FROM vw_riwi_purchase_details
GROUP BY product
ORDER BY total_quantity DESC
LIMIT 1;
-- top proveedores
SELECT *
FROM vw_riwi_supplier_purchases
ORDER BY total_amount DESC;

-- categorías con promedio mayor a 10000
SELECT
    c.name,
    COUNT(*) products,
    AVG(p.unit_price) average_price
FROM riwi_categories c
         JOIN riwi_products p
              ON p.category_id=c.id
GROUP BY c.id,c.name
HAVING AVG(p.unit_price)>10000
ORDER BY average_price DESC;

--productos sin movimientos
SELECT
    p.*
FROM riwi_products p
         LEFT JOIN riwi_inventory_movements m
                   ON m.product_id=p.id
WHERE m.id IS NULL;

-- Valor inventario por bodega
SELECT *
FROM vw_riwi_inventory_value
ORDER BY inventory_value DESC;
--Proveedores con compras superiores al promedio
SELECT *
FROM vw_riwi_supplier_purchases
WHERE total_amount>(
    SELECT AVG(total_amount)
    FROM vw_riwi_supplier_purchases
);
-- movimientos por bodega
SELECT
    warehouse,
    movement_type,
    COUNT(*) total
FROM vw_riwi_inventory_movements
GROUP BY warehouse,movement_type
HAVING COUNT(*)>1;
-- compras por ciudad
SELECT
    city,
    SUM(total_amount) total
FROM vw_riwi_supplier_purchases
GROUP BY city;

--Top 5 productos más costosos
SELECT
    name,
    unit_price
FROM riwi_products
ORDER BY unit_price DESC
LIMIT 5;

--Inventario bajo
SELECT *
FROM vw_riwi_stock_by_product
WHERE stock<100;