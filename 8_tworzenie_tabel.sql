create database zad1;

use zad1;

CREATE TABLE zad1.OSOBY_1 (
    Nazwisko VARCHAR(30),
    Imie VARCHAR(20),
    PESEL CHAR(11)
);

CREATE TABLE zad1.OSOBY_2 (
    Nazwisko VARCHAR(30) NOT NULL,
    Imie_1 VARCHAR(20) NOT NULL,
    Imie_2 VARCHAR(20),
    Miasto VARCHAR(30) NOT NULL DEFAULT 'Poznan'
);

CREATE TABLE zad1.OSOBY_3 (
    Numer INT AUTO_INCREMENT PRIMARY KEY,
    Nazwisko VARCHAR(30) NOT NULL
);

describe osoby_1;

show columns from OSOBY_3;

show create table osoby_2;

drop table osoby_1;
drop table osoby_2;
drop table osoby_3;

CREATE TABLE Pracowncy (
    Id_pracownika INT AUTO_INCREMENT PRIMARY KEY,
    Nazwisko VARCHAR(30) NOT NULL,
    stanowisko VARCHAR(15) NOT NULL
);

CREATE TABLE Projekty (
    id_projektu INT AUTO_INCREMENT PRIMARY KEY,
    nazwa VARCHAR(150) NOT NULL,
    data_rozpoczecia TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Dzialy (
    id_dzialu CHAR(1) PRIMARY KEY,
    dzial_opis VARCHAR(15) NOT NULL
);

CREATE TABLE pracownicy1 (
    id_pracownika INT PRIMARY KEY AUTO_INCREMENT,
    nazwisko VARCHAR(30) NOT NULL,
    stanowisko VARCHAR(15) NOT NULL,
    id_dzialu CHAR(1) NOT NULL,
	FOREIGN KEY(id_dzialu) REFERENCES dzialy(id_dzialu)
);
  show tables ;
describe dzialy;