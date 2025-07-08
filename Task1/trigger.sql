-- Step 1: Create the price_history table (if not already in schema.sql)

CREATE TABLE IF NOT EXISTS price_history (
    history_id SERIAL PRIMARY KEY,
    performance_id INT REFERENCES performance(performance_id),
    old_price FLOAT,
    new_price FLOAT,
    change_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Step 2: Create the trigger function

CREATE OR REPLACE FUNCTION log_price_change()
RETURNS TRIGGER AS $$
BEGIN
    -- Only log if price has changed
    IF NEW.price IS DISTINCT FROM OLD.price THEN
        INSERT INTO price_history (
            performance_id,
            old_price,
            new_price
        ) VALUES (
            OLD.performance_id,
            OLD.price,
            NEW.price
        );
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Step 3: Create the trigger on the performance table

CREATE TRIGGER trg_log_price_change
AFTER UPDATE ON performance
FOR EACH ROW
EXECUTE FUNCTION log_price_change();
