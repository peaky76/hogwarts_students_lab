DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS houses;

CREATE TABLE houses (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    logo_url VARCHAR(255)
);

CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    second_name VARCHAR(255),
    house VARCHAR(255),
    age INT
);

