-- Create the database
CREATE DATABASE InventoryTracking;

-- Use the created database
USE InventoryTracking;

-- 1. Suppliers Table
CREATE TABLE Suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,  -- Primary Key
    supplier_name VARCHAR(255) NOT NULL,  -- Supplier Name (Cannot be NULL)
    contact_name VARCHAR(255),
    contact_phone VARCHAR(15),
    contact_email VARCHAR(255) UNIQUE,  -- Unique constraint for email
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Timestamp when the record is created
);

-- 2. Products Table
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,  -- Primary Key
    product_name VARCHAR(255) NOT NULL,  -- Product Name (Cannot be NULL)
    category VARCHAR(100),
    price DECIMAL(10, 2) NOT NULL,  -- Price of the product (Cannot be NULL)
    stock_quantity INT NOT NULL,  -- Quantity of stock available
    supplier_id INT,  -- Foreign Key to Suppliers
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Timestamp for creation
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id) ON DELETE SET NULL -- FK reference to Suppliers table
);

-- 3. Customers Table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,  -- Primary Key
    first_name VARCHAR(255) NOT NULL,  -- First name (Cannot be NULL)
    last_name VARCHAR(255) NOT NULL,  -- Last name (Cannot be NULL)
    email VARCHAR(255) UNIQUE,  -- Unique constraint for email
    phone_number VARCHAR(15),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Timestamp for customer record creation
);

-- 4. Sales Table
CREATE TABLE Sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,  -- Primary Key
    customer_id INT,  -- Foreign Key to Customers
    sale_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Date of sale
    total_amount DECIMAL(10, 2) NOT NULL,  -- Total amount for the sale
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE  -- FK reference to Customers table
);

-- 5. Sales Details Table (To store details of each sale)
CREATE TABLE SalesDetails (
    sale_detail_id INT AUTO_INCREMENT PRIMARY KEY,  -- Primary Key
    sale_id INT,  -- Foreign Key to Sales
    product_id INT,  -- Foreign Key to Products
    quantity INT NOT NULL,  -- Quantity of the product sold
    price DECIMAL(10, 2) NOT NULL,  -- Price of the product during the sale
    FOREIGN KEY (sale_id) REFERENCES Sales(sale_id) ON DELETE CASCADE,  -- FK reference to Sales table
    FOREIGN KEY (product_id) REFERENCES Products(product_id) ON DELETE CASCADE  -- FK reference to Products table
);



