-- #### TODO #######
-- add foreign keys
-- trinken/essen redudanz erklären
-- typen etc in enum -> eigene tabelle?
-- #################

-- Datenbank erzeugen
CREATE DATABASE HOCHZEITSPLANER;

-- Benutze für alles folgende die gerade eben erzeugte Datenbank
USE HOCHZEITSPLANER;


-- Erzeuge Entities

CREATE TABLE Hochzeitsveranstaltungen (
	hochzeitsID INT UNSIGNED UNIQUE NOT NULL AUTO_INCREMENT,
	PRIMARY KEY ( hochzeitsID )
);

CREATE TABLE Personen (
	personID INT UNSIGNED UNIQUE NOT NULL AUTO_INCREMENT,
	name VARCHAR(250) NOT NULL,
	adresse VARCHAR(250) NOT NULL,
	istDienstleister BOOL NOT NULL DEFAULT FALSE,
	PRIMARY KEY ( personID )
);

CREATE TABLE Telefonnummern (
	telefonnnummerID INT UNSIGNED UNIQUE NOT NULL AUTO_INCREMENT,
	telefonnnummer VARCHAR(100) NOT NULL,
	PRIMARY KEY ( telefonnnummerID )
);

CREATE TABLE EmailAdressen (
	emailAdresseID INT UNSIGNED UNIQUE NOT NULL AUTO_INCREMENT,
	emailAdresse VARCHAR(100) NOT NULL,
	PRIMARY KEY ( emailAdresseID )
);

CREATE TABLE Caterer (
	catererID INT UNSIGNED UNIQUE NOT NULL AUTO_INCREMENT,
	beschreibung VARCHAR(255),
	kontaktPerson INT UNSIGNED,
	PRIMARY KEY ( catererID ),
	FOREIGN KEY ( kontaktPerson ) REFERENCES Personen(personID)
		ON UPDATE CASCADE
		ON DELETE SET NULL
);

CREATE TABLE Aktionen (
	aktionID INT UNSIGNED UNIQUE NOT NULL AUTO_INCREMENT,
	datum DATETIME NOT NULL,
	dauer TIME NOT NULL,
	typ VARCHAR(250) NOT NULL,
	versteckt BOOL NOT NULL DEFAULT true,
	zustand VARCHAR(250) NOT NULL,
	PRIMARY KEY ( aktionID )
);

CREATE TABLE Essen (
	essenID INT UNSIGNED UNIQUE NOT NULL AUTO_INCREMENT,
	beschreibung VARCHAR (250),
	menge DOUBLE UNSIGNED NOT NULL,
	mengenbeschreibung VARCHAR(50) NOT NULL,
	PRIMARY KEY ( essenID )
);

CREATE TABLE Trinken (
	trinkenID INT UNSIGNED UNIQUE NOT NULL AUTO_INCREMENT,
	beschreibung VARCHAR (250),
	menge DOUBLE UNSIGNED NOT NULL,
	mengenbeschreibung VARCHAR(50) NOT NULL,
	PRIMARY KEY ( trinkenID )
);

CREATE TABLE Medien(
	mediumID INT UNSIGNED UNIQUE NOT NULL AUTO_INCREMENT,
	uri VARCHAR(250) NOT NULL UNIQUE,
	title VARCHAR(250) NOT NULL,
	beschreibung VARCHAR(250),
	PRIMARY KEY ( mediumID )
);

CREATE TABLE Belege(
	belegID INT UNSIGNED UNIQUE NOT NULL AUTO_INCREMENT,
	kosten DOUBLE UNSIGNED NOT NULL,
	title VARCHAR(250) NOT NULL,
	beschreibung VARCHAR(250), 
	PRIMARY KEY ( belegID )
);

CREATE TABLE Hilfsmittel (
	hilfsmittelID INT UNSIGNED UNIQUE NOT NULL AUTO_INCREMENT,
	title VARCHAR(250) NOT NULL,
	beschreibung VARCHAR(250),
	art VARCHAR(250),
	PRIMARY KEY ( hilfsmittelID )
);

CREATE TABLE Orte (
	ortID INT UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT,
	ort VARCHAR(250) NOT NULL,
	PRIMARY KEY ( ortID )
);


-- Erzeuge Relationen

CREATE TABLE Gaeste (
	hochzeitsID INT UNSIGNED NOT NULL,
	personID INT UNSIGNED NOT NULL,
	PRIMARY KEY ( hochzeitsID, personID ),
	FOREIGN KEY ( hochzeitsID ) REFERENCES Hochzeitsveranstaltungen(hochzeitsID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY ( personID ) REFERENCES Personen(personID)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE HochzeitsCaterer (
	hochzeitsID INT UNSIGNED,
	catererID INT UNSIGNED,
	PRIMARY KEY ( hochzeitsID, catererID ),
	FOREIGN KEY ( hochzeitsID ) REFERENCES Hochzeitsveranstaltungen(hochzeitsID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY ( catererID ) REFERENCES Caterer(catererID)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE Hochzeitspaare (
	hochzeitsID INT UNSIGNED,
	personID INT UNSIGNED,
	PRIMARY KEY ( hochzeitsID, personID ),
	FOREIGN KEY ( hochzeitsID ) REFERENCES Hochzeitsveranstaltungen(hochzeitsID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY ( personID ) REFERENCES Personen(personID)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE Hochzeitsaktionen (
	hochzeitsID INT UNSIGNED NOT NULL,
	aktionID INT UNSIGNED NOT NULL,
	PRIMARY KEY ( hochzeitsID, aktionID ),
	FOREIGN KEY ( hochzeitsID ) REFERENCES Hochzeitsveranstaltungen(hochzeitsID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY ( aktionID ) REFERENCES Aktionen(aktionID)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE Aktionsverantwortliche (
	aktionID INT UNSIGNED NOT NULL,
	personID INT UNSIGNED NOT NULL,
	PRIMARY KEY ( aktionID, personID ),
	FOREIGN KEY ( aktionID ) REFERENCES Aktionen(aktionID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY ( personID ) REFERENCES Personen(personID)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE Aktionsteilnehmner (
	aktionID INT UNSIGNED NOT NULL,
	personID INT UNSIGNED NOT NULL,
	PRIMARY KEY ( aktionID, personID ),
	FOREIGN KEY ( aktionID ) REFERENCES Aktionen(aktionID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY ( personID ) REFERENCES Personen(personID)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE CatererEssen (
	catererID INT UNSIGNED NOT NULL,
	essenID INT UNSIGNED NOT NULL,
	PRIMARY KEY ( catererID, essenID ),
	FOREIGN KEY ( catererID ) REFERENCES Caterer(catererID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY ( essenID ) REFERENCES Essen(essenID)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE CatererTrinken (
	catererID INT UNSIGNED NOT NULL,
	trinkenID INT UNSIGNED NOT NULL,
	PRIMARY KEY ( catererID, trinkenID ),
	FOREIGN KEY ( catererID ) REFERENCES Caterer(catererID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY ( trinkenID ) REFERENCES Trinken(trinkenID)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE Aktionsorte (
	aktionID INT UNSIGNED NOT NULL,
	ortID INT UNSIGNED NOT NULL,
	PRIMARY KEY ( aktionID, ortID ),
	FOREIGN KEY ( aktionID ) REFERENCES Aktionen(aktionID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY ( ortID ) REFERENCES Orte(ortID)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE Aktionsmedien (
	aktionID INT UNSIGNED NOT NULL,
	mediumID INT UNSIGNED NOT NULL,
	PRIMARY KEY ( aktionID, mediumID ),
	FOREIGN KEY ( aktionID ) REFERENCES Aktionen(aktionID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY ( mediumID ) REFERENCES Medien(mediumID)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE Medienbelege (
	mediumID INT UNSIGNED NOT NULL,
	belegID INT UNSIGNED NOT NULL,
	PRIMARY KEY ( mediumID, belegID ),
	FOREIGN KEY ( mediumID ) REFERENCES Medien(mediumID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY ( belegID ) REFERENCES Belege(belegID)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE Aktionsbelege (
	aktioNID INT UNSIGNED NOT NULL,
	belegID INT UNSIGNED NOT NULL,
	PRIMARY KEY ( aktioNID, belegID ),
	FOREIGN KEY ( aktionID ) REFERENCES Aktionen(aktionID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY ( belegID ) REFERENCES Belege(belegID)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE Aktionshilfsmittel (
	aktionID INT UNSIGNED NOT NULL,
	hilfsmittelID INT UNSIGNED NOT NULL,
	PRIMARY KEY ( aktionID, hilfsmittelID ),
	FOREIGN KEY ( aktionID ) REFERENCES Aktionen(aktionID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY ( hilfsmittelID ) REFERENCES Hilfsmittel(hilfsmittelID)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE Hilfsmittelbelege (
	hilfsmittelID INT UNSIGNED NOT NULL,
	belegID INT UNSIGNED NOT NULL,
	PRIMARY KEY ( hilfsmittelID, belegID ),
	FOREIGN KEY ( hilfsmittelID ) REFERENCES Hilfsmittel(hilfsmittelID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY ( belegID ) REFERENCES Belege(belegID)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE Personenmailadresse (
	personID INT UNSIGNED NOT NULL,
	emailAdresseID INT UNSIGNED NOT NULL,
	PRIMARY KEY ( personID, emailAdresseID )	,
	FOREIGN KEY ( personID ) REFERENCES Personen(personID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY ( emailAdresseID ) REFERENCES Emailadressen(emailAdresseID)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE Personentelefonnummer (
	personID INT UNSIGNED NOT NULL,
	telefonnnummerID INT UNSIGNED NOT NULL,
	PRIMARY KEY ( personID, telefonnnummerID ),
	FOREIGN KEY ( personID ) REFERENCES Personen(personID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY ( telefonnnummerID ) REFERENCES Telefonnummern(telefonnnummerID)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);