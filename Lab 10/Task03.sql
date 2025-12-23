CREATE TABLE fees (
    student_id NUMBER,
    name VARCHAR2(20),
    amount_paid NUMBER,
    total_fee NUMBER
);
INSERT INTO fees VALUES (1, 'Ali', 5000, 20000);
INSERT INTO fees VALUES (2, 'Sara', 7000, 20000);
INSERT INTO fees VALUES (3, 'Usman', 9000, 20000);
COMMIT;
UPDATE fees SET amount_paid = amount_paid + 3000 WHERE student_id = 1;

SAVEPOINT halfway;

UPDATE fees SET amount_paid = amount_paid + 4000 WHERE student_id = 2;

ROLLBACK TO halfway;

COMMIT;
