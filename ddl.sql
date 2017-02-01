--DROP TABLE [eerd_loan];
--DROP TABLE [eerd_savings];
--DROP TABLE [eerd_checking];
--DROP TABLE [eerd_account];

CREATE TABLE [eerd_account] (
	account_id INT IDENTITY PRIMARY KEY,
	date_opened DATE NOT NULL,
	balance MONEY NOT NULL,
	account_type CHAR(1) NOT NULL
);

CREATE TABLE [eerd_checking] (
	account_id INT PRIMARY KEY FOREIGN KEY REFERENCES [eerd_account](account_id),
	service_charge MONEY
);

CREATE TABLE [eerd_savings] (
	account_id INT PRIMARY KEY FOREIGN KEY REFERENCES [eerd_account](account_id),
	interest_rate DECIMAL(5,4) NOT NULL
);

CREATE TABLE [eerd_loan] (
	account_id INT PRIMARY KEY FOREIGN KEY REFERENCES [eerd_account](account_id),
	interest_rate DECIMAL(5,4) NOT NULL,
	payment MONEY NOT NULL
);

INSERT INTO [eerd_account] (date_opened,balance,account_type) VALUES (GETDATE(),'-200','L');
INSERT INTO [eerd_loan] (payment,interest_rate,account_id) VALUES ('4',0.17,1);

INSERT INTO [eerd_account] (date_opened,balance,account_type) VALUES (GETDATE(),'1000','C');
INSERT INTO [eerd_checking] (service_charge,account_id) VALUES ('4',2);
