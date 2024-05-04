--task1--

CREATE TABLE universties(
    name VARCHAR(255),
    country VARCHAR(50),
    alpha_two_code varchar(2)

);

select * from universties

------------------------------------------------------------------------
--task2--

SELECT * FROM extract_dates
SELECT * FROM employees_history
SELECT * FROM Latest_Employee
SELECT * FROM employee


INSERT INTO Employee (ID, Name, City, Email, Update_Date) VALUES
(1001, 'Ahmed', 'Cairo', 'ahmed@mail.com', '2024-04-20'),
(1002, 'Nehal', 'Giza', 'nehal@mail.com', '2024-04-20'),
(1003, 'Asem', 'Cairo', 'asem@mail.com', '2024-04-20');


UPDATE employee
SET City = 'uuuu'
WHERE ID = 1003

update extract_dates
set last_extract_date='1900-01-01'
 WHERE name = 'Employee'

CREATE TRIGGER update_end_date
ON employees_history
AFTER INSERT
AS
BEGIN
    DECLARE @row_count INT;
    SELECT @row_count = COUNT(*)
    FROM employees_history
    WHERE Emp_id = (SELECT Emp_id FROM inserted) AND end_date IS NULL;

    IF @row_count >= 2
    BEGIN
        DECLARE @min_pk INT;
        SELECT @min_pk = MIN(ID)
        FROM employees_history
        WHERE Emp_id = (SELECT Emp_id FROM inserted) AND end_date IS NULL;
        
        UPDATE employees_history
        SET end_date = GETDATE() 
        WHERE ID = @min_pk AND end_date IS NULL;
    END
END;


------------------------------------------------------------------------
--Task 3--

CREATE TABLE employee_q3 (
    ID INT PRIMARY KEY IDENTITY,
    Name VARCHAR(100),
    City VARCHAR(100),
    Email VARCHAR(255),
    Schedule_Date DATE
);

CREATE TABLE employee_dest (
    Emp_Key INT PRIMARY KEY IDENTITY,
    ID INT,
    Name VARCHAR(255),
    City VARCHAR(255),
    Email VARCHAR(255),
    insert_date DATE,
    active INT,
    versionNum INT
);

-- Data For Testing Casese--
INSERT INTO employee_q3 ( Name, City, Email, Schedule_date)
VALUES
( 'Ahmed', 'Cairo', 'ahmed@mail.com', CONVERT(VARCHAR(10), GETDATE(), 23)),
('Nehal', 'Giza', 'nehal@mail.com', CONVERT(VARCHAR(10), GETDATE(), 23)),
('Asem', 'Cairo', 'asem@mail.com', CONVERT(VARCHAR(10), GETDATE(), 23));

INSERT INTO employee_q3 (ID, Name, City, Email, Schedule_date)
VALUES
(1001, 'Ahmed', 'Cairo', 'ahmed@mail.com', '2024-04-20'),
(1002, 'Nehal', 'Giza', 'nehal@mail.com', '2024-04-20'),
(1003, 'Asem', 'Cairo', 'asem@mail.com', '2024-04-20');

SELECT * FROM employee_q3
SELECT * FROM   employee_dest

------------------------------------------------------------------------
--task 4--
CREATE TABLE Attendance_Device 
(
    id                smallint PRIMARY KEY,
    employee_id        smallint,
    finger_print_ts    datetime,
    in_out            varchar(3)
);

INSERT INTO Attendance_Device (id, employee_id, finger_print_ts, in_out) VALUES
    ('1', '101', '2024-03-12 9:00:00', 'in'),
    ('2', '101', '2024-03-12 10:00:00', 'in'),
    ('3', '102', '2024-03-12 9:00:00', 'in'),
    ('4', '103', '2024-03-12 11:00:00', 'in'),
    ('5', '104', '2024-03-12 9:15:00', 'in'),
    ('6', '105', '2024-03-12 10:00:00', 'in'),
    ('7', '105', '2024-03-12 11:00:00', 'in'),
    ('8', '105', '2024-03-12 11:30:00', 'in'),
    ('9', '106', '2024-03-12 9:10:00', 'in'),
    ('10', '107', '2024-03-12 9:00:00', 'in'),
    ('11', '108', '2024-03-12 9:00:00', 'in'),
    ('12', '101', '2024-03-12 9:00:00', 'out'),
    ('13', '101', '2024-03-12 17:00:00', 'out'),
    ('14', '101', '2024-03-12 19:00:00', 'out'),
    ('15', '102', '2024-03-12 17:00:00', 'out'),
    ('16', '103', '2024-03-12 17:00:00', 'out'),
    ('17', '105', '2024-03-12 10:00:00', 'out'),
    ('18', '105', '2024-03-12 11:00:00', 'out'),
    ('19', '105', '2024-03-12 18:00:00', 'out'),
    ('20', '106', '2024-03-12 19:10:00', 'out'),
    ('21', '107', '2024-03-12 14:00:00', 'out'),
    ('22', '108', '2024-03-12 17:00:00', 'out');



CREATE TABLE EmployeeAttendance (
    id INT PRIMARY KEY IDENTITY(1,1),
    employee_id INT,
    date DATE,
    check_in_time DATETIME,
    check_out_time DATETIME,
    Working_hrs FLOAT
);

CREATE TABLE Employee_Attendance_details (
    id INT PRIMARY KEY IDENTITY,
    employee_id INT,
    date DATE,
    check_in_time time,
    check_out_time time,
    Working_hrs FLOAT,
	state NVARCHAR(50)
);


SELECT * FROM EmployeeAttendance
SELECT * FROM Employee_Attendance_details

 


