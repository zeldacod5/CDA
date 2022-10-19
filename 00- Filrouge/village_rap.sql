DROP DATABASE village_rap IF EXISTS;

CREATE DATABASE village_rap;

USE DATABASE village_rap;

CREATE TABLE supplier(
    supplier_id INT,
    supplier_phone VARCHAR(20),
    supplier_name VARCHAR(255),
    supplier_surname VARCHAR(255),
    supplier_adress VARCHAR(255),
    supplier_city VARCHAR(255),
    supplier_mail VARCHAR(255),
    supplier_zipcode VARCHAR(15),
    PRIMARY KEY(supplier_id)
);

CREATE TABLE buyer(
    buyer_id INT,
    buyer_category INT NOT NULL,
    buyer_ref TEXT,
    buyer_name VARCHAR(255),
    buyer_surname VARCHAR(255),
    buyer_adress VARCHAR(255),
    buyer_zipcode VARCHAR(15),
    buyer_city VARCHAR(255),
    buyer_country VARCHAR(50),
    buyer_phone VARCHAR(20),
    buyer_mail VARCHAR(255),
    PRIMARY KEY(buyer_id)
);

CREATE TABLE category(
    category_id INT,
    category_name VARCHAR(255),
    category_picture TEXT,
    category_desc TEXT,
    PRIMARY KEY(category_id)
);

CREATE TABLE staff(
    staff_id INT,
    staff_type SMALLINT,
    staff_name VARCHAR(255),
    staff_surname VARCHAR(255),
    staff_adress VARCHAR(255),
    staff_zipcode VARCHAR(15),
    staff_city VARCHAR(255),
    staff_country VARCHAR(50),
    staff_phone VARCHAR(20),
    staff_mail VARCHAR(255),
    PRIMARY KEY(staff_id)
);

CREATE TABLE orders(
    payment_id INT,
    payment_coefficient VARCHAR(50),
    payment_reduction DECIMAL(9, 2),
    payment_adress_delivery TEXT,
    payment_adress_billing TEXT,
    payment_adress_zipcode VARCHAR(15),
    payment_adress_city VARCHAR(255),
    payment_adress_country VARCHAR(50),
    payment_method INT,
    payment_date DATETIME,
    payment_delete_date DATETIME,
    orders_facturation_number INT,
    buyer_id INT NOT NULL,
    PRIMARY KEY(payment_id),
    FOREIGN KEY(buyer_id) REFERENCES buyer(buyer_id)
);

CREATE TABLE delivery(
    delivery_number INT,
    delivery_date DATETIME,
    delivery_follow_up TEXT,
    payment_id INT NOT NULL,
    PRIMARY KEY(delivery_number),
    FOREIGN KEY(payment_id) REFERENCES orders(payment_id)
);

CREATE TABLE subcategory(
    subcategory_id INT,
    subcategory_name VARCHAR(255),
    subcategory_picture TEXT,
    subcategory_desc TEXT,
    category_id INT NOT NULL,
    PRIMARY KEY(subcategory_id),
    FOREIGN KEY(category_id) REFERENCES category(category_id)
);

CREATE TABLE product(
    product_id INT,
    product_name VARCHAR(50),
    product_shortlib VARCHAR(16),
    product_longlib TEXT,
    product_referencies TEXT,
    product_price INT,
    product_picture TEXT,
    product_stock INT NOT NULL,
    product_price_included_taxes DECIMAL(9, 2),
    product_price_included_taxes_1 DECIMAL(9, 2),
    supplier_id INT NOT NULL,
    subcategory_id INT NOT NULL,
    PRIMARY KEY(product_id),
    FOREIGN KEY(supplier_id) REFERENCES supplier(supplier_id),
    FOREIGN KEY(subcategory_id) REFERENCES subcategory(subcategory_id)
);

CREATE TABLE deals(
    buyer_id INT,
    staff_id INT,
    PRIMARY KEY(buyer_id, staff_id),
    FOREIGN KEY(buyer_id) REFERENCES buyer(buyer_id),
    FOREIGN KEY(staff_id) REFERENCES staff(staff_id)
);

CREATE TABLE composed_by(
    product_id INT,
    payment_id INT,
    composed_taxes DECIMAL(9, 2),
    composed_quantity INT,
    composed_sell_price DECIMAL(9, 2),
    composed_with_details TEXT,
    PRIMARY KEY(product_id, payment_id),
    FOREIGN KEY(product_id) REFERENCES product(product_id),
    FOREIGN KEY(payment_id) REFERENCES orders(payment_id)
);

CREATE TABLE prepared(
    product_id INT,
    delivery_number INT,
    quantite_livrée INT,
    PRIMARY KEY(product_id, delivery_number),
    FOREIGN KEY(product_id) REFERENCES product(product_id),
    FOREIGN KEY(delivery_number) REFERENCES delivery(delivery_number)
);

INSTER INTO 