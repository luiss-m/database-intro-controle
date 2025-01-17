SELECT quantity 
FROM ORDER_ITEMS 
WHERE product_id = 2456;

SELECT name 
FROM PRODUCTS 
WHERE stock = 0;

SELECT * 
FROM ORDERS 
WHERE is_delivered = 0;

SELECT * 
FROM CUSTOMER 
WHERE email LIKE '%@gmail.com';