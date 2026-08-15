-- ==========================================================
-- E-COMMERCE ORDER MANAGEMENT DATABASE SYSTEM
-- WEEK 2: PRODUCT AND CATEGORY MANAGEMENT SYSTEM
-- ==========================================================

USE ecommerce_db;

-- 1. CREATE CATEGORY TABLE
CREATE TABLE category (category_id INT PRIMARY KEY AUTO_INCREMENT, category_name VARCHAR(50) NOT NULL UNIQUE, description VARCHAR(200));

-- 2. INSERT CATEGORY DATA
INSERT INTO category (category_name, description) VALUES ('Electronics', 'Electronic devices and accessories'), ('Clothing', 'Men and women clothing products'), ('Books', 'Educational and general books'), ('Home Appliances', 'Appliances used at home');

-- 3. DISPLAY CATEGORIES
SELECT * FROM category;

-- 4. CREATE PRODUCT TABLE
CREATE TABLE product (product_id INT PRIMARY KEY AUTO_INCREMENT, product_name VARCHAR(100) NOT NULL, category_id INT NOT NULL, price DECIMAL(10,2) NOT NULL CHECK (price > 0), stock_quantity INT NOT NULL CHECK (stock_quantity >= 0), FOREIGN KEY (category_id) REFERENCES category(category_id));

-- 5. INSERT PRODUCT DATA
INSERT INTO product (product_name, category_id, price, stock_quantity) VALUES ('Laptop', 1, 55000, 20), ('Smartphone', 1, 25000, 35), ('Headphones', 1, 2500, 50), ('T-Shirt', 2, 800, 60), ('Jeans', 2, 1800, 40), ('Python Programming', 3, 650, 30), ('Database Management Systems', 3, 750, 25), ('Refrigerator', 4, 32000, 10), ('Washing Machine', 4, 28000, 15), ('Smart Watch', 1, 4500, 25);

-- 6. DISPLAY ALL PRODUCTS
SELECT * FROM product;

-- 7. CATEGORY SELECT QUERIES
SELECT category_name FROM category;
SELECT * FROM category WHERE category_name = 'Electronics';
SELECT * FROM category ORDER BY category_name ASC;
SELECT DISTINCT category_name FROM category;

-- 8. PRODUCT SELECT QUERIES
SELECT product_name, price FROM product;
SELECT * FROM product WHERE price > 10000;
SELECT * FROM product WHERE stock_quantity < 20;
SELECT * FROM product WHERE category_id = 1;
SELECT * FROM product WHERE product_name LIKE 'S%';
SELECT * FROM product WHERE price BETWEEN 1000 AND 30000;
SELECT * FROM product WHERE category_id IN (1, 2);
SELECT * FROM product ORDER BY price DESC;
SELECT COUNT(*) AS total_products FROM product;

-- 9. INSERT NEW PRODUCT
INSERT INTO product (product_name, category_id, price, stock_quantity) VALUES ('Tablet', 1, 18000, 20);
SELECT * FROM product WHERE product_name = 'Tablet';

-- 10. UPDATE PRODUCT PRICE
SELECT * FROM product WHERE product_id = 1;
UPDATE product SET price = 57000 WHERE product_id = 1;
SELECT * FROM product WHERE product_id = 1;

-- 11. UPDATE PRODUCT STOCK
UPDATE product SET stock_quantity = stock_quantity + 20 WHERE product_id = 1;
SELECT product_name, stock_quantity FROM product WHERE product_id = 1;

-- 12. UPDATE MULTIPLE PRODUCT VALUES
UPDATE product SET price = 26000, stock_quantity = 40 WHERE product_id = 2;
SELECT * FROM product WHERE product_id = 2;

-- 13. UPDATE PRODUCTS USING CONDITIONS
UPDATE product SET stock_quantity = stock_quantity + 10 WHERE category_id = 1;
UPDATE product SET stock_quantity = stock_quantity + 5 WHERE stock_quantity < 20;
SELECT * FROM product;

-- 14. DELETE PRODUCT
SELECT * FROM product WHERE product_id = 3;
DELETE FROM product WHERE product_id = 3;
SELECT * FROM product WHERE product_id = 3;

-- 15. JOIN CATEGORY AND PRODUCT
SELECT c.category_id, c.category_name, p.product_id, p.product_name, p.price, p.stock_quantity FROM category c JOIN product p ON c.category_id = p.category_id;

-- 16. DISPLAY PRODUCTS UNDER EACH CATEGORY
SELECT c.category_name, p.product_name, p.price, p.stock_quantity FROM category c JOIN product p ON c.category_id = p.category_id ORDER BY c.category_name;

-- 17. COUNT PRODUCTS BY CATEGORY
SELECT c.category_name, COUNT(p.product_id) AS product_count FROM category c LEFT JOIN product p ON c.category_id = p.category_id GROUP BY c.category_name;

-- 18. HIGHEST-PRICED PRODUCT BY CATEGORY
SELECT c.category_name, MAX(p.price) AS highest_price FROM category c JOIN product p ON c.category_id = p.category_id GROUP BY c.category_name;

-- 19. AVERAGE PRODUCT PRICE BY CATEGORY
SELECT c.category_name, AVG(p.price) AS average_price FROM category c JOIN product p ON c.category_id = p.category_id GROUP BY c.category_name;

-- 20. CATEGORIES HAVING MORE THAN 5 PRODUCTS
SELECT c.category_name, COUNT(p.product_id) AS product_count FROM category c JOIN product p ON c.category_id = p.category_id GROUP BY c.category_name HAVING COUNT(p.product_id) > 5;

-- 21. TOTAL STOCK BY CATEGORY
SELECT c.category_name, SUM(p.stock_quantity) AS total_stock FROM category c JOIN product p ON c.category_id = p.category_id GROUP BY c.category_name;

-- 22. LOW-STOCK PRODUCT REPORT
SELECT product_id, product_name, stock_quantity FROM product WHERE stock_quantity < 20;

-- 23. HIGH-VALUE PRODUCT REPORT
SELECT product_id, product_name, price FROM product WHERE price > 20000 ORDER BY price DESC;

-- 24. CONSTRAINT TESTING
-- The following queries are intentionally invalid and should produce constraint errors.
-- INSERT INTO category (category_name, description) VALUES ('Electronics', 'Duplicate electronics category');
-- INSERT INTO product (product_name, category_id, price, stock_quantity) VALUES ('Test Product', 999, 1000, 10);
-- INSERT INTO product (product_name, category_id, price, stock_quantity) VALUES ('Invalid Price Product', 1, -500, 10);
-- INSERT INTO product (product_name, category_id, price, stock_quantity) VALUES ('Invalid Stock Product', 1, 1000, -10);

-- 25. FINAL VERIFICATION
SHOW TABLES;
DESC category;
DESC product;
SELECT * FROM category;
SELECT * FROM product;
SELECT c.category_name, p.product_name, p.price, p.stock_quantity FROM category c JOIN product p ON c.category_id = p.category_id ORDER BY c.category_name;

-- ==========================================================
-- END OF WEEK 2
-- ==========================================================
