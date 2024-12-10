DROP TABLE employees;
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

DROP TABLE employee_history;
CREATE TABLE employee_history (
    log_id INT IDENTITY(1,1) PRIMARY KEY,
    employee_id INT,
    deleted_date DATETIME,
    deleted_by VARCHAR(50)
);

DROP TABLE inventory;
CREATE TABLE inventory (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    cost DECIMAL(10,2),
    quantity INT
);

DROP TABLE inventory_audit;
CREATE TABLE inventory_audit (
    id INT IDENTITY(1,1) PRIMARY KEY,
    audit_record TEXT
);

/* Trigger to maintain a history log when a row is deleted from the table employees */
CREATE TRIGGER trDeleteEmployee
ON employees
FOR DELETE
AS
BEGIN
    DECLARE @employee_id INT;
    SELECT @employee_id = employee_id FROM deleted;

    INSERT INTO employee_history
    VALUES ('An existing employee with Id = ' + CAST(@employee_id AS VARCHAR(10)) + ' is deleted at ' + CAST(Getdate() AS VARCHAR(22)));
END;

/* trigger to maintain a history log after a new item is recorded in the table inventory */
CREATE TRIGGER trInsertInventory
ON inventory
FOR INSERT
AS
BEGIN
	DECLARE @id INT;
	SELECT @id=id FROM inserted;

	INSERT INTO inventory_audit
	VALUES ('New item with Id= '+CAST(@id AS varchar(10))+' is added at '+CAST(GETDATE() AS VARCHAR(22)));
END;

/* Trigger to maintain a history log after an existing item’s record is updated in the table inventory */
CREATE TRIGGER trUpdateInventory
ON inventory
FOR UPDATE
AS
BEGIN
    DECLARE @id INT;
    SELECT @id = id FROM inserted;
	
	INSERT INTO inventory_audit
    VALUES ('Item with Id = ' + CAST(@id AS VARCHAR(10)) + ' was updated at ' + CAST(GETDATE() AS VARCHAR(22)));
END;

/* Trigger to maintain a history log after an item’s record is deleted from the table inventory */
CREATE TRIGGER trDeleteInventory
ON inventory
FOR DELETE
AS
BEGIN
    DECLARE @id INT;
    SELECT @id = id FROM deleted;

    INSERT INTO inventory_audit
    VALUES ('Item with Id = ' + CAST(@id AS VARCHAR(10)) + ' was deleted at ' + CAST(GETDATE() AS VARCHAR(22)));
END;


