INSERT INTO riwi_cities (name, department) VALUES
                                               ('Bogotá', 'Cundinamarca'),
                                               ('Medellín', 'Antioquia'),
                                               ('Cali', 'Valle del Cauca'),
                                               ('Barranquilla', 'Atlántico'),
                                               ('Bucaramanga', 'Santander');

INSERT INTO riwi_suppliers (name, nit, email, city_id) VALUES
                                                           ('Ferretería Torres S.A.S.', '900123456-1', 'torres@empresa.com', 1),
                                                           ('Distribuidora Electrónica Medellín', '800987654-2', 'electronica@empresa.com', 2),
                                                           ('TecnoPartes Ltda.', '700345678-5', 'ventas@tecnopartes.com', 3),
                                                           ('Industrial Tools SAS', '901456789-0', 'contacto@industrialtools.com', 1),
                                                           ('Cable Express', '811987654-3', 'info@cableexpress.com', 2);

INSERT INTO riwi_categories (name, description) VALUES
                                                    ('Ferretería', 'Herramientas y accesorios'),
                                                    ('Electrónica', 'Productos electrónicos'),
                                                    ('Construcción', 'Materiales de construcción'),
                                                    ('Seguridad', 'Equipos de protección personal'),
                                                    ('Oficina', 'Papelería y suministros');

INSERT INTO riwi_products (name, unit_price, unit_measure, category_id) VALUES
                                                                            ('Tornillo Hexagonal 1/2"',1200,'UNIDAD',1),
                                                                            ('Cable UTP Cat6',4500,'M',2),
                                                                            ('Taladro Percutor',320000,'UNIDAD',1),
                                                                            ('Casco Industrial',58000,'UNIDAD',4),
                                                                            ('Resma Carta',18000,'PAQUETE',5),
                                                                            ('Cemento Gris',42000,'KG',3),
                                                                            ('Destornillador Phillips',18000,'UNIDAD',1),
                                                                            ('Canaleta PVC',12000,'M',2),
                                                                            ('Mouse USB',35000,'UNIDAD',2),
                                                                            ('Guantes Industriales',15000,'PAR',4);

INSERT INTO riwi_warehouses (name,address,manager_name,city_id) VALUES
                                                                    ('Bodega Norte','Cra 20 #10-30','Carlos Pérez',1),
                                                                    ('Bodega Medellín','Calle 50 #40-20','Laura Gómez',2),
                                                                    ('Bodega Cali','Av 6 #15-80','Juan Ruiz',3);

INSERT INTO riwi_purchases (purchase_date,total_amount,supplier_id) VALUES
                                                                        ('2026-06-01',350000,1),
                                                                        ('2026-06-03',450000,2),
                                                                        ('2026-06-05',980000,3),
                                                                        ('2026-06-08',275000,1),
                                                                        ('2026-06-10',180000,5),
                                                                        ('2026-06-12',620000,4),
                                                                        ('2026-06-15',210000,2),
                                                                        ('2026-06-18',470000,3);
INSERT INTO riwi_purchase_detail
(quantity,unit_price,purchase_id,product_id)
VALUES
    (100,1200,1,1),
    (200,4500,2,2),
    (2,320000,3,3),
    (30,58000,4,4),
    (20,18000,5,5),
    (40,42000,6,6),
    (50,18000,7,7),
    (60,12000,8,8),
    (25,35000,3,9),
    (80,15000,6,10),
    (150,1200,8,1),
    (300,4500,5,2),
    (5,320000,2,3),
    (40,15000,1,10);
INSERT INTO riwi_inventory
(product_id,warehouse_id,stock)
VALUES
    (1,1,500),
    (2,1,800),
    (3,2,20),
    (4,2,150),
    (5,3,300),
    (6,3,250),
    (7,1,120),
    (8,2,90),
    (9,3,70),
    (10,2,200);

INSERT INTO riwi_inventory_movements
(movement_date,movement_type,quantity,product_id,warehouse_id)
VALUES
    ('2026-06-01','INGRESO',500,1,1),
    ('2026-06-02','INGRESO',800,2,1),
    ('2026-06-03','INGRESO',20,3,2),
    ('2026-06-04','INGRESO',150,4,2),
    ('2026-06-05','INGRESO',300,5,3),
    ('2026-06-06','INGRESO',250,6,3),
    ('2026-06-07','INGRESO',120,7,1),
    ('2026-06-08','INGRESO',90,8,2),
    ('2026-06-09','INGRESO',70,9,3),
    ('2026-06-10','INGRESO',200,10,2),

    ('2026-06-11','EGRESO',50,1,1),
    ('2026-06-12','EGRESO',100,2,1),
    ('2026-06-13','EGRESO',5,3,2),
    ('2026-06-14','EGRESO',20,4,2),
    ('2026-06-15','EGRESO',30,5,3),
    ('2026-06-16','EGRESO',40,6,3),
    ('2026-06-17','EGRESO',15,7,1),
    ('2026-06-18','EGRESO',10,8,2),
    ('2026-06-19','EGRESO',5,9,3),
    ('2026-06-20','EGRESO',50,10,2);