-- Drop existing tables if they exist with CASCADE to drop dependent objects
DROP TABLE IF EXISTS campaign CASCADE;
DROP TABLE IF EXISTS contacts CASCADE;
DROP TABLE IF EXISTS category CASCADE;
DROP TABLE IF EXISTS subcategory CASCADE;

-- Create contacts table and set primary key
CREATE TABLE contacts (
    contact_id INT NOT NULL,
    first_name VARCHAR(150) NOT NULL,
    last_name VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL,
    PRIMARY KEY (contact_id)
);

-- Create category table and set primary key
CREATE TABLE category (
    category_id VARCHAR(150) NOT NULL,
    category VARCHAR(150) NOT NULL,
    PRIMARY KEY (category_id)
);

-- Create subcategory table and set primary key
CREATE TABLE subcategory (
    subcategory_id VARCHAR(150) NOT NULL,
    subcategory VARCHAR(150) NOT NULL,
    PRIMARY KEY (subcategory_id)
);

-- Create campaign table and set primary key and foreign keys
CREATE TABLE campaign (
    cf_id INT NOT NULL,
    contact_id INT NOT NULL,
    company_name VARCHAR(300) NOT NULL,
    description VARCHAR(300) NOT NULL,
    goal DOUBLE PRECISION NOT NULL,  -- Replaced DOUBLE with DOUBLE PRECISION
    pledged DOUBLE PRECISION NOT NULL,  -- Replaced DOUBLE with DOUBLE PRECISION
    outcome VARCHAR(300) NOT NULL,
    backers_count INT NOT NULL,
    country VARCHAR(300) NOT NULL,
    currency VARCHAR(300) NOT NULL,
    launched_date DATE NOT NULL,
    end_date DATE NOT NULL,
    category_id VARCHAR(150) NOT NULL,  -- Adjusted size for consistency with category table
    subcategory_id VARCHAR(150) NOT NULL,  -- Adjusted size for consistency with subcategory table
    PRIMARY KEY (cf_id),
    FOREIGN KEY (contact_id) REFERENCES contacts(contact_id),
    FOREIGN KEY (category_id) REFERENCES category(category_id),
    FOREIGN KEY (subcategory_id) REFERENCES subcategory(subcategory_id)
);

-- Select all records from each table
SELECT * FROM contacts;
SELECT * FROM category;
SELECT * FROM subcategory;
SELECT * FROM campaign;
