use northwind_mysql;

-- który z pracowników jest najstarszy - podzapytanie 
select 
	firstname as imie, 
	lastname as nazwisko,
	year(birthdate)
from
	employees
where 
	year(birthdate) = (select
					min(year(birthdate))
                    from
						employees);

-- pracownicy powyżej średniej

select 
	firstname as imie, 
	lastname as nazwisko,
	timestampdiff(year, birthdate, now())
from
	employees
where 
	year(now()) - year(birthdate) > (select
					avg(year(now()) - year(birthdate))
                    from
						employees);
                        
