-- History table
CREATE TABLE price_history (
    history_id SERIAL PRIMARY KEY,
    performance_id INT,
    old_price FLOAT,
    new_price FLOAT,
    change_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Trigger Function
CREATE OR REPLACE FUNCTION log_price_change()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.price <> OLD.price THEN
        INSERT INTO price_history (performance_id, old_price, new_price)
        VALUES (OLD.performance_id, OLD.price, NEW.price);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger
CREATE TRIGGER trg_price_update
AFTER UPDATE ON performance
FOR EACH ROW
EXECUTE FUNCTION log_price_change();
