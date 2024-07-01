# API DOCS

# --- Authentication ---

# Login
curl -X POST http://127.0.0.1:3000/api/auth/login \
     -H "Content-Type: application/json" \
     -d '{ "email": "admin@demo.com", "password": "123456" }'


# --- User Profile ---

# Get User Profile
curl -X GET "http://127.0.0.1:3000/api/user_profile?email=eq~admin@demo.com&sort=eq~id,desc" \
     -H "Content-Type: application/json"


# --- Product Category ---

# Get Product Categories (with and without sorting/limiting)
curl -X GET http://127.0.0.1:3000/api/product_category -H "Content-Type: application/json"

curl -X GET "http://127.0.0.1:3000/api/product_category?sort=eq~id,desc" -H "Content-Type: application/json"

curl -X GET "http://127.0.0.1:3000/api/product_category?limit=eq~1" -H "Content-Type: application/json"

# Create Product Category
curl -X POST http://127.0.0.1:3000/api/product_category \
     -H "Content-Type: application/json" \
     -d '{ "image_url": "https://placehold.co/300x200.png", "product_category_name": "YourCategoryName" }'

# Update Product Category (replace {categoryId} with the actual ID)
curl -X PUT http://127.0.0.1:3000/api/product_category/{categoryId} \
     -H "Content-Type: application/json" \
     -d '{ "image_url": "https://placehold.co/300x200.png", "product_category_name": "UpdatedCategoryName" }'

# Delete Product Category (replace {categoryId} with the actual ID)
curl -X DELETE http://127.0.0.1:3000/api/product_category/{categoryId} -H "Content-Type: application/json"



# --- Product ---

# Get Products (with and without sorting)
curl -X GET http://127.0.0.1:3000/api/product -H "Content-Type: application/json"

curl -X GET "http://127.0.0.1:3000/api/product?sort=eq~id,desc" -H "Content-Type: application/json"

# Create Product
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

# Update Product (replace {productId} with the actual ID)
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

# Delete Product (replace {productId} with the actual ID)
curl -X DELETE http://127.0.0.1:3000/api/product/{productId} -H "Content-Type: application/json"


# --- Customer ---

# Get Customers (with and without sorting/limiting)
curl -X GET "http://127.0.0.1:3000/api/customer?sort=eq~id,desc" -H "Content-Type: application/json"

curl -X GET http://127.0.0.1:3000/api/customer -H "Content-Type: application/json"

curl -X GET "http://127.0.0.1:3000/api/customer?limit=eq~1" -H "Content-Type: application/json"

# --- Order ---

# Get Orders
curl -X GET http://127.0.0.1:3000/api/order -H "Content-Type: application/json"


# --- Order Transaction ---

# Create Order Transaction
curl -X POST http://127.0.0.1:3000/api/order_transaction \
     -H "Content-Type: application/json" \
     -d '{
           "user_profile_id": "{userProfileId}",
           "customer_id": "{customerId}",
           "payment_method": "PaymentMethod",
           "order_status": "OrderStatus",
           "total": 0 
         }'

# Update Order Transaction (replace {orderTransactionId} with the actual ID)
curl -X PUT http://127.0.0.1:3000/api/order_transaction/{orderTransactionId} \
     -H "Content-Type: application/json" \
     -d '{
           "user_profile_id": "{userProfileId}",
           "customer_id": "{customerId}",
           "payment_method": "UpdatedPaymentMethod",
           "order_status": "UpdatedOrderStatus",
           "total": 123.45 
         }'

# Get Order Transactions (with and without sorting/limiting)
curl -X GET http://127.0.0.1:3000/api/order_transaction -H "Content-Type: application/json"

curl -X GET "http://127.0.0.1:3000/api/order_transaction?sort=eq~id,desc" -H "Content-Type: application/json"

curl -X GET "http://127.0.0.1:3000/api/order_transaction?limit=eq~1" -H "Content-Type: application/json"



# --- Order Transaction Item ---

# Get Order Transaction Items (with filters)
curl -X GET "http://127.0.0.1:3000/api/order_transaction_item?order_transaction_id=eq~{orderTransactionId}&sort=eq~id,desc" -H "Content-Type: application/json"

curl -X GET "http://127.0.0.1:3000/api/order_transaction_item?order_transaction_id=eq~{orderTransactionId}" -H "Content-Type: application/json"

curl -X GET "http://127.0.0.1:3000/api/order_transaction_item?order_transaction_id=eq~{orderTransactionId}&product_id=eq~{productId}" -H "Content-Type: application/json"

# Create Order Transaction Item
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

# Delete Order Transaction Item (replace {orderTransactionItemId} with the actual ID)
curl -X DELETE http://127.0.0.1:3000/api/order_transaction_item/{orderTransactionItemId} -H "Content-Type: application/json"
