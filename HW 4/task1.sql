DROP DATABASE IF EXISTS pet_database;
CREATE DATABASE pet_database;
USE pet_database;


DROP TABLE IF EXISTS petPet, petEvent;

CREATE TABLE petPet (
  petname VARCHAR(20) PRIMARY KEY,
  owner VARCHAR(45),
  species CHAR(1) CHECK (species IN ('M', 'F')),
  gender VARCHAR(15),
  birth DATE,
  death DATE
);


CREATE TABLE petEvent (
  petname VARCHAR(20),
  eventdate DATE,
  eventtype VARCHAR(15),
  remark VARCHAR(255),
  PRIMARY KEY (petname, eventdate),
  FOREIGN KEY (petname) REFERENCES petPet(petname) ON DELETE CASCADE
);

