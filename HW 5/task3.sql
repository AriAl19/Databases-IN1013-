1--
SELECT DISTINCT S.first_name, S.surname
FROM restStaff S
INNER JOIN restBill B
ON S.staff_no = B.waiter_no
WHERE B.cust_name = 'Tanya Singh';

2--
SELECT D.room_date
FROM restRoom_management D
INNER JOIN restStaff S
ON D.headwaiter = S.staff_no
WHERE D.room_name = 'Green' 
And S.first_name = 'Charles'
AND D.room_date BETWEEN 160201 AND 160229;

3--
SELECT S.first_name, S.surname
FROM restStaff S
INNER JOIN restStaff Z
ON S.headwaiter = Z.headwaiter
WHERE Z.first_name = 'Zoe' 
  AND Z.surname = 'Ball'
  AND S.staff_no != Z.staff_no;

4--
SELECT S.cust_name, S.bill_total,  
M.first_name AS waiter_first_name, 
M.surname AS waiter_surname
FROM restBill S
INNER JOIN restStaff M
ON S.waiter_no = M.staff_no
ORDER BY S.bill_total DESC;

5--
SELECT DISTINCT S.first_name, S.surname
FROM restStaff S
INNER JOIN restBill B
ON S.staff_no = B.waiter_no
WHERE S.headwaiter IN (
    SELECT DISTINCT headwaiter
    FROM restStaff S1
    INNER JOIN restBill B1
    ON S1.staff_no = B1.waiter_no
    WHERE B1.bill_no IN (00014, 00017)
);

6--
SELECT S.first_name, S.surname
FROM restStaff S
WHERE S.headwaiter = (
    SELECT headwaiter
    FROM restRoom_management
    WHERE room_name = 'Blue' AND room_date = 160312
)
OR S.staff_no = (
    SELECT headwaiter
    FROM restRoom_management
    WHERE room_name = 'Blue' AND room_date = 160312
);
