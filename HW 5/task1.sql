-- 1 
SELECT bill_date, bill_total
FROM restBill 
WHERE cust_name = 'Bob Crow'
ORDER BY bill_date DESC, bill_total DESC;

-- 2 
SELECT DISTINCT cust_name
FROM restBill
WHERE cust_name LIKE '% Smith'
ORDER BY cust_name DESC;

-- 3
SELECT DISTINCT cust_name
FROM restBill
WHERE cust_name LIKE '% C%';
ORDER BY cust_name ASC;

-- 4
SELECT first_name, surname
FROM restStaff
WHERE headwaiter IS NULL 
ORDER BY surname ASC;

-- 5
SELECT *
FROM restBill 
WHERE bill_date / 100= 1602; 

-- 6
SELECT DISTINCT bill_date
FROM restBill
WHERE bill_date / 10000 = 15 AND bill_total > 0
ORDER BY bill_date;
