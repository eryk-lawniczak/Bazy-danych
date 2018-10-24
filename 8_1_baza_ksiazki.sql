create database zad2;

use zad2;

CREATE TABLE Książki (
    id INT,
    autorId INT,
    tytul VARCHAR(15)
);

ALter table książki add primary key (id);
alter table książki drop primary key;
alter table książki add primary key (id, tytyl);
alter table książki add column ISBN varchar(13);

create table osoby_u
(
id_osoby int auto_increment primary key,
PESEL char(11) not null unique
);

CREATE TABLE osoby (
    id_osoby INT PRIMARY KEY,
    plec CHAR(1) CHECK (plec IN ('k' , 'm')),
    dzial CHAR(2) CHECK (dzial LIKE '[A-Z][0-9]'),
    Placa INT CHECK (placa BETWEEN 800 AND 1000)
);

CREATE TABLE test (
    kolor ENUM('zielony', 'niebieski', 'czerwony')
);

CREATE TABLE test1 (
    kolor SET('zielony', 'czerwony', 'niebieski')
);

describe test1;

CREATE TABLE osoby2 (
    id_osoby INT PRIMARY KEY,
    plec CHAR(1),
    CONSTRAINT zla_plec CHECK (plec IN ('k' , 'm')),
    dzial CHAR(2),
    CONSTRAINT zly_dzial CHECK (dzial LIKE '[A-Z][0-9]'),
    Placa INT,
    CONSTRAINT zly_zakres_placy CHECK (placa BETWEEN 800 AND 1000)
);

show tables;
