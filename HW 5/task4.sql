--1
SELECT DISTINCT B.cust_name
FROM restBill B
WHERE B.bill_total > 450.00
AND B.waiter_no IN (
    SELECT S.staff_no
    FROM restStaff S
    WHERE S.headwaiter = (
        SELECT staff_no
        FROM restStaff
        WHERE first_name = 'Charles'
    )
);

--2
SELECT S.first_name, S.surname
FROM restStaff S
WHERE S.staff_no = (
    SELECT D.headwaiter
    FROM restRoom_management D
    INNER JOIN restBill B
    ON D.room_name = B.table_no
    WHERE B.cust_name = 'Nerida Smith'
    AND B.bill_date = 160111
);

--3
SELECT B.cust_name
FROM restBill B
WHERE B.bill_total = (
    SELECT MIN(bill_total)
    FROM restBill
);

--4
SELECT S.first_name, S.surname
FROM restStaff S
WHERE S.staff_no NOT IN (
    SELECT B.waiter_no
    FROM restBill B
);

--5
SELECT B.cust_name, S.first_name AS headwaiter_first_name, S.surname AS headwaiter_surname, D.room_name
FROM restBill B
INNER JOIN restStaff S ON B.waiter_no = S.staff_no
INNER JOIN restRoom_management D ON D.headwaiter = S.staff_no
WHERE B.bill_total = (
    SELECT MAX(bill_total)
    FROM restBill
);
