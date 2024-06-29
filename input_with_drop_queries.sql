DO $$ DECLARE
  r RECORD;
BEGIN
  FOR r IN (SELECT tablename FROM pg_tables WHERE schemaname = 'public') LOOP
    EXECUTE 'DROP TABLE IF EXISTS ' || quote_ident(r.tablename) || ' CASCADE';
  END LOOP;
END $$;

CREATE TABLE user_profile ( 
    id SERIAL PRIMARY KEY, 
    image_url TEXT,
    user_profile_name VARCHAR(100),
    gender VARCHAR(255) CHECK (gender IN ('Male', 'Female')),
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255),
    role VARCHAR(255) CHECK (role IN ('Admin', 'User')),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE product_category (
    id SERIAL PRIMARY KEY,
    image_url TEXT,
    product_category_name VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel Produk
CREATE TABLE product (
    id SERIAL PRIMARY KEY, 
    image_url TEXT,
    product_name VARCHAR(255) NOT NULL,
    product_category_id INT REFERENCES product_category(id),
    description TEXT,
    sku VARCHAR(50) UNIQUE NOT NULL,
    qrcode VARCHAR(50) UNIQUE,
    purchase_price FLOAT NOT NULL,
    selling_price FLOAT NOT NULL,
    stock INT NOT NULL DEFAULT 0 ,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel Pelanggan
CREATE TABLE customer (
    id SERIAL PRIMARY KEY, 
    image_url TEXT,
    customer_name VARCHAR(100),
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(20),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel Pelanggan
CREATE TABLE supplier (
    id SERIAL PRIMARY KEY, 
    image_url TEXT,
    supplier_name VARCHAR(100),
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(20),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE purchase_transaction (
    id SERIAL PRIMARY KEY, 
    user_profile_id INT REFERENCES user_profile(id),
    supplier_id INT REFERENCES supplier(id), 
    payment_method VARCHAR(255) CHECK (payment_method IN ('Cash', 'Bank Transfer', 'Emoney')),
    order_status VARCHAR(255) CHECK (order_status IN ('Order created','Order packed','Handed over to driver','In transit','Received','Completed')),
    total FLOAT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE purchase_transaction_item (
    id SERIAL PRIMARY KEY, 
    purchase_transaction_id INT REFERENCES purchase_transaction(id), 
    product_id INT REFERENCES product(id), 
    qty INT NOT NULL,
    purchase_price FLOAT NOT NULL,
    total FLOAT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE order_transaction (
    id SERIAL PRIMARY KEY, 
    user_profile_id INT REFERENCES user_profile(id),
    customer_id INT REFERENCES customer(id), 
    payment_method VARCHAR(255) CHECK (payment_method IN ('Cash', 'Bank Transfer', 'Emoney')),
    order_status VARCHAR(255) CHECK (order_status IN ('Order created','Order packed','Handed over to driver','In transit','Received','Completed')),
    total FLOAT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE order_transaction_item (
    id SERIAL PRIMARY KEY, 
    order_transaction_id INT REFERENCES order_transaction(id), 
    product_id INT REFERENCES product(id), 
    qty INT NOT NULL,
    purchase_price FLOAT NOT NULL,
    selling_price FLOAT NOT NULL,
    profit FLOAT NOT NULL,
    total FLOAT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tambahkan definisi create table disiini jika ingin mendefinisikan
-- Tabel hanya untuk dev mode