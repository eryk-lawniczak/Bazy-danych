create database Biblioteka;
use Biblioteka;

CREATE TABLE czytelnicy (
    idczytelnika INT NOT NULL AUTO_INCREMENT,
    Nazwisko VARCHAR(50) NOT NULL,
    Imie VARCHAR(30) NOT NULL,
    Kod CHAR(6) NOT NULL,
    Miejscowosc VARCHAR(30) NOT NULL,
    Adres VARCHAR(30) NOT NULL,
    PRIMARY KEY (idczytelnika)
);

CREATE TABLE ksiazka (
    idksiazki INT NOT NULL AUTO_INCREMENT,
    kateoria VARCHAR(20) NOT NULL,
    autor VARCHAR(60) NOT NULL,
    tytul VARCHAR(30) NOT NULL,
    wydawnictwo VARCHAR(30) NOT NULL,
    rokwydania CHAR(4),
    primary key(idksiazki)
);

CREATE TABLE wypozyczenie (
    datawyp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    idczytelnika INT NOT NULL,
    idksiazki INT NOT NULL,
    dataZwrPrze TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    dataZwrotu DATE NULL,
    PRIMARY KEY (datawyp),
    FOREIGN KEY (idczytelnika)
        REFERENCES czytelnicy (idczytelnika)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (idksiazki)
        REFERENCES ksiazka (idksiazki)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);
show tables;

insert into czytelnicy values 
(default , 'Kowalski', 'Jan', '60-543', 'Poznań', 'Kowalska 15'),
(default , 'Stefaniusz', 'Stefan', '50-543', 'Warszawa', 'Cebulowa 1'),
(default , 'Zatecky', 'Wiktor', '13-432', 'Gdańsk', 'Pumeska 15'),
(default , 'Waszkewycz', 'Piotr', '60-553', 'Piekło', 'Anielska 5'),
(default , 'Kappysław', 'Jakiśtam', '62-543', 'Poznań', 'Kowalska 15');

describe ksiazka;
insert into ksiazka values 
(default , 'Fantasy', 'J.R.R Tolskien', 'Hobbyt', '1993'),
(default , 'Fantasy', 'J.K. Rowling', 'Hobbyt', '1993'),
(default , 'Gastronimoia', 'Elon Musk', 'Hobbyt', '1993'),
(default , 'Naukowe', 'Tomek Sawer', 'Hobbyt',  '1993'),
(default , 'Post-Apo', 'Poternik Stefan', 'Hobbyt',  '1993');

Insert into wypozyczenie values
(1,6,default, adddate(now(), interval 60 day), '2012-01-26'),
(2,8,default, adddate(now(), interval 60 day), '2012-01-26'),
(3,7,default, adddate(now(), interval 60 day), '2012-01-26'),
(4,10,default, adddate(now(), interval 60 day), '2012-01-26'),
(5,9default, adddate(now(), interval 60 day), '2012-01-26');



