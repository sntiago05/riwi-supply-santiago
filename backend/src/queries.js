export default {

    stock: `
        SELECT *
        FROM vw_riwi_stock_by_product;
    `,

    topProduct: `
        SELECT
    product,
    SUM(quantity) total_quantity
FROM vw_riwi_purchase_details
GROUP BY product
ORDER BY total_quantity DESC
LIMIT 1;
    `,

    topSupplier: `
    SELECT *
FROM vw_riwi_supplier_purchases
ORDER BY total_amount DESC;
    `,
    categorySalesgt10k: `
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
`,
    productWithoutMovement: `
SELECT
    p.*
FROM riwi_products p
         LEFT JOIN riwi_inventory_movements m
                   ON m.product_id=p.id
WHERE m.id IS NULL;
`,
    inventoryValueByWarehouse: `
SELECT *
FROM vw_riwi_inventory_value
ORDER BY inventory_value DESC;
`,
suppliersWithPurchasesGtAvg:`
SELECT *
FROM vw_riwi_supplier_purchases
WHERE total_amount>(
    SELECT AVG(total_amount)
    FROM vw_riwi_supplier_purchases
);
`
,
    buysByCity: `
SELECT
    city,
    SUM(total_amount) total
FROM vw_riwi_supplier_purchases
GROUP BY city;
`,
    top5ProductsExpensive: `
SELECT
    name,
    unit_price
FROM riwi_products
ORDER BY unit_price DESC
LIMIT 5;
`,
    lowStock: `
SELECT *
FROM vw_riwi_stock_by_product
WHERE stock<100;`
}