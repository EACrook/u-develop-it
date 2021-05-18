DROP TABLE IF EXISTS candidates;
DROP TABLE IF EXISTS parties;
DROP TABLE IF EXISTS voters;

-- parties table must be defined before candidates table as it's info is required for the foreign keY --
CREATE TABLE parties (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NUll,
    description TEXT
);

CREATE TABLE candidates (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    party_id INTEGER,
    industry_connected BOOLEAN NOT NULL,
    CONSTRAINT fk_party FOREIGN KEY (party_id) REFERENCES parties(id) ON DELETE SET NULL
);

-- DEFAULT is used if NOT NULL is absent to make sure a NULL value is not included and a prechosen default is --
-- CURRENT_TIMESTAMP will return the current date and time in the 2020-01-01 13:00:00 format --
-- we have set the CURRENT_TIMESTAMP as the DEFAULT below --
CREATE TABLE voters (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR (50) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);