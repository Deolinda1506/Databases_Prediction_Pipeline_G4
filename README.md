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



