Baik, berikut adalah README.md lengkap yang telah dirapikan, termasuk semua endpoint hingga `order_transaction`, dengan contoh penggunaan cURL dan penjelasan:

# API Documentation

This document provides API endpoint details and examples (using cURL) for interacting with the backend of your application.

**Base URL:**

*   `http://127.0.0.1:3000`

**Headers:**

*   All requests require the following header:
    *   `Content-Type: application/json`

## Authentication

### Login

```bash
curl -X POST http://127.0.0.1:3000/api/auth/login \
     -H "Content-Type: application/json" \
     -d '{ "email": "admin@demo.com", "password": "123456" }'
```

**Description:** Authenticates a user

## User Profile

### Get User Profile

```bash
curl -X GET "http://127.0.0.1:3000/api/user_profile?email=eq~admin@demo.com&sort=eq~id,desc" \
     -H "Content-Type: application/json"
```

**Description:** Retrieves the user profile based on the provided email, sorted by ID in descending order.

## Product Category

### Get Product Categories

```bash
curl -X GET http://127.0.0.1:3000/api/product_category -H "Content-Type: application/json"
```

**Description:** Retrieves a list of all product categories.

You can optionally sort results by ID (descending) or limit the number of results:

```bash
# Sort by ID (descending)
curl -X GET "http://127.0.0.1:3000/api/product_category?sort=eq~id,desc" -H "Content-Type: application/json"

# Limit to 1 result
curl -X GET "http://127.0.0.1:3000/api/product_category?limit=eq~1" -H "Content-Type: application/json"
```

### Create Product Category

```bash
curl -X POST http://127.0.0.1:3000/api/product_category \
     -H "Content-Type: application/json" \
     -d '{ "image_url": "https://placehold.co/300x200.png", "product_category_name": "YourCategoryName" }'
```

**Description:** Creates a new product category with the specified image URL and name.

### Update Product Category

```bash
curl -X PUT http://127.0.0.1:3000/api/product_category/{categoryId} \
     -H "Content-Type: application/json" \
     -d '{ "image_url": "https://placehold.co/300x200.png", "product_category_name": "UpdatedCategoryName" }'
```

**Description:** Updates the details of an existing product category. Replace `{categoryId}` with the actual ID of the category you want to update.

### Delete Product Category

```bash
curl -X DELETE http://127.0.0.1:3000/api/product_category/{categoryId} -H "Content-Type: application/json"
```

**Description:** Deletes a product category. Replace `{categoryId}` with the actual ID of the category you want to delete.

## Product

### Get Products

```bash
curl -X GET http://127.0.0.1:3000/api/product -H "Content-Type: application/json"
```

**Description:** Retrieves a list of all products.

You can optionally sort results by ID (descending):

```bash
curl -X GET "http://127.0.0.1:3000/api/product?sort=eq~id,desc" -H "Content-Type: application/json"
```


### Create Product

```bash
curl -X POST http://127.0.0.1:3000/api/product \
     -H "Content-Type: application/json" \
     -d '{ 
           "image_url": "https://placehold.co/300x200.png", 
           "product_name": "ProductName", 
           "product_category_id": "{categoryId}",
           "description": "ProductDescription", 
           "sku": "ProductSKU", 
           "qrcode": "ProductQRCode", 
           "purchase_price": 10.50,
           "selling_price": 15.00, 
           "stock": 50
         }'
```

**Description:** Creates a new product with the specified details. Replace `{categoryId}` with the ID of the corresponding product category.

### Update Product

```bash
curl -X PUT http://127.0.0.1:3000/api/product/{productId} \
     -H "Content-Type: application/json" \
     -d '{ 
           "image_url": "https://placehold.co/300x200.png", 
           "product_name": "UpdatedProductName", 
           "product_category_id": "{categoryId}",
           "description": "UpdatedProductDescription", 
           "sku": "UpdatedProductSKU", 
           "qrcode": "UpdatedProductQRCode", 
           "purchase_price": 12.00,
           "selling_price": 17.50, 
           "stock": 30
         }'
```

**Description:** Updates the details of an existing product. Replace `{productId}` with the actual ID of the product you want to update.

### Delete Product

```bash
curl -X DELETE http://127.0.0.1:3000/api/product/{productId} -H "Content-Type: application/json"
```

**Description:** Deletes a product. Replace `{productId}` with the actual ID of the product you want to delete.


## Customer

### Get Customers

```bash
curl -X GET http://127.0.0.1:3000/api/customer -H "Content-Type: application/json"
```

**Description:** Retrieves a list of all customers.

You can optionally sort results by ID (descending) or limit the number of results:
```bash
# Sort by ID (descending)
curl -X GET "http://127.0.0.1:3000/api/customer?sort=eq~id,desc" -H "Content-Type: application/json"

# Limit to 1 result
curl -X GET "http://127.0.0.1:3000/api/customer?limit=eq~1" -H "Content-Type: application/json"
```


### Create Customer

```bash
curl -X POST http://127.0.0.1:3000/api/customer \
     -H "Content-Type: application/json" \
     -d '{ "image_url": "https://placehold.co/300x200.png", "customer_name": "CustomerName", "email": "customer@example.com", "phone": "1234567890", "address": "CustomerAddress" }'
```

**Description:** Creates a new customer with the specified details.

### Update Customer

```bash
curl -X PUT http://127.0.0.1:3000/api/customer/{customerId} \
     -H "Content-Type: application/json" \
     -d '{ "image_url": "https://placehold.co/300x200.png", "customer_name": "UpdatedCustomerName", "email": "updatedcustomer@example.com", "phone": "9876543210", "address": "UpdatedCustomerAddress" }'
```

**Description:** Updates the details of an existing customer. Replace `{customerId}` with the actual ID of the customer you want to update.

### Delete Customer

```bash
curl -X DELETE http://127.0.0.1:3000/api/customer/{customerId} -H "Content-Type: application/json"
```

**Description:** Deletes a customer. Replace `{customerId}` with the actual ID of the customer you want to delete.



Maaf atas kesalahan sebelumnya. Berikut adalah bagian README.md yang telah diperbaiki untuk `Order Transaction` dan `Order Transaction Item`, serta dilengkapi dengan penjelasan yang lebih jelas:

## Order Transaction

### Create Order Transaction

```bash
curl -X POST http://127.0.0.1:3000/api/order_transaction \
     -H "Content-Type: application/json" \
     -d '{
           "user_profile_id": "{userProfileId}",
           "customer_id": "{customerId}",
           "payment_method": "PaymentMethod",
           "order_status": "OrderStatus",
           "total": 0 
         }'
```

**Description:** Creates a new order transaction with the specified details. Replace `{userProfileId}` and `{customerId}` with the actual IDs.



### Update Order Transaction

```bash
curl -X PUT http://127.0.0.1:3000/api/order_transaction/{orderTransactionId} \
     -H "Content-Type: application/json" \
     -d '{
           "user_profile_id": "{userProfileId}",
           "customer_id": "{customerId}",
           "payment_method": "UpdatedPaymentMethod",
           "order_status": "UpdatedOrderStatus",
           "total": 123.45 
         }'
```

**Description:** Updates the details of an existing order transaction. Replace `{orderTransactionId}` with the actual ID of the transaction you want to update.



### Get Order Transactions

```bash
curl -X GET http://127.0.0.1:3000/api/order_transaction -H "Content-Type: application/json"
```

**Description:** Retrieves a list of all order transactions.

You can optionally sort results by ID (descending) or limit the number of results:

```bash
# Sort by ID (descending)
curl -X GET "http://127.0.0.1:3000/api/order_transaction?sort=eq~id,desc" -H "Content-Type: application/json"

# Limit to 1 result
curl -X GET "http://127.0.0.1:3000/api/order_transaction?limit=eq~1" -H "Content-Type: application/json"
```

## Order Transaction Item

### Get Order Transaction Items

```bash
curl -X GET http://127.0.0.1:3000/api/order_transaction_item -H "Content-Type: application/json"
```

**Description:** Retrieves a list of all order transaction items.

You can optionally filter results by `order_transaction_id` and/or `product_id`:

```bash
# Filter by order_transaction_id
curl -X GET "http://127.0.0.1:3000/api/order_transaction_item?order_transaction_id=eq~{orderTransactionId}" -H "Content-Type: application/json"

# Filter by order_transaction_id and product_id
curl -X GET "http://127.0.0.1:3000/api/order_transaction_item?order_transaction_id=eq~{orderTransactionId}&product_id=eq~{productId}" -H "Content-Type: application/json"
```

You can also sort results by ID (descending):

```bash
curl -X GET "http://127.0.0.1:3000/api/order_transaction_item?order_transaction_id=eq~{orderTransactionId}&sort=eq~id,desc" -H "Content-Type: application/json"
```



### Create Order Transaction Item

```bash
curl -X POST http://127.0.0.1:3000/api/order_transaction_item \
     -H "Content-Type: application/json" \
     -d '{
           "order_transaction_id": "{orderTransactionId}",
           "product_id": "{productId}",
           "qty": 5,
           "purchase_price": 10.50,
           "selling_price": 15.00,
           "profit": 4.50,
           "total": 75.00
         }'
```

**Description:** Creates a new order transaction item with the specified details. Replace `{orderTransactionId}` and `{productId}` with the actual IDs.



### Delete Order Transaction Item

```bash
curl -X DELETE http://127.0.0.1:3000/api/order_transaction_item/{orderTransactionItemId} -H "Content-Type: application/json"
```
**Description:** Deletes an order transaction item. Replace `{orderTransactionItemId}` with the actual ID of the item you want to delete.


**Important Note:**

*   Remember to replace placeholders like `{categoryId}`, `{productId}`, etc., with the actual IDs from your application's data.

Please let me know if you have any other questions.
