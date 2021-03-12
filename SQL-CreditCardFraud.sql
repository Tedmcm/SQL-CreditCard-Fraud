DROP TABLE IF EXISTS credit_holder
DROP TABLE IF EXISTS credit_card
DROP TABLE IF EXISTS merchant
DROP TABLE IF EXISTS merchant_category
DROP TABLE IF EXISTS transaction

CREATE TABLE credit_holder (
	id INT PRIMARY KEY,
	name VARCHAR(200)
);
SELECT * FROM credit_holder

CREATE TABLE credit_card (
	card VARCHAR(20) PRIMARY KEY,
	id_card_holder INT,
	FOREIGN KEY(id_card_holder) REFERENCES credit_holder(id)
	);

SELECT * FROM credit_card

CREATE TABLE merchant_category (
	id INT PRIMARY KEY,
	name VARCHAR(200)
);

SELECT * FROM merchant_category

CREATE TABLE merchant (
	id INT PRIMARY KEY,
	name VARCHAR(200),
	id_merchant_category INT,
	FOREIGN KEY(id_merchant_category) REFERENCES merchant_category(id)
);

SELECT * FROM merchant


CREATE TABLE transaction (
  id INT NOT NULL,
  date timestamp NOT NULL,
  amount float,
  card VARCHAR(20),
  id_merchant INT,
  FOREIGN KEY (card) REFERENCES credit_card (card),
  FOREIGN KEY (id_merchant) REFERENCES merchant (id),
  PRIMARY KEY (id)
);
SELECT * FROM transaction
