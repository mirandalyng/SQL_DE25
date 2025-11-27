CREATE TABLE
    students (name VARCHAR NOT NULL, age UINT8);

/* INSERT INTO
students (name, age)
VALUES
(NULL, 8),
('Amy', 5); */
DROP TABLE students;

/* 
CREATE TABLE
students (name VARCHAR UNIQUE, age UINT8);

INSERT INTO
students (name, age)
VALUES
('Amy', 13),
('Bill', 5);

INSERT INTO
students (name, age)
VALUES
('Bill', 5); */
CREATE TABLE
    students (name VARCHAR UNIQUE, age UINT8 CHECK (age >= 18));

INSERT INTO
    students (name, age)
VALUES
    ('Bill', 18);

FROM
    students;