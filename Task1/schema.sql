-- Table: cars
CREATE TABLE cars (
    car_id SERIAL PRIMARY KEY,
    make VARCHAR(50),
    body_style VARCHAR(50),
    drive_wheels VARCHAR(50),
    engine_location VARCHAR(50)
);

-- Table: engine_specs
CREATE TABLE engine_specs (
    engine_id SERIAL PRIMARY KEY,
    car_id INT NOT NULL,
    engine_type VARCHAR(50),
    num_of_cylinders VARCHAR(20),
    engine_size INT,
    compression_ratio FLOAT,
    fuel_system VARCHAR(50),
    FOREIGN KEY (car_id) REFERENCES cars(car_id)
);

-- Table: performance
CREATE TABLE performance (
    performance_id SERIAL PRIMARY KEY,
    car_id INT NOT NULL,
    horsepower INT,
    city_mpg INT,
    highway_mpg INT,
    price FLOAT,
    FOREIGN KEY (car_id) REFERENCES cars(car_id)
);

-- Table: price_history (for logging price changes)
CREATE TABLE price_history (
    history_id SERIAL PRIMARY KEY,
    performance_id INT,
    old_price FLOAT,
    new_price FLOAT,
    change_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (performance_id) REFERENCES performance(performance_id)
);
