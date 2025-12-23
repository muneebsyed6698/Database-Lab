CREATE TABLE products (
    product_id NUMBER,
    product_name VARCHAR2(20),
    stock NUMBER
);

CREATE TABLE orders (
    order_id NUMBER,
    product_id NUMBER,
    quantity NUMBER
);
INSERT INTO products VALUES (1, 'Laptop', 50);
INSERT INTO products VALUES (2, 'Tablet', 30);
COMMIT;
UPDATE products SET stock = stock - 2 WHERE product_id = 1;
INSERT INTO orders VALUES (101, 1, 2);
DELETE FROM products WHERE product_id = 2;

ROLLBACK;
UPDATE products SET stock = stock - 2 WHERE product_id = 1;
INSERT INTO orders VALUES (101, 1, 2);

COMMIT;
