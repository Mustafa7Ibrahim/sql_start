-- pharmacy table
CREATE TABLE pharmacy(
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    image VARCHAR(255) NOT NULL
);

-- item table
CREATE TABLE item(
    id INT NOT NULL PRIMARY KEY,
    pharmacy_id INT NOT NULL,
    quantity INT NOT NULL,
    isBig BOOLEAN NOT NULL,
    FOREIGN KEY (pharmacy_id) REFERENCES pharmacy(id)
);