-- Stored Procedure: insert_performance
-- Inserts performance record only if the price is valid (non-negative)

CREATE OR REPLACE FUNCTION insert_performance(
    p_car_id INT,
    p_horsepower INT,
    p_city_mpg INT,
    p_highway_mpg INT,
    p_price FLOAT
)
RETURNS VOID AS $$
BEGIN
    -- Validate price is not null or negative
    IF p_price IS NULL OR p_price < 0 THEN
        RAISE EXCEPTION 'Invalid price: must be non-null and non-negative';
    END IF;

    -- Insert into performance table
    INSERT INTO performance (
        car_id, horsepower, city_mpg, highway_mpg, price
    )
    VALUES (
        p_car_id, p_horsepower, p_city_mpg, p_highway_mpg, p_price
    );
END;
$$ LANGUAGE plpgsql;
