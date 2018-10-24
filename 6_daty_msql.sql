use northwind_mysql;

/*
	nazwiska i imiona oraz wiek pracowników 
    dane posortuj według eirku ysk by osoby najstarsze były wypisane jako pierwsze
    nazstępnym kryterium nazwisko
*/

-- now
 select 
		lastname as nazwisko,
        firstname as imie,
		(year(now())- year(birthdate)) as wiek
from employees
order by 3 desc, 1;


-- datediff
select 
		lastname as nazwisko,
        firstname as imie,
		floor(datediff(curdate(), birthdate) / 365) as wiek
from employees
order by 3 desc, 1;

-- round datediff
select 
		lastname as nazwisko,
        firstname as imie,
		round(datediff(curdate(), birthdate) / 365 - 0.5, 0) as wiek
from employees
order by 3 desc, 1;

-- timestampdiff

select 
		lastname as nazwisko,
        firstname as imie,
		timestampdiff(year, birthdate, now()) as wiek
from employees
order by 3 desc, 1;

-- wypisz nazwiska i lata pracy

select
	timestampdiff(year, hiredate, curdate()) as liczba_lat,
    concat(firstname, '  ', lastname) as 'Pracownik'
from employees
order by 1 desc
limit 1;
        use northwind_mysql;