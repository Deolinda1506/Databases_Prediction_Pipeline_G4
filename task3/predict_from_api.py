
import requests
import pandas as pd
import pickle

# -------------------------------
# 1. Fetch Latest Car from API
# -------------------------------

API_URL = "http://127.0.0.1:8000/cars/"
response = requests.get(API_URL)

if response.status_code != 200:
    raise Exception(f"API request failed with status code {response.status_code}")

cars_data = response.json()

if not cars_data:
    raise ValueError("No cars found in the API response")

# Get the latest entry (assuming last is latest)
latest_car = cars_data[-1]

# -------------------------------
# 2. Prepare DataFrame
# -------------------------------

# Convert to DataFrame for compatibility
df = pd.DataFrame([latest_car])

# Drop non-feature columns if any
df = df.drop(columns=["id"], errors="ignore")

# -------------------------------
# 3. Encode Categorical Columns
# -------------------------------

categorical_cols = ["make", "fuel-type", "num-of-doors"]
for col in categorical_cols:
    df[col] = df[col].astype("category").cat.codes

# -------------------------------
# 4. Load Model and Predict
# -------------------------------

with open("random_forest_car_price_model.pkl", "rb") as f:
    model = pickle.load(f)

prediction = model.predict(df)

print("Latest Car Data:", latest_car)
print(f"Predicted Price: {prediction[0]:,.2f} RWF")
