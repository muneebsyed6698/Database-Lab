CREATE TABLE inventory (
    item_id NUMBER,
    item_name VARCHAR2(20),
    quantity NUMBER
);
INSERT INTO inventory VALUES (1, 'Mouse', 100);
INSERT INTO inventory VALUES (2, 'Keyboard', 150);
INSERT INTO inventory VALUES (3, 'Monitor', 80);
INSERT INTO inventory VALUES (4, 'Printer', 60);
COMMIT;
UPDATE inventory SET quantity = quantity - 10 WHERE item_id = 1;

SAVEPOINT sp1;

UPDATE inventory SET quantity = quantity - 20 WHERE item_id = 2;

SAVEPOINT sp2;

UPDATE inventory SET quantity = quantity - 5 WHERE item_id = 3;

ROLLBACK TO sp1;

COMMIT;
