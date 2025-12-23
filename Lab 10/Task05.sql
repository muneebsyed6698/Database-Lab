CREATE TABLE employees (
    emp_id NUMBER,
    emp_name VARCHAR2(20),
    salary NUMBER
);
INSERT INTO employees VALUES (1, 'Ahmed', 40000);
INSERT INTO employees VALUES (2, 'Zara', 45000);
INSERT INTO employees VALUES (3, 'Bilal', 35000);
INSERT INTO employees VALUES (4, 'Ayesha', 48000);
INSERT INTO employees VALUES (5, 'Hamza', 42000);
COMMIT;
UPDATE employees SET salary = salary + 5000 WHERE emp_id = 1;

SAVEPOINT A;

UPDATE employees SET salary = salary + 4000 WHERE emp_id = 2;

SAVEPOINT B;

UPDATE employees SET salary = salary + 3000 WHERE emp_id = 3;

ROLLBACK TO A;

COMMIT;
