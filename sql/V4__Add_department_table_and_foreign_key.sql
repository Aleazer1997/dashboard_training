CREATE TABLE IF NOT EXISTS Department (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE
);

ALTER TABLE Employee ADD COLUMN department_id INTEGER;
ALTER TABLE Employee ADD CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES Department(id);
