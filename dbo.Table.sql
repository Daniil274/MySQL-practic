CREATE TABLE sensors
(
	Id INT NOT NULL PRIMARY KEY,
	Token varchar(32),
	Registred date NULL,
	Activated BIT DEFAULT 0 
)
