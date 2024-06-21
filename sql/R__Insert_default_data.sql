INSERT INTO Department (name)
VALUES ('IT'), ('Marketing')
ON CONFLICT DO NOTHING;
