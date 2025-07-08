# Task 1 - Database Design (SQL + MongoDB)

## 📌 Overview

This task focuses on designing and implementing a normalized relational database using SQL and a corresponding document model in MongoDB. The dataset used is the [Automobile dataset](https://www.kaggle.com/datasets/toramky/automobile-dataset), which contains various attributes about cars, including technical specifications, performance metrics, and pricing.

---

## 🗃️ Relational Schema (SQL)

We normalized the dataset into **three main tables** plus a logging table, ensuring **3rd Normal Form (3NF)**:

### 📋 Tables:

1. **`cars`**
   - Contains basic car details like make, body style, and engine layout.
2. **`engine_specs`**
   - Technical details about the car's engine.
3. **`performance`**
   - Fuel economy, horsepower, and price.
4. **`price_history`**
   - Tracks all price changes for auditability.

### 🔐 Keys & Constraints:
- **Primary keys**: `car_id`, `engine_id`, `performance_id`
- **Foreign keys**:
  - `engine_specs.car_id` → `cars.car_id`
  - `performance.car_id` → `cars.car_id`
  - `price_history.performance_id` → `performance.performance_id`

---

## ⚙️ Stored Procedure

**File:** `stored_procedure.sql`

Defines a stored procedure `insert_performance(...)` which:
- Validates that the price is non-null and non-negative.
- Inserts the record into the `performance` table.

✅ Helps automate data validation before inserting new performance metrics.

---

## 🔄 Trigger

**File:** `trigger.sql`

Defines a trigger function and trigger:
- **Trigger:** `trg_log_price_change`
- Automatically logs price changes into the `price_history` table.
- Captures old and new price along with timestamp.

✅ Supports historical tracking of price changes for each car entry.

---

## 🍃 MongoDB Schema

**File:** `mongo_schema.json`

In MongoDB, the same data is modeled as a **single document per car**, including nested subdocuments:

- `engine_specs` and `performance` are embedded
- This structure optimizes for **read-heavy queries** and **document cohesion**

Example document:
```json
{
  "make": "audi",
  "body_style": "sedan",
  "drive_wheels": "fwd",
  "engine_location": "front",
  "engine_specs": {
    "engine_type": "mpfi",
    "num_of_cylinders": "four",
    "engine_size": 109
  },
  "performance": {
    "horsepower": 102,
    "city_mpg": 24,
    "price": 13950
  }
}
