DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions
(
    id SERIAL PRIMARY KEY,
    region TEXT NOT NULL
);

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    category TEXT NOT NULL
);

CREATE TABLE users 
(
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    regions_id INTEGER REFERENCES regions ON DELETE CASCADE
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    text TEXT NOT NULL,
    location TEXT NOT NULL,
    categories_id INTEGER REFERENCES categories ON DELETE CASCADE, 
    regions_id INTEGER REFERENCES regions ON DELETE CASCADE,
    user_id INTEGER REFERENCES users ON DELETE CASCADE
);