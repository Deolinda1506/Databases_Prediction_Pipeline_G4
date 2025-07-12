-- Create the trigger function

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

-- Create the trigger on the performance table

CREATE TRIGGER trg_log_price_change
AFTER UPDATE ON performance
FOR EACH ROW
EXECUTE FUNCTION log_price_change();
