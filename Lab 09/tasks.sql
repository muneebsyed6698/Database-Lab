 -- 1. BEFORE INSERT trigger to convert student names to UPPERCASE
CREATE OR REPLACE TRIGGER trg_students_upper
BEFORE INSERT ON students
FOR EACH ROW
BEGIN
   :NEW.student_name := UPPER(:NEW.student_name);
END;
/

--2. Prevent deletion from EMPLOYEES on weekends
CREATE OR REPLACE TRIGGER trg_no_delete_weekend
BEFORE DELETE ON employees
BEGIN
   IF TO_CHAR(SYSDATE, 'DY') IN ('SAT', 'SUN') THEN
      RAISE_APPLICATION_ERROR(-20001, 'Deletion not allowed on weekends');
   END IF;
END;
/


-- 3. Log UPDATE of SALARY into LOG_SALARY_AUDIT
CREATE TABLE log_salary_audit (
   emp_id NUMBER,
   old_salary NUMBER,
   new_salary NUMBER,
   changed_on DATE
);
CREATE OR REPLACE TRIGGER trg_salary_audit
AFTER UPDATE OF salary ON employees
FOR EACH ROW
BEGIN
   INSERT INTO log_salary_audit
   VALUES (:OLD.emp_id, :OLD.salary, :NEW.salary, SYSDATE);
END;
/

-- 4. Prevent negative PRICE in PRODUCTS
CREATE OR REPLACE TRIGGER trg_no_negative_price
BEFORE UPDATE ON products
FOR EACH ROW
BEGIN
   IF :NEW.price < 0 THEN
      RAISE_APPLICATION_ERROR(-20002, 'Price cannot be negative');
   END IF;
END;
/

-- 5. Store USERNAME and TIMESTAMP on insert into COURSES
CREATE OR REPLACE TRIGGER trg_courses_audit
BEFORE INSERT ON courses
FOR EACH ROW
BEGIN
   :NEW.created_by := USER;
   :NEW.created_on := SYSDATE;
END;
/

-- 6. Default department_id in EMP if not provided
CREATE OR REPLACE TRIGGER trg_default_dept
BEFORE INSERT ON emp
FOR EACH ROW
BEGIN
   IF :NEW.department_id IS NULL THEN
      :NEW.department_id := 10;
   END IF;
END;
/

-- 7. Compound Trigger for SALES (Total before & after bulk inserts)
CREATE OR REPLACE TRIGGER trg_sales_total
FOR INSERT ON sales
COMPOUND TRIGGER

   v_before_total NUMBER;
   v_after_total NUMBER;

   BEFORE STATEMENT IS
   BEGIN
      SELECT NVL(SUM(amount),0) INTO v_before_total FROM sales;
   END BEFORE STATEMENT;

   AFTER STATEMENT IS
   BEGIN
      SELECT NVL(SUM(amount),0) INTO v_after_total FROM sales;
      DBMS_OUTPUT.PUT_LINE('Total Before: ' || v_before_total);
      DBMS_OUTPUT.PUT_LINE('Total After: ' || v_after_total);
   END AFTER STATEMENT;

END trg_sales_total;
/

-- 8. DDL Trigger for CREATE and DROP auditing
CREATE TABLE schema_ddl_log (
   user_name VARCHAR2(30),
   ddl_type VARCHAR2(20),
   object_name VARCHAR2(50),
   log_time DATE
);
CREATE OR REPLACE TRIGGER trg_ddl_audit
AFTER CREATE OR DROP ON SCHEMA
BEGIN
   INSERT INTO schema_ddl_log
   VALUES (USER, ORA_SYSEVENT, ORA_DICT_OBJ_NAME, SYSDATE);
END;
/

-- 9. Prevent UPDATE if ORDER_STATUS = 'SHIPPED'
CREATE OR REPLACE TRIGGER trg_no_update_shipped
BEFORE UPDATE ON orders
FOR EACH ROW
BEGIN
   IF :OLD.order_status = 'SHIPPED' THEN
      RAISE_APPLICATION_ERROR(-20003, 'Cannot update shipped orders');
   END IF;
END;
/


-- 10. LOGON Trigger to record login details
CREATE TABLE login_audit (
   user_name VARCHAR2(30),
   login_time DATE
);
CREATE OR REPLACE TRIGGER trg_logon_audit
AFTER LOGON ON SCHEMA
BEGIN
   INSERT INTO login_audit
   VALUES (USER, SYSDATE);
END;
/







