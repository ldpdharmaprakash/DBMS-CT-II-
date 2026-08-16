-- Week 3: Seller & Inventory Management System
-- SQL: CREATE TABLE and SAMPLE DATA (MySQL syntax)

CREATE TABLE Sellers (
  Seller_ID INT AUTO_INCREMENT PRIMARY KEY,
  Seller_Code VARCHAR(10) NOT NULL UNIQUE,
  Seller_Name VARCHAR(150) NOT NULL,
  Email VARCHAR(150) NOT NULL UNIQUE,
  Phone VARCHAR(20) NOT NULL,
  Address TEXT,
  Created_At DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Seller_Product (
  SP_ID INT AUTO_INCREMENT PRIMARY KEY,
  Seller_ID INT NOT NULL,
  Product_ID INT NOT NULL,
  Supply_Price DECIMAL(10,2),
  Active BOOLEAN DEFAULT TRUE,
  FOREIGN KEY (Seller_ID) REFERENCES Sellers(Seller_ID) ON DELETE CASCADE,
   FOREIGN KEY (Product_ID) REFERENCES Product(Product_iD) ON DELETE CASCADE
);

CREATE TABLE Inventory (
  Inventory_ID INT AUTO_INCREMENT PRIMARY KEY,
  Product_ID INT NOT NULL UNIQUE,
  Total_Stock INT NOT NULL DEFAULT 0 CHECK (Total_Stock >= 0),
  Stock_Status VARCHAR(20) NOT NULL DEFAULT 'Out of Stock' CHECK (Stock_Status IN ('Available','Out of Stock')),
  Last_Updated DATE NOT NULL DEFAULT (CURRENT_DATE),
  FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID) ON DELETE CASCADE
);

-- SAMPLE DATA
INSERT INTO Sellers (Seller_Code, Seller_Name, Email, Phone, Address) VALUES
('S101','ABC Electronics','abc@electronics.com','9876543210','No.12, Industrial Rd'),
('S102','Fashion World','contact@fashionworld.in','9445566778','12, Market Street'),
('S103','Homeware Hub','sales@homeware.com','9123456780','45, Central Ave');

-- assume Products table has Product_IDs 201,202,203
INSERT INTO Seller_Product (Seller_ID, Product_ID, Supply_Price) VALUES
(1,1,45000.00),
(2,2,1200.00),
(3,4,3500.00),
(1,4,3400.00);

INSERT INTO Inventory (Product_ID, Total_Stock, Stock_Status, Last_Updated) VALUES
(1,25,'Available','2026-08-10'),
(2,0,'Out of Stock','2026-08-12'),
(4,8,'Available','2026-08-14');
