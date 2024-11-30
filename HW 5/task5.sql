--1
SELECT S.first_name, S.surname, B.bill_date, COUNT(B.bill_no) AS num_bills
FROM restBill B
INNER JOIN restStaff S ON B.waiter_no = S.staff_no
GROUP BY S.staff_no, B.bill_date
HAVING COUNT(B.bill_no) >= 2;

--2
SELECT R.room_name, COUNT(T.table_no) AS num_tables
FROM restRest_table T
INNER JOIN restRoom_management R ON T.room_name = R.room_name
WHERE T.no_of_seats > 6
GROUP BY R.room_name;

--3
SELECT R.room_name, SUM(B.bill_total) AS total_bill_amount
FROM restBill B
INNER JOIN restRest_table T
ON B.table_no = T.table_no
INNER JOIN restRoom_management R
ON T.room_name = R.room_name
GROUP BY R.room_name;


--4
SELECT H.first_name AS headwaiter_first_name, H.surname AS headwaiter_surname, SUM(B.bill_total) AS total_bill_amount
FROM restStaff H
INNER JOIN restStaff W ON H.staff_no = W.headwaiter
INNER JOIN restBill B ON W.staff_no = B.waiter_no
GROUP BY H.staff_no
ORDER BY total_bill_amount DESC;

--5
FROM restBill B
GROUP BY B.cust_name
HAVING AVG(B.bill_total) > 400;

--6
SELECT S.first_name, S.surname, B.bill_date, COUNT(B.bill_no) AS num_bills
FROM restBill B
INNER JOIN restStaff S ON B.waiter_no = S.staff_no
GROUP BY S.staff_no, B.bill_date
HAVING COUNT(B.bill_no) >= 3;
