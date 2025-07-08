# Databases_Prediction_Pipeline_G4

Final Report: Task 1 - MongoDB Data Cleaning and Implementation
Contributor: UMULISA Jolly
 Project: Database and Prediction Pipeline Assignment
 Task Focus: NoSQL (MongoDB) Implementation
 Dataset: Automobile Dataset (205 rows, 26 columns)
 
1. Objective of the Task
This task was focused on creating a clean and usable NoSQL database using MongoDB Atlas. The data used was a machine learning-relevant dataset containing automobile specifications. The goal was to:
Clean and prepare the data.


Insert it into MongoDB Atlas.


Share access with team members for integration in later tasks.


Document the collection structure in a schema diagram.


2. Data Cleaning and Preparation (Google Colab)
The dataset was cleaned using Python and Pandas in Google Colab:
Loaded the CSV file.


Replaced all ? entries with NaN.


Converted numerical columns from objects to appropriate numeric types.


Filled missing numerical data using column mean.


Dropped rows still containing missing values (mainly in categorical fields).


Result: Cleaned dataset had 203 complete records.
# Confirming row count
print(df.shape)  # Output: (203, 26)

3. MongoDB Atlas Setup
A cloud-hosted MongoDB Atlas instance was configured for the cleaned data:
Database Name: automobile_db


Collection Name: cars


Cluster: Cluster0


Username: myuser


Password: Jolie123


Access: Public (IP whitelist set to 0.0.0.0/0)


Connection String (For Teammates):
from pymongo import MongoClient
client = MongoClient("mongodb+srv://myuser:Jolie123@cluster0.0spffu3.mongodb.net/automobile_db?retryWrites=true&w=majority&appName=Cluster0")
db = client["automobile_db"]
collection = db["cars"]

Insertion Code:
data_dict = df.to_dict("records")
collection.insert_many(data_dict)

Verification Code:
print(collection.count_documents({}))  # Should output 203
4. MongoDB Collection Schema Diagram
The MongoDB collection schema was documented in a visual format using db diagram.io. Each document in the cars collection, You can find it in the google colab or the notebook if I can say.

5. Final Contribution Summary
Task


Load and clean raw dataset


Setup MongoDB Atlas cluster


Insert cleaned data


Share access credentials with team


Schema Diagram (ERD-style)



6. How Other Members Can Access the Data
Can connect to MongoDB from Colab or their application using:
client = MongoClient("mongodb+srv://myuser:Jolie123@cluster0.0spffu3.mongodb.net/automobile_db?retryWrites=true&w=majority&appName=Cluster0")
db = client["automobile_db"]
collection = db["cars"]

Can then use standard MongoDB operations like:
collection.find()
collection.find_one({"make": "toyota"})



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




