CREATE TABLE bank_accounts (
    account_no NUMBER,
    holder_name VARCHAR2(20),
    balance NUMBER
);
INSERT INTO bank_accounts VALUES (1, 'Account A', 20000);
INSERT INTO bank_accounts VALUES (2, 'Account B', 15000);
INSERT INTO bank_accounts VALUES (3, 'Account C', 10000);
COMMIT;
UPDATE bank_accounts SET balance = balance - 5000 WHERE account_no = 1;
UPDATE bank_accounts SET balance = balance + 5000 WHERE account_no = 2;

-- Mistake
UPDATE bank_accounts SET balance = balance + 2000 WHERE account_no = 3;

ROLLBACK;
SELECT * FROM bank_accounts;
