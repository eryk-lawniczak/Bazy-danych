SELECT @@datadir;
use olejki_mysql;

select * from olejki;

-- nazwy lacinskie olejkow: roza mirra imbir

SELECT nazwalacinska
FROM olejki
WHERE nazwaolejku IN ('róża', 'mirra', 'imbir');

-- wszystkie zapachy o identyfikatorach 4 6 10
SELECT
	zapach
FROM
	zapachy
Where IDZapachu IN (4,6,10);

-- 7 pierwszych ostrzeżeń i opisów z tabeli ostrzeżenia

SELECT
	ostrzezenie, opis
from
	ostrzezenia
limit 7;

-- przy uzyciu Between nazwy olejkow zaczynajace sie literami z zakresu D-L wlacznie

select 
	nazwaolejku
from
	olejki
where 
	nazwaolejku between 'd%' and 'm%';
    
select 
	nazwaolejku
from
	olejki
where 
	left(nazwaolejku, 1) between 'd' and 'l'; -- left(kolumna, ilosc znakow)
    
-- z tabeli olejki wyswietl id olejku i nazwy olejkow nie zaczynajace sie na litere e

select idolejku, nazwaolejku
from olejki
where nazwaolejku not like 'e%';

-- z tabeli ostrzeżenia wyświetl ID ostrzerzenia i opis dla ostrzeżenia nie zaczynającego się od N i Id wiekszego od 7

select idostrzezenia, opis
from ostrzezenia
where idostrzezenia not like 'n%'
		and idostrzezenia > 7;