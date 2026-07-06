create table riwi_cities(
    id serial primary key,
    name varchar(100) not null ,
    department varchar(100) not null
);
create  table riwi_suppliers(
    id serial primary key,
    name varchar(100) not null,
    nit varchar(150) unique not null,
    email varchar(150) unique not null,
    city_id int not null,
    foreign key(city_id) references  riwi_cities(id)
);

create table riwi_warehouses(
    id serial primary key,
    name varchar(100) not null,
    address varchar(100) not null ,
    manager_name varchar(200) not null,
    city_id int not null,
    foreign key(city_id) references  riwi_cities(id)
);

create table riwi_purchases(
    id serial primary key ,
    purchase_date date not null,
    total_amount numeric(12,2) check ( total_amount > 0 ) not null ,
    supplier_id int not null,
    foreign key (supplier_id) references  riwi_suppliers(id)
);
CREATE TYPE unit_measure AS ENUM (
    'UNIDAD',
    'CAJA',
    'PAQUETE',
    'DOCENA',
    'PAR',
    'KG',
    'G',
    'LB',
    'L',
    'ML',
    'M',
    'CM',
    'MM',
    'M2',
    'M3',
    'ROLLO'
    );

create  table  riwi_categories(
    id serial primary key,
    name varchar(100) not null ,
    description varchar(300) not null
);
create  table  riwi_products(
    id serial primary key,
    name varchar(100) not null ,
    unit_price numeric(10,2) not null ,
    unit_measure unit_measure not null ,
    category_id int not null ,
    foreign key (category_id) references riwi_categories(id)
);
CREATE TYPE movement_type AS ENUM ('EGRESO','INGRESO');

create table  riwi_inventory_movements(
    id serial primary key,
    movement_date date not null ,
    movement_type movement_type not null ,
    quantity int check ( quantity>0) not null ,
    product_id int not null ,
    warehouse_id int not null ,
    foreign key (product_id) references riwi_products(id),
    foreign key (warehouse_id) references riwi_warehouses(id)
);

create table riwi_purchase_detail(
    id serial primary key ,
    quantity int check ( quantity > 0 ),
    unit_price numeric(10,2) check ( unit_price > 0 ),
    purchase_id int not null ,
    product_id int not null ,
    foreign key (purchase_id) references  riwi_purchases(id),
    foreign key (product_id) references  riwi_products(id)
);

create  table riwi_inventory(
    product_id  int not null,
    warehouse_id int not null ,
    stock int not null,
    primary key(product_id, warehouse_id),
    foreign key (product_id) references  riwi_products(id),
    foreign key  (warehouse_id) references  riwi_warehouses(id)
);

