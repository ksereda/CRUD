create database crud;
use crud;

CREATE TABLE users(
    id BIGINT UNIQUE NOT NULL AUTO_INCREMENT,
    name VARCHAR(50),
    password VARCHAR(50),
    login VARCHAR(50) UNIQUE NOT NULL,
    PRIMARY KEY(id)
);