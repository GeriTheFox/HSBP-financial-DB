CREATE TABLE type (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(128) NOT NULL
);

CREATE TABLE users (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    nick VARCHAR(50) NOT NULL,
    discordid VARCHAR(127),
    passwd VARCHAR(255),
    email VARCHAR(255),
    contact_1 VARCHAR(255),
    contact_2 VARCHAR(255),
    contact_3 VARCHAR(255),
    other VARCHAR(512),
    active CHAR(1) NOT NULL CHECK (active IN ('Y', 'N'))
);

CREATE TABLE expenses (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    type INT NOT NULL,
    in_out CHAR(1) NOT NULL CHECK (in_out IN ('I', 'O')),
    amount int NOT NULL,
    who INT NOT NULL,
    note VARCHAR(255),
    when TIMESTAMP NOT NULL,
    FOREIGN KEY (type) REFERENCES type(id),
    FOREIGN KEY (who) REFERENCES users(id)
);