create database zad3;
use zad3;

CREATE TABLE PERSONEL (
    id_pracownicy INT NOT NULL AUTO_INCREMENT,
    nazwisko VARCHAR(50) NOT NULL,
    imie VARCHAR(50) NOT NULL,
    inicial VARCHAR(20) NOT NULL,
    dzial VARCHAR(30) NOT NULL,
    telefon VARCHAR(20) NOT NULL,
    specjaln VARCHAR(50) NULL,
    uwagi TEXT NULL,
    nagrody INT NULL,
    data_zatr DATE NOT NULL,
    stopien VARCHAR(20) NOT NULL,
    zwolniony BOOL NOT NULL,
    pelny_etat BOOL NOT NULL,
    wydajnosc DECIMAL(5 , 2 ) NOT NULL,
    wskaznik DECIMAL(5 , 2 ) NOT NULL,
    pensja DECIMAL(5 , 2 ) NOT NULL,
    stanowisko VARCHAR(20) NOT NULL,
    staz DATE NOT NULL,
    adres1 VARCHAR(50) NOT NULL,
    adres2 VARCHAR(50) NULL,
    miasto VARCHAR(50) NOT NULL,
    stan BOOL NOT NULL,
    kod CHAR(6) NOT NULL,
    primary key(id_pracownicy)
);

CREATE TABLE KLIENT (
    id_klienta INT NOT NULL AUTO_INCREMENT,
    klient VARCHAR(50) NOT NULL,
    nazwisko VARCHAR(50) NOT NULL,
    imie VARCHAR(50) NOT NULL,
    adres VARCHAR(50) NOT NULL,
    miasto VARCHAR(50) NOT NULL,
    stan BOOL NOT NULL,
    kod CHAR(6) NOT NULL,
    telefon VARCHAR(20) NOT NULL,
    transakcje INT NOT NULL,
    PRIMARY KEY (id_klienta)
);

CREATE TABLE DOSTAWCY (
    id_dostaw INT NOT NULL AUTO_INCREMENT,
    dostawca VARCHAR(50) NOT NULL,
    adres1 VARCHAR(50) NOT NULL,
    adres2 VARCHAR(50) NULL,
    miasto VARCHAR(50) NOT NULL,
    stan BOOL NOT NULL,
    kod CHAR(6) NOT NULL,
    telefon VARCHAR(20) NOT NULL,
    kontakt VARCHAR(50),
    tel_wew VARCHAR(10),
    warunki TEXT,
    rabat DECIMAL(5 , 2 ),
    PRIMARY KEY (id_dostaw)
);

CREATE TABLE towary (
    id_towaru INT NOT NULL AUTO_INCREMENT,
    id_dostaw INT NOT NULL,
    data_zamow DATE NOT NULL,
    nazwa VARCHAR(50) NOT NULL,
    opis TEXT NOT NULL,
    czas_realiz INT NOT NULL,
    cena DECIMAL(10 , 2 ) NOT NULL,
    il_do_zam INT NOT NULL,
    il_na_stan INT NOT NULL,
    nie_kont VARCHAR(20) NOT NULL,
    koszt DECIMAL(10 , 2 ) NOT NULL,
    komentarz TEXT NULL,
    PRIMARY KEY (id_towaru),
    INDEX towary_fkIndex1 (id_dostaw),
    FOREIGN KEY (id_dostaw)
        REFERENCES dostawcy (id_dostaw)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE TRANSAK (
    id_pracow INT NOT NULL,
    id_klienta INT NOT NULL,
    id_towaru INT NOT NULL,
    data_tran DATE NOT NULL,
    ilosc INT NOT NULL,
    nr_zam INT NOT NULL,
    uwagi TEXT NULL,
    faktura INT NOT NULL,
    INDEX TRANSAK_FKIndex1 (id_towaru),
    INDEX TRANSAK_FKIndex2 (id_klienta),
    INDEX TRANSAK_FKIndex3 (id_pracow),
    FOREIGN KEY (id_towaru)
        REFERENCES towary (id_towaru)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (id_klienta)
        REFERENCES KLIENT (id_klienta)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (id_pracow)
        REFERENCES PERSONEL (id_pracownicy)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);