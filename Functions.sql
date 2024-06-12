CREATE OR REPLACE FUNCTION whitefield_bangalore.GET_RANDOM_NUMBER(start_val INTEGER, end_val INTEGER)
RETURNS INTEGER AS $$
BEGIN
    RETURN floor(random() * (end_val - start_val + 1) + start_val);
END;
$$ LANGUAGE plpgsql;
