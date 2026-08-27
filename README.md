# Tech Notes
## Docker
    - Docker run all service from docker compose: `docker compose up`

    - add -d to run in background `docker compose up -d`

    - run docker only 1 service for example run db only `docker compose up -d db`
    
    - generate model: `docker compose exec web bin/rails generate model PaymentMethod name:string code:string enabled:boolean`

    - migrate model: `docker compose exec web bin/rails db:migrate`


# Milestone Notes
## Milestone 4.A — Simulated Payment Gateway

### Current plan:

### 4.A.1 — New Rails Project [HERE]
+ New, separate Rails application
+ Docker
+ PostgreSQL
+ Basic Rails setup
+ Web + API in the same Rails application

### 4.A.2 — Payment Methods
+ Payment method model
+ Payment method data
+ Enable/disable payment methods
+ Payment methods are independent of processing delay

### 4.A.3 — Payment Method API
+ API returns available payment methods
+ Digital Bank uses this API to display payment options to the user

### 4.A.4 — Gateway Web
+ Web interface for viewing deposit/payment requests
+ View transaction details
+ View transaction status

### 4.A.5 — Gateway API
+ Receive payment/deposit requests from Digital Bank
+ Create payment transaction
+ Return appropriate API response

### 4.A.6 — Shared API Key Authentication
+ Digital Bank → Gateway API authentication
+ Shared API key stored in .env
+ No API-key model/database storage

### 4.A.7 — Payment Transaction Processing
+ Payment starts as pending
+ Each transaction gets its own randomly generated processing delay
+ Delay: randomly 1–10 minutes
+ Delay is not associated with the payment method

Example:

Transaction 1
Payment method: Virtual Account
Random delay: 7 minutes

Transaction 2
Payment method: E-Wallet
Random delay: 2 minutes

Transaction 3
Payment method: Virtual Account
Random delay: 9 minutes

The same payment method can therefore have different delays.

### 4.A.8 — RabbitMQ Integration
+ Publish payment-processing message
+ Consumer/worker processes the transaction asynchronously
+ Simulate the 1–10 minute processing period
+ Avoid blocking the API request with sleep
+ Eventually produce a payment result

### 4.A.9 — Payment Status

+ Possible states:
  - pending
  - successful
  - failed

### 4.A.10 — Callback / Webhook

After processing:

Payment Gateway
      │
      ▼
Webhook
      │
      ▼
Digital Bank

Digital Bank receives the payment result asynchronously.

### 4.A.11 — Security & Request Validation
+ API key validation
+ Request validation
+ Amount validation
+ Payment method validation
+ Prevent invalid/unauthorized requests

### 4.A.12 — Digital Bank Integration

Final flow:

User
 │
 ▼
Digital Bank
 │
 │ Get payment methods
 ▼
Payment Gateway API
 │
 ▼
User selects payment method
 │
 ▼
Digital Bank sends payment request
 │
 ▼
Payment Gateway
 │
 ├── Create transaction
 ├── status = pending
 └── random delay = 1–10 minutes
        │
        ▼
     RabbitMQ
        │
        ▼
   Async processing
        │
        ▼
 successful / failed
        │
        ▼
     Webhook
        │
        ▼
   Digital Bank
        │
        ▼
Balance + Transaction

