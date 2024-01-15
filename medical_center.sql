DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE insurance
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    street_address TEXT NOT NULL, 
    phone_number TEXT NOT NULL
);

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    street_address TEXT, 
    phone_number TEXT, 
    insurance_id INTEGER REFERENCES insurance ON DELETE SET NULL,
    insurance_number TEXT
);

CREATE TABLE specialty
(
    id SERIAL PRIMARY KEY,
    specialty TEXT NOT NULL
);

CREATE TABLE doctors 
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    specialty_id INTEGER REFERENCES specialty ON DELETE SET NULL
);

CREATE TABLE diseases
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE visits
(
    id SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    doctor_id INTEGER REFERENCES doctors ON DELETE SET NULL,
    patient_id INTEGER REFERENCES patients ON DELETE SET NULL,
    disease_id INTEGER REFERENCES diseases ON DELETE SET NULL
);