# Car Price Category Prediction API

This project demonstrates an end-to-end data pipeline that integrates relational and NoSQL databases, a FastAPI backend with CRUD operations, and a machine learning model using `RandomForestClassifier` to predict car price categories (`Low`, `Medium`, `High`). It is structured to fulfill the requirements of **Formative 1: Database - Prediction Pipeline**.

## Objectives

- Design and implement a relational database schema.
- Implement MongoDB collections matching the relational schema.
- Build CRUD API endpoints using FastAPI.
- Train and save a machine learning model using Scikit-learn.
- Fetch latest entries from the database and make predictions.


## Task 1 - Database Design & MongoDB

### Relational Database (PostgreSQL)

- **Tables:** `cars`, `users`, `performance`
- **Keys:** Primary and foreign keys defined
- **Automation:**
  - 1 Trigger: Logs deleted car records to an audit table.
  - 1 Stored Procedure: Auto-inserts into the performance table on car creation.

###  NoSQL - MongoDB

- collections match SQL schema.
- Designed with embedded documents where appropriate.

##  Task 2 - CRUD API (FastAPI)

###  Endpoints

| Method | Endpoint        | Description         |
|--------|------------------|---------------------|
| POST   | `/cars/`         | Create new car      |
| GET    | `/cars/`         | Read all cars       |
| GET    | `/cars/{id}`     | Read a specific car |
| PUT    | `/cars/{id}`     | Update a car        |
| DELETE | `/cars/{id}`     | Delete a car        |

- Uses PostgreSQL as the primary DB
- Input validation handled via **Pydantic models**
- API tested using **http://localhost:8000/docs**



## Task 3 - ML Model & Prediction Script

### Model

- `RandomForestClassifier` used to predict `price_class`
- Trained on features like:
- `engine-size`, `horsepower`, `city-mpg`, `highway-mpg`

### `Car_Price_Prediction_Notebook.ipynb`

- Handles data cleaning, EDA, training, evaluation.
- Saves model to `random_forest_car_price_model.pkl`.

### `prediction.py`

- Fetches latest record from API
- Loads trained model
- Outputs price prediction (`Low`, `Medium`, `High`)


## How to Run This Project

### Setup

# Clone the repository
https://github.com/Deolinda1506/Databases_Prediction_Pipeline_G4.git
Databases_Prediction_Pipeline_G4
